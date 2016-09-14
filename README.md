# Skins Showcase

## Usage

### Prepare environment variables

Copy `.env_example` and create a new file called `.env`.
In `.env`, define all environment variables.

### Commands to run

```
$ git clone https://github.com/meanbeans/skin_showcase.git
$ cd skin_showcase
$ bundle install
$ bin/rails db:create # only for the first time
$ bin/rails db:migrate
```

### Docker

Use of docker is strongly advised in order to have a consistent
development and test environment.

1. [Install Docker](https://docs.docker.com/)
2. Go to the project folder
3. `$ docker-compose build`
4. `$ docker-compose up`
5. `$ docker-compose run web rails db:create`
6. `$ docker-compose run web rails db:migrate`
7. `$ docker-compose run web rails db:seed`

### Run tests using docker

```
# Prepare test DB
$ docker-compose run -e "RAILS_ENV=test" web rake db:create db:migrate

# Run the tests in docker
$ docker-compose run -e "RAILS_ENV=test" web rake test
```

### Useful rake tasks

```
# Populate champions
$ docker-compose run web rails model:populate_champions

# Delete champions
$ docker-compose run web rails model:delete_champions

# Populate skins
$ docker-compose run web rails model:populate_skins

# Delete skins
$ docker-compose run web rails model:delete_skins
```
