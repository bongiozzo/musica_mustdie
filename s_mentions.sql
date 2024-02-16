select title, user_name, message, date_format(message_time, '%d.%m.%Y %H:%i') as message_time_format
  from messages, users, topics
 where messages.user_id = users.user_id
   and topics.topic_id = messages.topic_id
   and messages.topic_id not in (select topic_id from bands_topics where band_id = ?)
   and messages.topic_id not in (120496)
   and message like ?
 order by message_time;