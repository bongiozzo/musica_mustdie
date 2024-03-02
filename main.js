// Required Modules
const fs = require("fs");
const { exec } = require("child_process");
const mariadb = require("mariadb");
const Mustache = require('mustache');
const styles_template = read_content('t_styles.md');
const band_template = read_content('t_band.md');
const styles_sql = read_content('s_styles.sql');
const bands_sql = read_content('s_bands.sql');
const albums_sql = read_content('s_albums.sql');
const relations_sql = read_content('s_relations.sql');
const topics_sql = read_content('s_topics.sql');
const messages_sql = read_content('s_messages.sql');
const mentions_sql = read_content('s_mentions.sql');
const contents_sql = read_content('s_contents.sql');

function read_content(filename) {
   return fs.readFileSync(filename).toString();
}

function get_filename(str) {
    return str.replace(/[ -\/\\:*?"<>]/g, "").toLowerCase();
}

const pool = mariadb.createPool({
  "socketPath": "/run/mysqld/mysqld.sock",
  "database": "musica",
  "user": "serpo",
  "connectionTimeout": 15});

// Optimize code using async methods

async function main() {
    let conn;
    try {
        conn = await pool.getConnection();
        const styles = await conn.query(styles_sql);
        if (!styles.length) return;
//        exec("rm output/*");
        let style_albums = [];
        let index = 0;
        do {
            const element = styles[index];
            element['header'] =  (style_albums.length == 0);
            style_albums.push(element);
            if (index + 1 == styles.length || styles[index+1]['style_ai'] != element.style_ai) {
                let filename = get_filename(element.style_ai);
                fs.writeFileSync(`output/style_${filename}.md`,(Mustache.render(styles_template, { styles : style_albums })));
                style_albums = [];
            }
            index++;
        } while (index < styles.length);

        const bands = await conn.query(bands_sql);

        for (let band_index = 0; band_index < bands.length; band_index++) {
            const band = bands[band_index];
            const albums = await conn.query(albums_sql, [band.band_id]);
            const relations = await conn.query(relations_sql, [band.band_id, band.band_id]);
            const topics = await conn.query(topics_sql, [band.band_id]);
            const mentions = band.band.length > 2 ? await conn.query(mentions_sql, [band.band_id, `%${band.band}%`]) : [];
            const contents = await conn.query(contents_sql, [band.band_id, band.band_id]);
            
            for (let index = 0; index < topics.length; index++) {
                const element = topics[index];
                element['messages'] = await conn.query(messages_sql, [element.topic_id]);
            }
            let filename = get_filename(band.band);
            fs.writeFileSync(`output/band_${filename}.md`,(Mustache.render(band_template, { band : band.band,
                                                                                     description : band.description,
                                                                                          albums : albums, 
                                                                                       relations : relations, 
                                                                                        contents : contents, 
                                                                                          topics : topics,
                                                                                        mentions : mentions})));
        }

    } catch (err) {
        throw err;
    } finally {
        pool.end();
    }
}

main();