# Install dependencies only when needed
FROM node:16-alpine
RUN apk add --no-cache libc6-compat

WORKDIR /app

# copy all that are not in .dockerignore
COPY . .

RUN npm install
RUN npm run build

WORKDIR /app

#ENV NODE_ENV="development"

EXPOSE 3000

ENV PORT 3000

CMD ["npm", "run", "dev"]