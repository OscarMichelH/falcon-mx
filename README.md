# Falcon MX

## Introducción 
FALCON (Fetal Alcohol Espectrum Latin American Consortium) – México actualmente está en la fase de planificación de un proyecto a nivel latinoamericano para averiguar la magnitud y el impacto de la salud de los niños cuyas madres se expusieron a alcohol, tabaco y drogas durante el embarazo. El proyecto está planeado para empezar su investigación en mujeres de la ciudad de Monterrey, y esta primera fase se llevará a cabo con investigadores del Hospital San José, entre ellos el Dr. Augusto Rojas quien servirá como el cliente de nuestro sitio web y representativo del consorcio FALCON  México. 

Como apoyo para este proyecto, se tiene propuesto crear una página web que ayuda a difundir y dar a conocer los objetivos del consorcio, que son el de brindar información a la población local para prevenir complicaciones a la salud de los niños afectados, además de servir también como una herramienta donde los investigadores puedan aplicar cuestionarios de diagnóstico a los pacientes involucrados en este proyecto y visualizar los resultados generales que se vayan obteniendo.

## Table of contents

* [Client Details](#client-details)
* [Environment URLS](#environment-urls)
* [The Team](#team)
* [Management resources](#management-resources)
* [Development](#development)
* [Setup the project for development](#setup-the-project-for-development)
* [Stop the project](#stop-the-project)
* [Debugging](#debugging)
* [Running tests](#running-tests)
* [Checking code for potential issues](#checking-code-for-potential-issues)

### Client Details

| Name               	    | Email             | Role                |
| ------------------------- | ----------------- | ------------------  |
|  Dr. Augusto Rojas | XXX  | Client  |
|  Dr. Miguel del Campo | XXX  | Client  |

### Environment URLS

* **Production** - [Site](https://falcon-mx.herokuapp.com) 
* **Development** - [localhost:3000](localhost:3000)

### Equipo de desarrollo

**DWeb - ENE - MAY 2019**

| Name           				| Email             		| Role        |
| ---------------------------- 	| ------------------------- | ----------- |
| Oscar Michel Herrera 	| oscarmichelh@gmail.com	| Scrum Master / Development |
| Ivan Eduardo Escalante Muñoz | Ivan.escalante.m@gmail.com	| Development |
| Arturo Rojas Ortiz | a01039185@itesm.mx	| Product Owner / Development |
| David Martinez De Silva | Dmtzds@gmail.com | Development |

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/OscarMichelH/falcon-mx)
* [Backlog](#) - Check Project inside this repository.
* [Design](https://www.figma.com/file/M7cF5AJQcHuR9B5lUF7LsDlI/falcon-mx?node-id=0%3A1) - Check screens on Figma
* [Heroku](#) 
* [Documentation](https://docs.google.com/document/d/1jP-n8mDId2S0_CWuAF_EurVlkxabR36NJNl0eDVC1PQ/edit?usp=sharing)

## Development

### Windows
* Install Ruby 2.5.3 with DevKit from https://rubyinstaller.org/downloads/
* Install PostgreSQL version <= 10 from https://www.postgresql.org/download/windows/
* On Cmd or PowerShell
\
`gem install rails -v 5.2.2.1`

### Linux
* RVM
\
`$ curl -sSL https://get.rvm.io | bash -s stable`
* Ruby – Version 2.5.3
\
`$ rvm use ruby-2.5.3 --default`
* Rails – Version 5.2.2.1
\
`$ gem install rails -v 5.2.2.1`

### Setup the project for development

We will use the basic tools that come with rails. (rails server, test, and coonsole).

1. Clone this repository into your local machine

```bash
$ git clone https://github.com/OscarMichelH/falcon-mx.git
```
2. Install dependencies:

```
$ bundle install
````

3. Setup the database:
```
$ rails db:drop
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

4. Start the application:

```
$ rails s
```

Once you see an output like this:

```
=> Booting Puma
=> Rails 5.2.2.1 application starting in development
=> Run `rails server -h` for more startup options
*** SIGUSR2 not implemented, signal based restart unavailable!
*** SIGUSR1 not implemented, signal based restart unavailable!
*** SIGHUP not implemented, signal based logs reopening unavailable!
Puma starting in single mode...
* Version 3.12.0 (ruby 2.5.3-p33), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://0.0.0.0:3000
Use Ctrl-C to stop
```

This means the project is up and running.

### Stop the project

In order to stop the project just hit Ctrl-C on the terminal where rails server is running.

### Running tests

To run all tests, you can do:

```
$ rspec 
```

---
### Setup TODO LIST
- [X] Setup Project
- [X] Setup Deployment
- [X] Integrar bootstrap
- [X] Integrar rspec

---

### Sprint 1 / Feb 9 - Mar 5
- [X] Instalación y setup de herramientas (Postgresql, Ruby on Rails)
- [X] Crear repositorio Github
- [X] Diseñar el estilo del sitio
- [X] Seleccionar y diseñar la información que se presentará en la página principal.
- [X] Crear la pantalla de inicio
- [X] Crear la pantalla de Directorio de Ayuda
- [X] Agregar el contenido revisado a la pantalla de inicio y al directorio de ayuda.
- [X] Implementar en la página de Inicio la forma de login.
- [X] Agregar funcionalidad al login para acceder como administrador.
- [X] Crear la pantalla de Lista de Investigadores
- [X] Crear la pantalla de Nuevo Investigador
- [X] Agregar funcionalidad para  eliminar usuarios de la lista de Investigadores. 
- [X] Agregar funcionalidad para editar el usuario y contraseña de un usuario en la lista de Investigadores.
- [X] Pruebas de privilegios de administrador/investigador.
- [X] Estilizar frontend en pantallas según Figma

---

### Sprint 2 / Mar 6 - Abr 2
- [ ] Obtener la revisión final del cuestionario que se aplicará en la investigación
- [ ] Diseñar el cuestionario para su uso en el sitio
- [ ] Diseñar la base de datos que almacenará los resultados del cuestionario
- [ ] Desarrollar la base de datos en Postgresql
- [ ] Agregar funcionalidad al login para acceder como Investigador
- [ ] Crear la página de Nuevo Cuestionario
- [ ] Desarrollar la forma que se usará para contestar las preguntas del Cuestionario
- [ ] Crear la página de Resultados
- [ ] Crear la página de Resultados Crudo
- [ ] Ligar la base de datos a la tabla de resultados de la página de Resultados Crudos
- [ ] Agregar funcionalidad a la página de resultados crudos para poder manipular la tabla de resultados
- [ ] Agregar permisos a la página de resultados crudos para que un resultado solo pueda ser modificado por el usuario que lo subió
- [ ] Pruebas de modificación de la base de datos y permisos
- [ ] Pruebas con el cliente del proceso de llenado de cuestionarios

### Sprint 3 / Abr 3 - Abr 30
- [X] Idear como será la presentación del reporte de resultados procesados con el cliente.
- [X] Investigar sobre gems para exportación de tablas en archivos .xls
- [X] Puebas de exportación de resultados de cuestionarios.
- [X] Crear enlance de descarga de resultados de cuestionarios
- [X] Agregar enlace a la página de Resultados Gráficos.
- [X] Obtener la preguntas y los valores de riesgo para la encuesta de autodiagnóstico.
- [X] Integración de todas las páginas y pruebas generales asimilando el rol de un usuario público, un investigador y un administrador.
- [X] Hosteo de base de datos
- [X] Deploy de aplicacion en internet
- [X] Integracion y configuración de aplicación en producción (Credenciales, base de datos, dns)
- [X] Demostración final con el cliente y retroalimentación.
- [X] Entrega del producto final.
- [X] Revisión del proyecto.
