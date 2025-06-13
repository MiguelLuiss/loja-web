from flask import Flask, render_template, request, redirect, session
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
        session['foto'] = "navbar-toggler-icon"
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

@app.route("/amostraProduto/<codigo>")
def mostrar_produto(codigo):
    produto = Produto.amostraProduto(codigo)

    if produto:
        return render_template("amostraProduto.html", produto=produto)
    else:
        return "Produto não encontrado", 404
    
@app.route('/adicionar-carrinho/<codigo>', methods=['POST'])
def adicionar_ao_carrinho(codigo):
    if 'usuario' not in session:
        return redirect('/login')
    
    cod_usuario = session.get('cod_usuario')
    if not cod_usuario:
        return redirect('/login')
    
    try:
        produto = Produto.amostraProduto(codigo)
        if not produto:
            return "Produto não encontrado", 404
        
        produto_dict = {
            'codProduto': produto['codProduto'],
            'codCategoria': produto.get('codCategoria'),
            'nome_produto': produto['nome_produto'],
            'descricao': produto['descricao'],
            'preco': produto['preco'],
            'sexo': produto['sexo'],
            'url': produto['url']
        }
        
        Carrinho.adicionar_item(cod_usuario, produto_dict)
        return redirect('/')
    
    except Exception as e:
        print(f"Erro ao adicionar produto ao carrinho: {e}")
        return "Erro interno no servidor", 500
    
@app.route("/carrinho")
def carrinho():
    if 'cod_usuario' not in session:
        return redirect("/login")

    produtos = Carrinho.mostrarCarrinho(session['cod_usuario'])
    return render_template("carrinho.html", produtos=produtos)


@app.route("/excluir_carrinho/<codCarrinho>")
def excluir_carrinho(codCarrinho):
    if 'cod_usuario' not in session:
        return redirect("/login")

    Carrinho.excluirItemCarrinho(codCarrinho)
    return redirect("/carrinho")

@app.route("/sair")
def sair():
    Usuario.logOff()
    return redirect("/")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)