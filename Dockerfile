# Utilizar la imagen oficial de Python 3.14, basada en Debian Slim, que incluye Python y las herramientas básicas sobre una distribución Debian ligera.
FROM python:3.14-slim

# Evitar que Python escriba archivos .pyc en el disco
ENV PYTHONDONTWRITEBYTECODE=1

# Evitar que Python almacene en búfer la salida de consola (útil para ver los logs en Docker)
ENV PYTHONUNBUFFERED=1

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo de requerimientos
COPY requirements.txt /app/

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo el contenido de la carpeta actual al directorio de trabajo en el contenedor
COPY . /app/

# Exponer el puerto 8000
EXPOSE 8000

# Comando para arrancar el servidor de desarrollo de Django expuesto al exterior
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
