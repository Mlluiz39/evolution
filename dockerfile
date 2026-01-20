# -----------------------------
# Dockerfile para EvolutionAPI
# -----------------------------
FROM node:20-alpine

# Diretório de trabalho
WORKDIR /app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências (prod + dev para build)
RUN npm install

# Copiar todo o código
COPY . .

# Build do TypeScript com tsup
RUN npm run build

# Expor a porta que o Render vai usar
EXPOSE 10000

# Variáveis de ambiente padrão
ENV NODE_ENV=production
ENV PORT=10000

# Comando para iniciar a API
CMD ["npm", "start"]
