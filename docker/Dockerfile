FROM node:20-alpine AS builder

WORKDIR /app

COPY app/node-app/package*.json ./

RUN npm install --production

COPY app/node-app/. .

FROM node:20-alpine
WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000

CMD ["npm", "start"]
