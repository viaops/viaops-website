FROM viaops/hugo
COPY . /srv
RUN git submodule update --remote themes/minimal
RUN hugo

FROM nginx:alpine
COPY --from=0 /srv/public /usr/share/nginx/html