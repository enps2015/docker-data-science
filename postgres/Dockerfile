# Base image
FROM postgres:15

# Copiar script SQL inicial
COPY init.sql /docker-entrypoint-initdb.d/init.sql

# Definir variáveis de ambiente
ENV POSTGRES_USER=user \
    POSTGRES_PASSWORD=password \
    POSTGRES_DB=data_science