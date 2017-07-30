build:
	docker build -t bodorrio .

test: build
	docker run bodorrio bundle exec rspec

lint: build
	docker run bodorrio bundle exec rubocop

run:
	docker run -p 4000:8080 bodorrio