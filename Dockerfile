FROM node:22

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY prisma ./prisma
RUN npx prisma generate

COPY .env .env

COPY . .
RUN npm run build

EXPOSE 3001

CMD ["npm", "start"]