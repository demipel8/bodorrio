build:
	docker build -t bodorrio .

test:
	docker run -ti --rm -v `pwd`:/code --name the_bodorrio_is_comming bodorrio bundle exec rspec

lint:
	docker run --rm -v `pwd`:/code --name the_bodorrio_is_comming bodorrio bundle exec rubocop

run:
	docker run --rm -p 4000:8080 -v `pwd`:/code --name the_bodorrio_is_comming bodorrio
