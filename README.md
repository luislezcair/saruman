# Sinergia-I

[![Build Status](https://travis-ci.com/luislezcair/maxwell.svg?token=ZTezY5pdSseyfJxAaZH6&branch=master)](https://travis-ci.com/luislezcair/maxwell)

Sistema de control de inventario de Sinergia.

## Demo

Deploy en un click a Heroku. Usuario y contraseña por defecto `admin` y `admin-123`.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/luislezcair/saruman)

## Instalación

Clonar el repositorio e instalar las dependencias

```
$ git clone https://github.com/luislezcair/saruman.git
$ bundle install --path=vendor/bundle
$ yarn install
```

Crear la base de datos y cargar los datos iniciales

```
$ bundle exec rails db:migrate
$ bundle exec seeds:initial_data
```

Crear el usuario administrador. Por defecto usuario `admin` y contraseña `admin-123`

```
$ bundle exec seeds:admin_user
```

¡Listo! Sólo queda ejecutar la aplicación:

```
$ bundle exec rails s
```


## Testing

La mayor parte de la aplicación está cubierta con pruebas de integración utilizando RSpec:

```
$ bundle exec rspec
```
