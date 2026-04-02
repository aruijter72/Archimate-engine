FROM nginx:alpine
LABEL maintainer="Arnold Ruijter IT <arnold.ruijter@outlook.com>"
LABEL description="ArchiMate Engine — Web-based ArchiMate 3 modelling tool by Arnold Ruijter IT"

# Copy application files
COPY index.html /usr/share/nginx/html/
COPY "Logo Huisstijl geel.png" /usr/share/nginx/html/

# Use security-hardened nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1
