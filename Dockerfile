# Usa una imagen base que tenga Docker
FROM docker:19.03.12

# Instalar Node.js
RUN apk add --no-cache nodejs npm

# Instalar docker-compose
RUN apk add --no-cache python3 py3-pip && \
    pip3 install docker-compose

# Crear el directorio de trabajo
WORKDIR /app

# Copiar el archivo de configuración package.json y package-lock.json
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto del código de la aplicación
COPY . .

# Exponer el puerto en el que se ejecuta la aplicación (por defecto 3000)
EXPOSE 3000

# Iniciar la aplicación
CMD ["npm", "start"]
