# Usar Node 20 Alpine leve
FROM node:20-alpine

# Criar diretório da app
WORKDIR /usr/src/app

# Copiar package.json e package-lock.json (se existir)
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar todo o código fonte
COPY . .

# Expor porta (Render define PORT dinamicamente)
ENV PORT=10000
EXPOSE 10000

# Comando para iniciar a app
CMD ["npm", "start"]
