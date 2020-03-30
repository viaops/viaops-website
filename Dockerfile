FROM viaops/hugo

COPY . /srv

RUN rm -rf themes/*

RUN hugo

FROM nginx:alpine
COPY --from=0 /srv/public /usr/share/nginx/html