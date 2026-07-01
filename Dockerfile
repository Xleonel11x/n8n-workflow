FROM node:18-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Instalar N8N directamente (sin actualizar npm)
RUN npm install -g n8n

# Crear directorios necesarios
RUN mkdir -p /root/.n8n

# Variables de entorno
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=3000
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Exponer puerto
EXPOSE 3000

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/healthz', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

# Comando para iniciar N8N
CMD ["n8n", "start"]