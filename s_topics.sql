select topics.topic_id, title
  from bands_topics, topics
 where band_id = ?
   and bands_topics.topic_id = topics.topic_id
 order by topic_id