require 'pg'

conn = PG.connect(dbname: 'postgres', host: 'localhost', user: 'postgres')
q = ARGV.first || 'SELECT * FROM things;'
p conn.exec(q).to_a
