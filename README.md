# README


# マイグレーション
docker compose run --rm app bundle exec ridgepole -c config/database.yml -s primary -a -f db/Schemafile

# Rspec
docker compose run --rm app bundle exec rspec spec/...

# Annotate
docker compose run --rm app bundle exec annotaterb models