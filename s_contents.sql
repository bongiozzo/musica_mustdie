select title, content, fullname, content_type, date_format(content_date, '%d.%m.%Y') as content_date_format
  from contents, newsmakers
 where contents.newsmaker_id = newsmakers.newsmaker_id
   and contents.content_id in ((select content_id 
                                  from bands_contents 
                                 where band_id = ?)
                                 union 
                               (select content_id 
                                  from albums_contents, albums
                                 where albums_contents.album_id = albums.album_id 
                                   and band_id = ?))
order by content_date;