# Postgres example

> Example using the pg gem

## Installation

```
git clone https://github.com/mbigras/pg-example
cd pg-example
bundle install
```

## Usage

```
./setup
ruby query.rb
[{"id"=>"1", "name"=>"foo"}, {"id"=>"2", "name"=>"bar"}, {"id"=>"3", "name"=>"baz"}]
ruby query.rb "INSERT INTO things (name) VALUES ('catdog');"
ruby query.rb
[{"id"=>"1", "name"=>"foo"}, {"id"=>"2", "name"=>"bar"}, {"id"=>"3", "name"=>"baz"}, {"id"=>"4", "name"=>"catdog"}]
```
