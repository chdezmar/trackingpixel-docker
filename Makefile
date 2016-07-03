# Creates the required database for the app
setup-database:
	docker-compose run web bin/setup
