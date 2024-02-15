select band, relations.description 
  from relations, bands, bands_relations
 where bands_relations.relation_id in 
       (select relation_id 
          from bands_relations 
         where band_id = ?)
   and bands_relations.relation_id = relations.relation_id
   and bands_relations.band_id = bands.band_id
   and bands.band_id <> ?;