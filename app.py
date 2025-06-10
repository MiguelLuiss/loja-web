from flask import Flask, render_template, request, redirect, session, url_for
from data.conexao import Conexao
from model.Usuario import Usuario
from model.produtos import Produto
from model.comentario import Comentario
from model.carrinho import Carrinho


app = Flask(__name__)
app.secret_key = '12345678'

# Rotas principais
# Rotas para abrir as páginas
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
    
@app.route('/catalogo')
def catalogo():
    moletom = Produto.mostrarMoletons()
    camisetas = Produto.mostrarCamisetas()
    calcas = Produto.mostrarCalcas()
    calcados = Produto.mostrarCalcados()

    return render_template(
        'catalogo.html',
        moletom=moletom,
        camisetas=camisetas,
        calcas=calcas,
        calcados=calcados
    )

    
# Rotas de categorias por gênero
@app.route('/pag-masculino')
def pagMasculino():
    produtos = {
        'moletons': Produto.mostrarMoletonsMasculinos(),
        'camisetas': Produto.mostrarCamisetasMasculinos(),
        'calcas': Produto.mostrarCalcasMasculinos(),
        'calcados': Produto.mostrarCalcadosMasculinos()
    }
    return render_template('pag-masculino.html', produtos=produtos)

@app.route('/pag-feminino')
def pagFeminino():
    produtos = {
        'moletons': Produto.mostrarMoletonsFemininos(),
        'camisetas': Produto.mostrarCamisetasFemininos(),
        'calcas': Produto.mostrarCalcasFemininos(),
        'calcados': Produto.mostrarCalcadosFemininos()
    }
    return render_template('pag-feminino.html', produtos=produtos)

@app.route('/pag-infantil')
def pagInfantil():
    produtos = {
        'moletons': Produto.mostrarMoletonsInfantis(),
        'camisetas': Produto.mostrarCamisetasInfantis(),
        'calcas': Produto.mostrarCalcasInfantis(),
        'calcados': Produto.mostrarCalcadosInfantis()
    }
    return render_template('pag-infantil.html', produtos=produtos)

# Rota para a página dos produtos
@app.route('/mostrarMoletons')
def mostrarMoletons():
    moletom = Produto.mostrarMoletons()
    return render_template("moletons.html", moletom=moletom)

@app.route('/mostrarCamisetas')
def mostrarCamisetas():
    camisetas = Produto.mostrarCamisetas()
    return render_template("camisetas.html", camisetas=camisetas)

@app.route('/mostrarCalcas')
def mostrarCalcas():
    calcas = Produto.mostrarCalcas()
    return render_template("calcas.html", calcas=calcas)

@app.route('/mostrarCalcados')
def mostrarCalcados():
    calcados = Produto.mostrarCalcados()
    return render_template("calcados.html", calcados=calcados)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)