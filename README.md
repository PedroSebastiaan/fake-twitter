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