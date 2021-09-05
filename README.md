# Fake Twitter App

This is an application for DesafioLatam's bootcamp, RoR module.

## Instial Config

Gemset config: 

Ruby version use in this project is 2.7.3.

Rails version use in this project is ~> 5.2.6.

## Components

The basic components of this proyect comprise:

```bash
# tweets scaffold
rails g scaffold tweet
```
```bash
# likes model
rails g model like
```
```bash
# follows model
rails g model follows
```
```bash
# home/index controller
rails g controller home index
```

```bash
# for future implementations
rails active_storage:install
```

## Gemfile

The gems added to this proyect are:

```bash
# PostgreSQL to heroku deploy
gem 'pg', group: :production
```

```bash
# Bootstrap
gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails'
```

```bash
# Devise
gem 'devise'
gem 'devise_token_auth'
```

```bash
# Rack-cors
gem 'rack-cors'
```

```bash
# Gravatar (for future implementation)
gem 'gravatar_image_tag', github: 'mdeering/gravatar_image_tag'
gem 'gravtastic'
gem 'image_processing'
```

```bash
# Kaminari
gem 'kaminari'
```

```bash
# ActiveAdmin
gem 'activeadmin'
```

```bash
# ActiveAdmin's plus integrations with:
gem 'cancancan'
gem 'draper'
gem 'pundit'

```

## User and Sessions

Sessions and users fluxes was provided by devise gem.

## Admin Panel

Admin panel and added interactions was provided by activeadmin gem.

## Links to the deploy
[User side](https://quiet-garden-33176.herokuapp.com/)

[Admin side](https://quiet-garden-33176.herokuapp.com/admin)

### Admin's credentials
email: admin@gmail.com

password: 123123

## For Api's usage
Auth method: http basic authentication

name: pedro

password: 123123

### Routes

For last 50 tweets: http://localhost:3000/api/v1/controller/news (get)

For tweets between two dates (example): http://localhost:3000/api/v1/controller/2021-09-05/2021-09-10 (get)

For tweet create: http://localhost:3000/api/v1/controller/create (post)

You body must be like: 

```json
{
    "tweet": {
        "content": "Here your content"
    }
}
```
