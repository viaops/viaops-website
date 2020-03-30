FROM viaops/hugo

COPY . /srv
WORKDIR /srv

RUN hugo

FROM nginx:alpine
COPY --from=0 /srv/public /usr/share/nginx/html