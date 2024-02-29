# Use the official Node.js image as the base image
FROM node:21-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Genera el cliente de Prisma. Asegúrate de tener tu esquema Prisma listo.
RUN npx prisma generate

# Build the TypeScript code
RUN npx tsc

# Construye tu aplicación Next.js
# RUN npm run build

# Expone el puerto que Next.js utiliza por defecto (3000)
EXPOSE 3000

# Comando para ejecutar tu aplicación Next.js
# CMD ["npm", "run", "dev"]
CMD ["npx", "next", "dev"]