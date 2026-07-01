FROM node:18-alpine

WORKDIR /app

# Instalar N8N globalmente
RUN npm install -g n8n

# Crear directorios necesarios
RUN mkdir -p /root/.n8n

# Exponer el puerto
EXPOSE 3000

# Comando para iniciar N8N
CMD ["n8n", "start"]