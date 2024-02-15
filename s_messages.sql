select user_name, message, date_format(message_time, '%d.%m.%Y %H:%i') as message_time_format
  from messages, users
 where messages.user_id = users.user_id
   and topic_id = ?
 order by message_time;