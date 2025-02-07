import psycopg2
import pandas as pd

# Conectar ao PostgreSQL
try:
    conn = psycopg2.connect(
        host="postgres",
        database="data_science",
        user="user",
        password="password"
    )
    print("Conexão com o PostgreSQL estabelecida com sucesso!")
except Exception as e:
    print(f"Erro ao conectar ao PostgreSQL: {e}")
    exit(1)

# Consultar dados
query = "SELECT * FROM sales;"
df = pd.read_sql(query, conn)

# Exibir resultados
print("Dados da tabela 'sales':")
print(df)

# Fechar conexão
conn.close()