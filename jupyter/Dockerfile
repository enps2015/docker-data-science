# Base image
FROM jupyter/base-notebook:latest

# Instalar dependências Python
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copiar scripts iniciais
COPY start_notebook.py /home/jovyan/work/start_notebook.py
COPY teste_postgres.ipynb /home/jovyan/work/teste_postgres.ipynb

# Definir diretório de trabalho
WORKDIR /home/jovyan/work

# Comando para iniciar o notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]