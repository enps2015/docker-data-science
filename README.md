
![logo](https://github.com/user-attachments/assets/bc5c4d3e-61ab-40c8-8b7f-315a38dd88db)

# Docker Data Science Environment

Um ecossistema Dockerizado para estudos em **Data Science**, integrando ferramentas essenciais para análise de dados, visualização e monitoramento. Este ambiente foi projetado para ser **simples, replicável e acessível**, mesmo para usuários iniciantes.

## Componentes do Sistema

- **Jupyter Notebook**: Para análise de dados e machine learning.
- **PostgreSQL**: Banco de dados relacional para armazenamento estruturado.
- **MetaBase**: Ferramenta de BI open source para criação de dashboards.
- **Grafana + Prometheus**: Para monitoramento e observabilidade.

## Estrutura do Projeto

```
/docker-data-science
├── README.md                     # Documentação principal do projeto
├── docker-compose.yml            # Arquivo principal para orquestrar todos os serviços
├── jupyter/                      # Configuração do Jupyter Notebook
├── postgres/                     # Configuração do PostgreSQL
├── metabase/                     # Configuração do MetaBase
├── grafana/                      # Configuração do Grafana
├── prometheus/                   # Configuração do Prometheus
└── volumes/                      # Diretório centralizado para persistir dados
```

---

## Como Usar

### **1. Pré-requisitos**

Antes de iniciar, certifique-se de que você tem os seguintes softwares instalados:

- **Docker**: [Guia de Instalação](https://docs.docker.com/get-docker/)
- **Docker Compose**: Já incluído no Docker Desktop ou disponível separadamente.

### **2. Clone o Repositório**

Clone o repositório para sua máquina local:
```bash
git clone https://github.com/enps2015/docker-data-science.git
cd docker-data-science
```

### **3. Inicie o Ambiente**

Inicie todos os serviços com o comando:
```bash
docker-compose up -d
```

> **Nota**: Isso pode levar alguns minutos na primeira vez, pois as imagens Docker serão baixadas.

### **4. Acesse as Interfaces**

Após iniciar os serviços, você pode acessar as interfaces no navegador:

- **Jupyter Notebook**: [http://localhost:8888](http://localhost:8888)
- **MetaBase**: [http://localhost:3000](http://localhost:3000)
- **Grafana**: [http://localhost:3001](http://localhost:3001)
- **Prometheus**: [http://localhost:9090](http://localhost:9090)

---

## Setup Automatizado

Para facilitar a configuração inicial do ambiente, criei um script automatizado (`setup.sh`) que verifica as dependências necessárias (Docker e Docker Compose), clona o repositório (se necessário) e inicia todos os serviços.

### Por que usar o script?
- **Simplicidade**: O script elimina a necessidade de executar comandos manuais.
- **Confiabilidade**: Ele garante que todas as etapas sejam seguidas corretamente.
- **Rapidez**: Em poucos minutos, você terá o ambiente pronto para uso.

### Como executar o script

1. Certifique-se de que o `git`, `docker` e `docker-compose` estão instalados na sua máquina.
2. Faça o download do script:
   ```bash
   wget https://github.com/enps2015/docker-data-science/blob/master/setup.sh
   ```
3. Torne o script executável:
   ```bash
   chmod +x setup.sh
   ```
4. Execute o script:
   ```bash
   ./setup.sh
   ```

Após a execução, o ambiente estará disponível nos seguintes endereços:
- **Jupyter Notebook**: [http://localhost:8888](http://localhost:8888)
- **MetaBase**: [http://localhost:3000](http://localhost:3000)
- **Grafana**: [http://localhost:3001](http://localhost:3001)
- **Prometheus**: [http://localhost:9090](http://localhost:9090)


___

## Configuração Passo a Passo

### **Jupyter Notebook**

1. Abra o navegador e acesse:
   ```
   http://localhost:8888
   ```

2. Se solicitado, insira o **token de acesso**. Para encontrar o token:
   - Execute o seguinte comando no terminal:
     ```bash
     docker logs jupyter
     ```
   - Procure por uma linha como esta:
     ```
     http://127.0.0.1:8888/?token=abcdef1234567890abcdef1234567890abcdef1234
     ```
   - Copie o valor após `token=` e cole-o no navegador.

3. Agora você pode criar e executar scripts Python no Jupyter Notebook.

---

### **PostgreSQL**

O PostgreSQL já está configurado com um banco de dados inicial (`data_science`) e um usuário (`user`).

1. Para testar a conexão, conecte-se ao PostgreSQL via terminal:
   ```bash
   docker exec -it postgres psql -U user -d data_science
   ```

2. Execute uma consulta para verificar as tabelas:
   ```sql
   \dt
   ```

3. Consulte os dados (se houver):
   ```sql
   SELECT * FROM sales;
   ```

---

### **MetaBase**

1. Abra o navegador e acesse:
   ```
   http://localhost:3000
   ```

2. Na tela inicial, siga estas etapas:
   - Escolha **"Let's get started"**.
   - Selecione **"PostgreSQL"** como o tipo de banco de dados.
   - Preencha os campos da conexão:
     - **Nome**: `Data Science DB`
     - **Host**: `postgres` (nome do serviço no `docker-compose.yml`)
     - **Porta**: `5432` (porta padrão do PostgreSQL)
     - **Banco de Dados**: `data_science`
     - **Usuário**: `user`
     - **Senha**: `password`

3. Clique em **"Save"** ou **"Test Connection"** para confirmar a conexão.

4. Após conectar, explore os dados criando dashboards no MetaBase.

---

### **Grafana**

1. Abra o navegador e acesse:
   ```
   http://localhost:3001
   ```

2. Insira as credenciais padrão:
   - **Usuário**: `admin`
   - **Senha**: `admin`

3. Altere a senha inicial quando solicitado.

4. Conecte o Grafana ao Prometheus:
   - No menu lateral, clique em **"Configuration" (engrenagem)** > **"Data Sources"**.
   - Clique em **"Add data source"**.
   - Selecione **"Prometheus"**.
   - Em **"HTTP"**, insira a URL:
     ```
     http://prometheus:9090
     ```
   - Clique em **"Save & Test"** para confirmar a conexão.

5. Importe dashboards pré-configurados ou crie seus próprios gráficos.

---

### **Prometheus**

1. Abra o navegador e acesse:
   ```
   http://localhost:9090
   ```

2. Use o Prometheus para monitorar métricas dos contêineres. Por exemplo:
   - Pesquise por métricas como `up` para verificar o status dos serviços.

---

## Testando o Ambiente

Para garantir que todos os componentes do ambiente estão conectados e funcionando corretamente, criei um guia prático com instruções passo a passo. 
Este guia inclui testes para verificar as conexões entre o Jupyter Notebook, PostgreSQL, MetaBase, Grafana e Prometheus.

Se você é novo no projeto ou quer ter certeza de que tudo está configurado corretamente, recomendamos que siga o tutorial disponível no arquivo [TESTES.md](TESTES.md).

Os testes são simples e fáceis de realizar, mesmo para iniciantes. Eles garantem que você possa explorar o ambiente com tranquilidade e confiança.

**Convide seus neurônios a fazer os testes!** 😉

___

## Resolução de Problemas

### **1. Jupyter Notebook**
- **Erro ao acessar o token**:
  - Verifique os logs do contêiner:
    ```bash
    docker logs jupyter
    ```
  - Certifique-se de copiar o token correto.

### **2. PostgreSQL**
- **Tabela não encontrada**:
  - Certifique-se de que o arquivo `init.sql` existe e está correto.
  - Remova o volume persistente e reinicie os serviços:
    ```bash
    docker-compose down -v
    docker-compose up -d
    ```

### **3. Grafana**
- **Erro ao acessar o Grafana**:
  - Verifique se o diretório `./volumes/grafana` tem permissões corretas:
    ```bash
    sudo chown -R 472:472 ./volumes/grafana
    ```
  - Reinicie os serviços:
    ```bash
    docker-compose down
    docker-compose up -d
    ```

---

## Screenshots do Ambiente

Abaixo estão algumas capturas
 de tela das interfaces disponíveis no ambiente Dockerizado. Essas imagens dão uma ideia visual de como cada ferramenta funciona.

### Jupyter Notebook

![captura02](https://github.com/user-attachments/assets/cdedc6e3-bf67-4c37-a200-d6710fa70fd4)


_Uma interface interativa para análise de dados e machine learning._


### MetaBase

![captura03](https://github.com/user-attachments/assets/e73f2bbb-9054-46ac-b4bb-45169b39fad9)

_Um dashboard intuitivo para visualização de dados do PostgreSQL._


### Grafana

![captura04](https://github.com/user-attachments/assets/0006e5b0-8195-464d-9902-9c04119d0c9d)

_Gráficos dinâmicos para monitoramento e observabilidade._

### Prometheus

![captura05](https://github.com/user-attachments/assets/9678e432-5e25-4630-80a4-dc6bd5997e58)

_Uma interface para consultar métricas coletadas pelo sistema._

---

**Observação**: Para acessar essas interfaces, siga as instruções no início deste documento.


## Contribuições e Feedback

Se você encontrar problemas ou tiver sugestões, sinta-se à vontade para abrir uma issue ou pull request no GitHub.

---

**Desenvolvido por:**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/eric-np-santos/) Eric Pimentel 

**Que a Força dos Dados esteja com você! 🚀 ✨** 
