build:
	docker build -t bodorrio .

test:
	docker run -ti -v `pwd`:/code bodorrio bundle exec rspec

lint:
	docker run -v `pwd`:/code bodorrio bundle exec rubocop

run:
	docker run -p 4000:8080 -v `pwd`:/code bodorrio
