install:
	bundle install

db-setup:
	bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails db:seed

tests:
	bundle exec rspec --format documentation
