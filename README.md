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

Then visit `http://<your-host-name>` to browse.



### Tests

`docker-compose run tests`



### Notes
* Data imports via rake task / service at application container boot
* Including associated records with a large list of objects is not a good practice (eg for each movies list all actors), I'm not doing it
* Instead, movies load and show their actors only when viewing a movie's details
* Actors load their movie history only when viewing an actor's profile
* There's a request that data import should be done in a Sidekiq job that may be fired by a controller method, I've added sidekiq, the container, configurations, a controller to trigger the action but not adding at this time the UI feature to trigger the import.



### TODO
* Instead of Rails/MariaDB the application may be more feasible to develop using ArangoDB/Foxx or any graph database that exposes HTTP data endpoints
* Actors' top 5 co-actors
* Pagination on movies index
* Improve coverage
* Using placeholders to replace missing images comes with a bug that prevents movie detail view poster from updating during navigation