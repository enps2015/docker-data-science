# Base image
FROM metabase/metabase:latest

# Copiar arquivo de configuração
COPY config.env /config.env

# Definir variáveis de ambiente
ENV MB_DB_TYPE=postgres \
    MB_DB_DBNAME=data_science \
    MB_DB_PORT=5432 \
    MB_DB_USER=user \
    MB_DB_PASS=password \
    MB_DB_HOST=postgres