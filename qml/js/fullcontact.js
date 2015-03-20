function call(param){
   // Contains dict.

   //        @param :: name of call :: str
   //        Returns
   //
   //        FullCall :: https://api.fullcontact.com/v2/+call[param]
   //        Call :: req[param]
   //
   //        Example Output :: person
   //        Object { FullCall: "https://api.fullcontact.com/v2/person.json", Call: "person.json" }

    var url = 'https://api.fullcontact.com/v2/';
    var person = 'person.json';
    var disposable = 'email/disposable.json';
    var name_normalizer = 'name/normalizer.json';
    var name_deducer = 'name/deducer.json';
    var name_similarity = 'name/similarity.json';
    var name_stats = 'name/stats.json';
    var name_parser = 'name/parser.json';
    var address_locationNormalizer = 'address/locationNormalizer.json';
    var address_locationEnrichment = 'address/locationEnrichment.json';
    var batch = 'batch.json';
    var req = {'person':person, 'disposable': disposable, 'normalizer': name_normalizer, 'deducer': name_deducer, 'similarity': name_similarity, 'stats': name_stats, 'parser': name_parser, 'locationNormalizer': address_locationNormalizer, 'locationEnrichment': address_locationEnrichment, 'batch': batch};
    var out = {'FullCall':url + req[param], 'Call': req[param]};
    return out
}


