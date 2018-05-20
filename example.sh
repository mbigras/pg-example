#!/usr/bin/env bash
# Complete Postgres and pg example
# https://stackoverflow.com/questions/4683057/simple-example-of-postgres-query-in-ruby/50436321#50436321

db=pgexampledb

docker rm -f $db &> /dev/null
docker run -itd --name $db -p 5432:5432 postgres:10

sleep 3 # wait for postgres to start

docker exec -u postgres $db psql -c "
	CREATE TABLE things (
		id serial PRIMARY KEY,
		name varchar (50) NOT NULL
	);

	INSERT INTO things (name) VALUES ('foo');
	INSERT INTO things (name) VALUES ('bar');
	INSERT INTO things (name) VALUES ('baz');
"

docker exec -u postgres $db psql -c 'SELECT * FROM things;'
#  id | name
# ----+------
#   1 | foo
#   2 | bar
#   3 | baz
# (3 rows)

ruby <<EOF
require 'pg'

conn = PG.connect(dbname: 'postgres', host: 'localhost', user: 'postgres')
q = ARGV.first || 'SELECT * FROM things;'
p conn.exec(q).to_a
EOF
# [{"id"=>"1", "name"=>"foo"}, {"id"=>"2", "name"=>"bar"}, {"id"=>"3", "name"=>"baz"}]

docker rm -f $db