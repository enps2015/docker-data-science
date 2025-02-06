# Docker Data Science Environment

Um ecossistema Dockerizado para estudos em Data Science, integrando ferramentas essenciais para análise de dados, visualização e monitoramento.

## Componentes do Sistema

- **Jupyter Notebook**: Para análise de dados e machine learning.
- **PostgreSQL**: Banco de dados relacional para armazenamento estruturado.
- **MetaBase**: Ferramenta de BI open source para criação de dashboards.
- **Grafana + Prometheus**: Para monitoramento e observabilidade.

## Estrutura do Projeto

/docker-data-science
├── README.md
├── docker-compose.yml
├── jupyter/
├── postgres/
├── metabase/
├── grafana/
├── prometheus/
└── volumes/


## Como Usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/enps2015/docker-data-science
   cd docker-data-science

2. Inicie o ambiente:
docker-compose up -d

3. Acesse as interfaces:

- Jupyter Notebook: http://localhost:8888
- MetaBase: http://localhost:3000
- Grafana: http://localhost:3001
- Prometheus: http://localhost:9090