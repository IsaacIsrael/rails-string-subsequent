# The Challenge Ruby on Rails and React Challenge

Build a Ruby on Rails api-only backend and a React.js frontend to communicate with the backend.

## Features

- Authentication using email (Signup, Login and logout)
- Given two strings A and B, determine if B is a non-continuous substring of A
- Store the history of the user calculation
- User ability to remove a calculation from their submission history
- Ability to see the matching characters of B in A as underlined characters

---

## Ruby version

`2.5.3`

---

#### Base URL

The base URL of the API is `/api/`. Feel free to test the API using [Postman](https://www.getpostman.com/) or in the console directly.

---

## System dependencies

This project have dependencies on [heroku cli](https://devcenter.heroku.com/articles/heroku-cli#download-and-install) installed on your machine

---


## Set Up

To start the project to you will need to run the follow commands

```bash
bundle install
rails db:create
rails db:migrate
yarn --cwd client install
```
---

## How to run the test suite

To run the test you will need to run the follow commands

```bash
rspec
```

---

## How to run developemnt environment

To run front-end and back-end at once run

```bash
rails start
```

To run back-end you will need to run

```bash
bundle exec rails s -p 3001
```

To run front-end you will need to run

```bash
yarn --cwd client start
```


