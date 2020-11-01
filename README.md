# AgentK

## This is a Rails App which is not suitable for deploying right now.

Stack used: SQLite, Ruby, Rails.

## Installation

Make sure you have latest Ruby installed on your machine.

Clone the repository and run the following commands :

```
bundle install
yarn install
```

These will install the necessary dependencies. Next, you need to create the database by running the following commands :

```
rake db:create # to create the database.
rake db:migrate # to migrate the database and get all the schema up and running.
```

To start the server, please open two tabs and run the following commands (this is for development):

```
bundle exec rails server # in tab 1
bin/webpack-dev-server # in tab 2
```

## Backstory

This was created during live streams at my YouTube channel. Link to the videos :-

* Part 1 ([Last Commit](https://github.com/shobhitic/agentk/commit/0f66e5157543d40492db1210232c151f7a94d6bd)) - https://www.youtube.com/watch?v=JnEvCiDfbEI

