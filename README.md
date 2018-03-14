# Warehouse Application for CS425

This is the final project for CS425: Database Organization during the Spring 2018 Semester at Illinois Institute of Technology.
The application is written in Ruby using the Rails framework.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

© Markiyan Varhola, Spring 2018 @ IIT
