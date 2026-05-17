FROM node:18-bullseye-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    pkg-config \
    python3 \
    make \
    g++

WORKDIR /app
COPY package*.json ./
RUN npm ci --build-from-source
COPY . .

CMD ["node", "index.js"]