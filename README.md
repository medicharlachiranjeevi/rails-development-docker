# Passenger-Rails docker
# For Development
## Docker for hosting a Rails production app in Phusion Passenger running
 	git clone https://github.com/medicharlachiranjeevi/phusion-passenger-docker-rails.git
## prerequisites must install docker and docker-compose
### for Docker https://docs.docker.com/v17.12/install/
### for Docker-compose https://docs.docker.com/compose/install/#upgrading

# ENV in .env
    GIT_URL=https://<user>:<password>@<gitserver>/<path>/<repo>.git

    RUBY_VER=2.0.0

    change db-name,db-password,SECRET_KEY in .env file

    SECRET_KEY_BASE=3eaf1ffa19d5bfd3ac139af1f4c4b9f3;

    POSTGRES_DB=postgres

    POSTGRES_USER=postgres

    POSTGRES_PASSWORD=chiru

## Running your Rails application in Phusion Passenger

	docker-compose build

  	docker-compose up -d
# For bunlde install and migrations

	docker-compose exec web bash
        cd /var/www/html/yourapp
        bundle install
        rake bd:create
        rake db:migrate
        service nginx reload

# For logs

  	docker-compose logs web
# For backup database and restore
     cat dumpfile | docker-compose exec postgres psql -Upostgres
