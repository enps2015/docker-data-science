

```markdown
# Testando o Ambiente Dockerizado

Este guia ensina como testar se todos os componentes do ambiente Dockerizado estão conectados e funcionando corretamente. 
Esses testes garantem que você possa usar o ambiente com tranquilidade para seus estudos e projetos.

---

## **1. Verifique se Todos os Serviços Estão Rodando**

Antes de iniciar os testes, certifique-se de que todos os contêineres estão ativos:
```bash
docker ps
```

Você deve ver algo como isso:
```
CONTAINER ID   IMAGE                        STATUS         PORTS                   NAMES
...            jupyter/base-notebook:latest Up 5 minutes   0.0.0.0:8888->8888/tcp  jupyter
...            postgres:15                  Up 5 minutes   5432/tcp                postgres
...            metabase/metabase:latest     Up 5 minutes   0.0.0.0:3000->3000/tcp  metabase
...            grafana/grafana:latest       Up 5 minutes   0.0.0.0:3001->3000/tcp  grafana
...            prom/prometheus:latest       Up 5 minutes   0.0.0.0:9090->9090/tcp  prometheus
```

Se algum serviço não estiver listado, reinicie os serviços:
```bash
docker-compose down
docker-compose up -d
```

---

## **2. Teste o Jupyter Notebook**

### **Passo 1: Acesse o Jupyter Notebook**
Abra o navegador e acesse:
```
http://localhost:8888
```

Insira o token de acesso (consulte os logs se necessário):
```bash
docker logs jupyter
```

### **Passo 2: Crie um Script Python**
No Jupyter Notebook, crie um novo notebook e execute o seguinte código para testar a conexão com o PostgreSQL:

```python
import psycopg2

# Conectar ao PostgreSQL
conn = psycopg2.connect(
    host="postgres",
    database="data_science",
    user="user",
    password="password"
)
cur = conn.cursor()

# Criar uma nova tabela
cur.execute("""
    CREATE TABLE IF NOT EXISTS test_table (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        value INT
    );
""")

# Inserir dados na tabela
cur.execute("""
    INSERT INTO test_table (name, value) VALUES
    ('Teste 1', 100),
    ('Teste 2', 200);
""")

# Consultar os dados
cur.execute("SELECT * FROM test_table;")
rows = cur.fetchall()

# Exibir os resultados
for row in rows:
    print(row)

# Fechar a conexão
cur.close()
conn.close()
```

- Se os dados da tabela `test_table` forem exibidos, a conexão entre o Jupyter Notebook e o PostgreSQL está funcionando!

---

## **3. Teste o MetaBase**

### **Passo 1: Acesse o MetaBase**
Abra o navegador e acesse:
```
http://localhost:3000
```

### **Passo 2: Configure a Conexão com o PostgreSQL**
Se ainda não configurou, siga estas etapas:
- Escolha **"Let's get started"**.
- Selecione **"PostgreSQL"** como o tipo de banco de dados.
- Preencha os campos da conexão:
  - **Host**: `postgres`
  - **Porta**: `5432`
  - **Banco de Dados**: `data_science`
  - **Usuário**: `user`
  - **Senha**: `password`

### **Passo 3: Explore os Dados**
Após conectar, vá para **"Ask a question"** > **"Custom question"** e selecione a tabela `test_table`. Você deve ver os dados inseridos no script Python.

---

## **4. Teste o Grafana**

### **Passo 1: Acesse o Grafana**
Abra o navegador e acesse:
```
http://localhost:3001
```

Insira as credenciais padrão:
- **Usuário**: `admin`
- **Senha**: `admin`

Altere a senha inicial quando solicitado.

### **Passo 2: Conecte ao Prometheus**
No menu lateral, clique em **"Configuration" (engrenagem)** > **"Data Sources"**:
- Clique em **"Add data source"**.
- Selecione **"Prometheus"**.
- Em **"HTTP"**, insira a URL:
  ```
  http://prometheus:9090
  ```
- Clique em **"Save & Test"**.

Se a mensagem **"Data source is working"** aparecer, a conexão está funcionando!

### **Passo 3: Importe um Dashboard**
Para testar o monitoramento:
- Clique em **"+" (Create)** > **"Import"**.
- Insira o ID de um dashboard público (ex.: `1860` para monitoramento básico do Prometheus).
- Selecione a fonte de dados (Prometheus) e clique em **"Import"**.

Você deve ver gráficos com métricas coletadas pelo Prometheus.

---

## **5. Teste o Prometheus**

### **Passo 1: Acesse o Prometheus**
Abra o navegador e acesse:
```
http://localhost:9090
```

### **Passo 2: Consulte Métricas**
Na aba **"Graph"**, pesquise por métricas como:
- `up`: Verifica o status dos serviços monitorados.
- `process_cpu_seconds_total`: Monitora o uso de CPU.

Se os dados forem exibidos, o Prometheus está funcionando corretamente.

---

## **Resumo dos Testes**

1. **Jupyter Notebook**: Conecte-se ao PostgreSQL e consulte dados.
2. **MetaBase**: Configure a conexão com o PostgreSQL e explore os dados.
3. **Grafana**: Conecte-se ao Prometheus e importe dashboards.
4. **Prometheus**: Consulte métricas para confirmar o monitoramento.

---
___
