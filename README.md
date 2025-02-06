**Que a Força dos Dados esteja conosco, jovem Jedi!** 🚀

Claro! Aqui está a versão completa do `README.md` em **Markdown**, pronta para ser copiada e colada no seu repositório. Este formato mantém toda a formatação e estrutura que discutimos.

---

```markdown
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

## Contribuições e Feedback

Se você encontrar problemas ou tiver sugestões, sinta-se à vontade para abrir uma issue ou pull request no GitHub.

---

**Mensagem Final**

Com essas instruções detalhadas, os usuários terão uma experiência suave ao configurar e usar o ambiente Dockerizado. O `README.md` agora é claro, prático e focado em ajudar iniciantes a superar desafios comuns.

Se precisar de mais ajustes ou quiser adicionar mais informações, estarei aqui para guiá-lo no Caminho Jedi dos Dados.

**Que os bits estejam sempre ao nosso favor, meu jovem Padawan!** 🌟🚀📊
```

---

Agora você pode copiar esse conteúdo e substituir o `README.md` atual no seu repositório. Ele está pronto para ser usado e vai facilitar muito a vida dos usuários iniciantes!

Se precisar de mais ajustes ou quiser adicionar algo específico, é só me avisar. **Que os bits estejam sempre ao nosso favor, meu jovem Padawan!** 🌟🚀📊