FROM ubuntu:latest

# Instala dependencias para cada lenguaje
RUN apt-get update && \
    apt-get install -y python3 nodejs ruby go openjdk-11-jdk && \
    apt-get clean

# Configura el directorio de trabajo
WORKDIR /app

# Copia el código del proyecto
COPY languages/ /app/languages/
COPY flask-app/ /app/

# Instala Flask
RUN python3 -m pip install flask

# Expone el puerto de la aplicación Flask
EXPOSE 5000

# Comando para iniciar la aplicación Flask
CMD ["python3", "app.py"]
