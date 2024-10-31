
# SecureGuard

**SecureGuard** es un sistema de gestión de seguridad que integra un backend construido con Django y Django REST Framework, y un frontend con React. Utiliza PostgreSQL como base de datos relacional y MongoDB para almacenar documentos no relacionales.

## Tecnologías

- **Frontend**: React, JavaScript
- **Backend**: Python, Django, Django REST Framework
- **Bases de Datos**: PostgreSQL, MongoDB

## Estructura del Proyecto

```
SecureGuard/
│
├── backend/            # Backend Django con API REST
│   ├── manage.py
│   ├── settings.py     # Configuración de base de datos y API
│   └── ...             # Otros archivos de Django
│
├── frontend/           # Frontend React
│   ├── src/
│   └── public/
│
├── docker-compose.yml  # (Opcional) Docker para desarrollo y despliegue
├── README.md           # Este archivo
└── .gitignore          # Archivos y directorios a ignorar por git
```

## Requisitos Previos

Asegúrate de tener instalados los siguientes programas:

- Python 3.x
- Node.js y npm
- PostgreSQL
- MongoDB (opcional)

## Instalación y Configuración

### 1. Clonar el Repositorio

```bash
git clone https://github.com/SecureGuardPascual/Risk-management.git
cd Risk-management
```

### 2. Configurar el Backend

#### 2.1 Crear un entorno virtual y activar

```bash
cd backend
python -m venv venv
source venv/bin/activate  # En Windows: venv\Scripts\activate
```

#### 2.2 Instalar dependencias

```bash
pip install -r requirements.txt
```

#### 2.3 Configurar la base de datos

Edita el archivo `settings.py` en la sección de **DATABASES**:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': '',
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': '',
    }
}

# Configuración para MongoDB
MONGODB = {
    'NAME': '',
    'HOST': '',
    'PORT': 
}
```

#### 2.4 Ejecutar migraciones y levantar el servidor

```bash
python manage.py migrate
python manage.py runserver
```

### 3. Configurar el Frontend

```bash
cd frontend
npm install
npm start
```

El frontend estará corriendo en `http://localhost:3000`.

## Uso

Una vez que todo está corriendo, puedes acceder al frontend en `http://localhost:3000` y el backend en `http://localhost:8000/api/`.

### Rutas del API

- **/api/users/**: Gestión de usuarios
- **/api/security/**: Gestión de eventos y alertas de seguridad

### Frontend

El frontend permite visualizar, crear, editar y eliminar eventos de seguridad, y gestionar los usuarios del sistema.

## Contribución

1. Haz un fork del repositorio.
2. Crea una rama para tu feature (`git checkout -b feature-nueva-funcionalidad`).
3. Haz commit de tus cambios (`git commit -m 'Añadido nueva funcionalidad'`).
4. Haz push a la rama (`git push origin feature-nueva-funcionalidad`).
5. Abre un Pull Request.

## Licencia

