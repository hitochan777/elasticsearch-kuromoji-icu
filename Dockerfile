ARG es_version
FROM docker.elastic.co/elasticsearch/elasticsearch:${es_version}

RUN bin/elasticsearch-plugin install -h

RUN bin/elasticsearch-plugin install analysis-kuromoji && bin/elasticsearch-plugin install analysis-icu
