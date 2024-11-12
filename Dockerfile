FROM python:3.12

# Añadir repositorio de OpenJDK y luego instalar dependencias
RUN apt-get update && \
    apt-get install -y \
    curl \
    nodejs \
    ruby \
    php-cli && \
    apt-get install -y openjdk-11-jdk -t bullseye-backports && \
    apt-get clean

# Configura el directorio de trabajo
WORKDIR /app

# Copia el código del proyecto
COPY languages/ /app/languages/
COPY flask-app/ /app/

# Instala Flask
RUN pip install flask

# Expone el puerto de la aplicación Flask
EXPOSE 5000

# Comando para iniciar la aplicación Flask
CMD ["python", "app.py"]
