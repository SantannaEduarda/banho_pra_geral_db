import pymysql 
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Configuração do estilo dos gráficos
sns.set_theme(style="darkgrid")

# Conectar ao MySQL
try:
    conexao = pymysql.connect(
        host="localhost",
        user="root",
        password="123456",
        database="banho_pra_geral",
        cursorclass=pymysql.cursors.DictCursor
    )
except Exception as e:
    print(f"Erro ao conectar ao banco de dados: {e}")
    exit()

def executar_query(query):
    """Executa uma query SQL e retorna um DataFrame"""
    if not conexao.open:
        print("Erro: conexão com o banco de dados não está ativa.")
        return pd.DataFrame()
    
    try:
        with conexao.cursor() as cursor:
            cursor.execute(query)
            resultado = cursor.fetchall()
            df = pd.DataFrame(resultado)
        return df
    except Exception as e:
        print(f"Erro ao executar query: {e}")
        return pd.DataFrame()

consultas = {
    "Beneficiários por Condição de Saúde": "SELECT estado_saude, COUNT(*) AS total FROM beneficiario GROUP BY estado_saude;",
    "Distribuição de Deficiências": "SELECT necessidades_especiais, COUNT(*) AS total FROM beneficiario GROUP BY necessidades_especiais;",
    "Quantidade de Doações por Tipo": "SELECT tipo, SUM(quantidade) AS total FROM doacao GROUP BY tipo;",
    "Ações por Parceiro Local": """
        SELECT pl.nome, COUNT(a.id_acao) AS total_acoes 
        FROM acao a 
        JOIN parceiro_local pl ON a.id_parceiro_local = pl.id_parceiro_local 
        GROUP BY pl.nome;
    """,
    "Voluntários por Área de Atuação": "SELECT funcao, COUNT(*) AS total FROM voluntario GROUP BY funcao;",
    "Beneficiários por Gênero": "SELECT genero, COUNT(*) AS total FROM beneficiario GROUP BY genero;",
    "Número de Ações por Coordenador": """
        SELECT c.nome, COUNT(a.id_acao) AS total_acoes 
        FROM acao a 
        JOIN coordenador c ON a.id_coordenador = c.id_coordenador 
        GROUP BY c.nome;
    """,
    "Doações Recebidas por Data": "SELECT DATE_FORMAT(data_recebimento, '%Y-%m') AS mes, SUM(quantidade) AS total FROM doacao GROUP BY mes ORDER BY mes;",
    "Número de Ações por Tipo": "SELECT tipo, COUNT(*) AS total FROM acao GROUP BY tipo;",
    "Distribuição de Idade dos Beneficiários": "SELECT faixa_etaria, COUNT(*) AS total FROM beneficiario GROUP BY faixa_etaria;",
}

# Criar subplots dinamicamente
num_graficos = len(consultas)
linhas = (num_graficos // 3) + (num_graficos % 3 > 0)
fig, axes = plt.subplots(nrows=linhas, ncols=3, figsize=(18, 6 * linhas))
axes = axes.flatten()

grafico_idx = 0  

for titulo, query in consultas.items():
    df = executar_query(query)
    
    if df.empty:
        print(f"⚠ Sem dados disponíveis para: {titulo}")
        continue

    ax = axes[grafico_idx]  
    num_categorias = len(df)

    if "mes" in df.columns:
        sns.lineplot(x=df.columns[0], y=df.columns[1], data=df, marker="o", color="b", ax=ax)
        ax.set_xticklabels(df[df.columns[0]], rotation=45)
    
    elif num_categorias > 6:
        sns.barplot(y=df.columns[0], x=df.columns[1], data=df, palette="rocket", ax=ax)
        ax.set_ylabel(df.columns[0])
        ax.set_xlabel("Quantidade")
    
    elif num_categorias <= 4:
        ax.pie(df[df.columns[1]], labels=df[df.columns[0]], autopct='%1.1f%%', colors=sns.color_palette("coolwarm"))
    
    else:
        sns.barplot(x=df.columns[0], y=df.columns[1], data=df, palette="magma", ax=ax)
        ax.set_xticklabels(df[df.columns[0]], rotation=30)
    
    ax.set_title(titulo)
    ax.set_ylabel("Quantidade")
    grafico_idx += 1

# Remover gráficos vazios
for j in range(grafico_idx, len(axes)):
    fig.delaxes(axes[j])

doacoes = pd.DataFrame({
    'id': [1, 2, 3, 4, 5],
    'tipo': ['Marmitas', 'Roupas', 'Itens Higienicos', 'Marmitas', 'Roupas'],
    'quantidade': [50, 30, 100, 70, 45]
})

acoes = pd.DataFrame({
    'id': [1, 2, 3, 4, 5],
    'local': ['Praça Central', 'Igreja São João', 'ONG Mãos Solidárias', 'Centro Comunitário Luz', 'Projeto Vida Nova'],
    'data': pd.date_range(start='2024-03-01', periods=5, freq='10D')
})

# Gráfico 1: Distribuição das Doações por Tipo
plt.figure(figsize=(8, 5))
plt.pie(doacoes.groupby('tipo')['quantidade'].sum(), labels=doacoes['tipo'].unique(), autopct='%1.1f%%', colors=sns.color_palette("pastel"))
plt.title('Distribuição das Doações por Tipo')
plt.show()

# Gráfico 2: Frequência das Ações ao Longo do Tempo
plt.figure(figsize=(8, 5))
sns.lineplot(x=acoes['data'], y=acoes.index, marker='o', linestyle='-', color='purple')
plt.title('Frequência das Ações ao Longo do Tempo')
plt.xlabel('Data')
plt.ylabel('Número de Ações')
plt.xticks(rotation=45)
plt.grid(True)
plt.show()

plt.tight_layout()

# Fechar conexão com segurança
try:
    conexao.close()
except Exception as e:
    print(f"Erro ao fechar conexão: {e}")
