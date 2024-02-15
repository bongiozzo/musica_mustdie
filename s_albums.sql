select style_ai, band, album, album_year, songs, description
  from styles, bands, albums
 where styles.style_id = albums.style_id 
   and albums.band_id = bands.band_id
   and bands.band_id = ?
 order by album_year;

