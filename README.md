# README


# マイグレーション
bundle exec ridgepole -c config/database.yml -s primary -a -f db/Schemafile 

# Rspec
bundle exec rspec spec/...