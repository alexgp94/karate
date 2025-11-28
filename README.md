# Karate QA Automation - ServeRest API

## 1. Objetivo

Crear una suite de pruebas automatizadas para la API de Usuarios de [ServeRest](https://serverest.dev/) utilizando *
*Karate DSL**.

## 2. Estructura del Proyecto

```txt
karateTest
│── src
│   └── test
│       └── java
│           └── automationapi
│               └── serverest
│                   ├── data
│                   │   ├── helpers
│                   │   │   └── dataGenerator.js
│                   │   └── schemas
│                   │       └── usuario-schema.json
│                   ├── features
│                   │   ├── create-users.feature
│                   │   ├── delete-users.feature
│                   │   ├── get-users.feature
│                   │   └── update-users.feature
│                   ├── UsersRunner.java
│                   └── ExamplesTest
│── resources
│   └── karate-config.js
│── pom.xml

```

## 3. Características Principales

✔️ Tests de creación, obtención, actualización y eliminación de usuarios.

✔️ Generación dinámica de datos mediante JavaScript helpers.

✔️ Validación de respuestas usando JSON Schemas.

✔️ Ejecución con JUnit + Karate Runner.

✔️ Configuración centralizada con karate-config.js.

## 4. Configuración

1. Clonar el repositorio:

```bash
git clone https://github.com/alexgp94/karate
cd karate
mvn clean install
```

Configurar la URL base de la API en karate-config.js:

```
function fn() {
  var config = {};
  config.baseUrl = 'https://serverest.dev/';
  return config;
}
```

Configurar la ruta del karate-config.js a la carpeta resources se debe actualziar en el pom tambien:

```
 <testResource>
    <directory>src/test/resources</directory>
    <includes>
        <include>karate-config.js</include>
    </includes>
 </testResource>
```

## 5. Ejecución de Tests

Ejecutar desde IDE: Ejecutar UsersRunner.java.

Ejecutar con Maven:

```bash
mvn clean test 
```

```bash
mvn clean test -Dkarate.options="--tags @get-test-01" 
```

Nota: Los tests se ejecutan correctamente si UsersRunner.java está configurado con la ruta de los feature files, por
ejemplo:

## 6. Funcionalidades Automatizadas

GET /usuarios: Obtener la lista de todos los usuarios.

POST /usuarios: Registrar un nuevo usuario.

GET /usuarios/{_id}: Obtener un usuario por ID.

PUT /usuarios/{_id}: Actualizar un usuario existente.

DELETE /usuarios/{_id}: Eliminar un usuario del sistema.

## 7. Estrategia de Automatización

Uso de feature files separados por endpoint.

Validación de esquemas JSON para asegurar la integridad de los datos.

Manejo de datos dinámicos mediante dataGenerator.js.

Escenarios positivos y negativos para cada endpoint en el create-users.feature

Runners centralizados (UsersRunner.java) para ejecutar toda la suite.

## 8. Generación de Datos de Prueba

dataGenerator.js genera nombres y emails aleatorios:

El nombre solo contiene letras.

El email se genera con inicial del primer nombre + apellido completo + número aleatorio.

## 9. Reportes

Karate genera reportes HTML en:

```bash
target/karate-reports/karate-summary.html
```
