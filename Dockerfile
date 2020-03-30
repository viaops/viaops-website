FROM viaops/hugo

COPY . /srv
WORKDIR /srv

RUN rm -rf themes/*
RUN git submodule add https://github.com/calintat/minimal.git themes/minimal
RUN git submodule init
RUN git submodule update

RUN hugo

FROM nginx:alpine
COPY --from=0 /srv/public /usr/share/nginx/html