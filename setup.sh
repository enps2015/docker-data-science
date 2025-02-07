#!/bin/bash

# Verificar se o Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "Docker não está instalado. Por favor, instale o Docker antes de continuar."
    exit 1
fi

# Verificar se o Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose não está instalado. Por favor, instale o Docker Compose antes de continuar."
    exit 1
fi

# Clonar o repositório (se necessário)
if [ ! -d "docker-data-science" ]; then
    git clone https://github.com/enps2015/docker-data-science.git
    cd docker-data-science
else
    cd docker-data-science
fi

# Iniciar os serviços
docker-compose up -d

echo "Ambiente iniciado com sucesso!"
echo "Acesse as interfaces nos seguintes endereços:"
echo "- Jupyter Notebook: http://localhost:8888"
echo "- MetaBase: http://localhost:3000"
echo "- Grafana: http://localhost:3001"
echo "- Prometheus: http://localhost:9090"