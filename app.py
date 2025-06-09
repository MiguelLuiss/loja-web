from flask import Flask, render_template, request, redirect, session
from data.conexao import Conexao
from model.Usuario import Usuario
from model.produtos import Produto

app = Flask(__name__)
app.secret_key = '12345678'

# Rotas principais
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login')
def pagina_login():
    return render_template("pag-login.html")

@app.route('/cadastro')
def pagina_cadastro():
    return render_template('pag-cadastro.html')

@app.route('/pag-masculino')
def pgMasculino():
    return render_template('pag-masculino.html')

@app.route('/pag-feminino')
def pgFeminino():
    return render_template('pag-feminino.html')

@app.route('/pag-infantil')
def pgInfantil():
    return render_template('pag-infantil.html')

@app.route('/carrinho')
def carrinho():
    return render_template('carrinho.html')

# Cadastro de usuário
@app.route('/post/cadastrarUsuario', methods=['POST'])
def cadastrarUsuario():
    nome = request.form.get("nome")
    email = request.form.get("email")
    senha = request.form.get("senha")
    telefone = request.form.get("telefone")
    endereco = request.form.get("endereco")

    Usuario.criarUsuario(nome, senha, email, telefone, endereco)
    return redirect('/cadastro')

# Login
@app.route("/verificaLogin", methods=["POST"])
def verificaLogin():
    email = request.form.get("email")
    senha = request.form.get("senha")
    usuario = Usuario.verificarLogin(email, senha)

    if usuario:
        return redirect("/")
    else:
        return redirect("/login")

# Rota para a página de moletons
@app.route('/mostrarMoletons')
def mostrarMoletons():
    moletom = Produto.mostrarMoletons()
    return render_template("moletons.html", moletom=moletom)

# Iniciar o servidor
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)