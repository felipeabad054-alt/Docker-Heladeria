# 🍦 Aplicación Web de Heladería con Docker

Aplicación web funcional para la gestión de sabores de una heladería.

El sistema permite realizar operaciones CRUD sobre una base de datos PostgreSQL mediante una arquitectura de tres capas:

- Frontend desarrollado con React.
- Backend desarrollado con Node.js y Express.
- Base de datos PostgreSQL.
- Despliegue mediante Docker y Docker Compose.

---

# 📋 Descripción del proyecto

Este proyecto consiste en una aplicación web para administrar los sabores disponibles en una heladería.

El usuario puede:

- Registrar nuevos sabores.
- Consultar los sabores existentes.
- Editar la información de un sabor.
- Eliminar sabores.
- Visualizar precio, stock y descripción.
- Mantener la información almacenada mediante persistencia de datos.

La aplicación se ejecuta utilizando tres contenedores Docker:

1. Contenedor del Frontend.
2. Contenedor del Backend.
3. Contenedor de PostgreSQL.

Además, se construyen dos imágenes Docker propias:

- `heladeria-frontend`
- `heladeria-backend`

La base de datos utiliza la imagen oficial:

- `postgres:17`

---

# 🎯 Objetivo

Desarrollar e implementar una aplicación web funcional para una heladería, utilizando una arquitectura de tres capas y permitiendo realizar operaciones CRUD sobre una base de datos PostgreSQL.

El despliegue se realiza mediante Docker Compose para garantizar que el Frontend, Backend y la Base de Datos se ejecuten en contenedores independientes y se comuniquen correctamente dentro de una red Docker.

---

# 🏗️ Arquitectura del sistema

La aplicación utiliza una arquitectura de tres capas:

```text
┌──────────────────────────────┐
│       Usuario/Navegador      │
└───────────────┬──────────────┘
                │
                ▼
┌──────────────────────────────┐
│       Frontend - React       │
│       Puerto: 5173           │
└───────────────┬──────────────┘
                │ HTTP / Axios
                ▼
┌──────────────────────────────┐
│ Backend - Node.js + Express  │
│       Puerto: 5000           │
└───────────────┬──────────────┘
                │ SQL / pg
                ▼
┌──────────────────────────────┐
│     Base de datos PostgreSQL │
│ Puerto interno: 5432         │
│ Puerto externo: 5433         │
└──────────────────────────────┘

✽✽Flujo de funcionamiento
El usuario interactúa con la interfaz desarrollada en React.
React realiza peticiones HTTP al Backend utilizando Axios.
Express recibe las solicitudes y ejecuta la lógica del CRUD.
El Backend utiliza el paquete pg para conectarse con PostgreSQL.
PostgreSQL almacena y devuelve la información.
El Backend responde al Frontend en formato JSON.
React actualiza dinámicamente la interfaz.

🛠️ Tecnologías utilizadas
✽✽Frontend
    React
    Vite
    JavaScript
    Axios
    Bootstrap
    HTML
    CSS
✽✽Backend
    Node.js
    Express
    JavaScript
    CORS
    dotenv
    pg
    Nodemon
✽✽Base de datos
  PostgreSQL 17

✽✽Contenedores y despliegue
  Docker
  Docker Desktop
  Docker Compose
  Dockerfile
  Volúmenes Docker
  Redes internas de Docker Compose

✽✽Control de versiones
  Git
  GitHub
📁 Estructura del proyecto
heladeria-docker/
│
├── backend/
│   ├── src/
│   │   ├── config/
│   │   │   └── db.js
│   │   │
│   │   ├── controllers/
│   │   │   └── saborController.js
│   │   │
│   │   ├── models/
│   │   │   └── saborModel.js
│   │   │
│   │   ├── routes/
│   │   │   └── saborRoutes.js
│   │   │
│   │   ├── app.js
│   │   └── server.js
│   │
│   ├── .dockerignore
│   ├── .env
│   ├── .env.example
│   ├── Dockerfile
│   ├── package.json
│   └── package-lock.json
│
├── frontend/
│   ├── src/
│   │   ├── services/
│   │   │   └── saborService.js
│   │   │
│   │   ├── App.jsx
│   │   ├── App.css
│   │   ├── index.css
│   │   └── main.jsx
│   │
│   ├── public/
│   ├── .dockerignore
│   ├── .env
│   ├── .env.example
│   ├── Dockerfile
│   ├── package.json
│   ├── package-lock.json
│   └── vite.config.js
│
├── database/
│   └── init.sql
│
├── .gitignore
├── docker-compose.yml
└── README.md
📂 Descripción de las carpetas
backend

Contiene la API REST desarrollada con Node.js y Express.

✽✽backend/src/config
Contiene la configuración de conexión con PostgreSQL.

✽✽backend/src/models
Contiene las consultas SQL utilizadas para:
Consultar sabores.
Crear sabores.
Actualizar sabores.
Eliminar sabores.

✽✽backend/src/controllers
Contiene la lógica que recibe las solicitudes HTTP y devuelve las respuestas.

✽✽backend/src/routes

Contiene las rutas o endpoints de la API REST.

✽✽backend/src/app.js
Configura Express, CORS, JSON y las rutas principales.

✽✽backend/src/server.js

Inicia el servidor y comprueba la conexión con PostgreSQL.
frontend

Contiene la interfaz desarrollada con React.

✽✽frontend/src/services

Contiene las funciones de Axios para comunicarse con el Backend.

✽✽frontend/src/App.jsx

Contiene la interfaz principal y la lógica del CRUD.

✽✽frontend/src/App.css

Contiene los estilos específicos de la aplicación.

✽✽frontend/src/main.jsx

Es el punto de entrada de React.

✽✽database

Contiene el archivo SQL que se ejecuta automáticamente cuando PostgreSQL se inicializa por primera vez.



✽✽database/init.sql
crea la tabla sabores e inserta registros iniciales.

🗄️ Estructura de la base de datos

La aplicación utiliza una tabla llamada:

sabores
Campos
Campo	Tipo	Descripción
id	SERIAL	Identificador único
nombre	VARCHAR(100)	Nombre del sabor
precio	NUMERIC(10,2)	Precio del producto
stock	INTEGER	Cantidad disponible
descripcion	TEXT	Descripción del sabor
creado_en	TIMESTAMP	Fecha de creación
Script SQL
CREATE TABLE IF NOT EXISTS sabores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK (precio >= 0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
    descripcion TEXT,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
🌐 Endpoints de la API

✽✽La URL base del Backend es:
http://localhost:5000

✽✽La URL base de los sabores es:
http://localhost:5000/api/sabores

✽✽Consultar todos los sabores
GET /api/sabores
Ejemplo:
http://localhost:5000/api/sabores

✽✽Consultar un sabor por ID
GET /api/sabores/:id
http://localhost:5000/api/sabores/1

✽✽POST /api/sabores
{
  "nombre": "Maracuyá",
  "precio": 2.80,
  "stock": 25,
  "descripcion": "Helado tropical de maracuyá"
}


