build:
	docker build -t bodorrio .

test: unit-tests integration-tests linting-tests

unit-tests:
	@docker run -ti --rm \
		-v `pwd`:/code \
		--env-file ./spec/unit/.env \
		bodorrio bundle exec rspec spec/unit

integration-tests:
	@docker run -ti --rm \
		-v `pwd`:/code \
		--env-file ./spec/integration/.env \
		bodorrio bundle exec rspec spec/integration

linting-tests:
	@docker run -ti --rm \
		-v `pwd`:/code \
		bodorrio bundle exec rspec spec/linting

lint:
	docker run -ti --rm -v `pwd`:/code bodorrio bundle exec rubocop

run:
	docker run --rm \
		-p 4000:8080 \
		-v `pwd`:/code \
		--env-file .env \
		--name the_bodorrio_is_comming \
		bodorrio

run-example:
	@docker run --rm \
		-p 4000:8080 \
		-v `pwd`:/code \
		--env-file ./spec/integration/.env \
		--name the_bodorrio_is_comming_example \
		bodorrio
