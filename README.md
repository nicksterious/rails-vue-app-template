# Rails 6 backend with Vue 3 frontend

### Installation

You need git and Docker installed and running.

`git clone git@github.com:nicksterious/rails-vue-app-template.git`

Create an .env file as follows:

```
# .env
PASSWORD=whatever
```

Then start the stack using:

`docker-compose up webapp`

Then visit `http://<your-host-name>` to get started


### Tests

`docker-compose run tests`

### Notes
* Including associated records with a large list of objects is not a good practice
* Movies load and show their actors only when requested (viewing a movie page)
* Actors load their movie history only when requested (viewing an actor's profile)


### TODO
* Instead of Rails/MariaDB the application may be more feasible to develop using ArangoDB/Foxx or any graph database that exposes HTTP data endpoints
* Actors' top 5 co-actors
* Pagination on movies index
* More tests
* Using placeholders to replace missing images comes with a bug that prevents movie detail view poster from updating during navigation