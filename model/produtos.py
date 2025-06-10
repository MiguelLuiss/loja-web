from data.conexao import Conexao

class Produto: 
    def mostrarMoletons():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where tipo = 'moletom'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
     
    def mostrarCamisetas():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where tipo = 'camiseta'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcas():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where tipo = 'calca'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcados():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where tipo = 'sapato'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCatalogo():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary=True)
        sql = """SELECT codProduto, nome_produto, descricao, preco, sexo, tipo, url 
                FROM tb_produtos 
                WHERE tipo IN ('moletom', 'camiseta', 'calca', 'sapato')"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarMoletonsMasculinos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Masculino' and tipo ='moletom'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCamisetasMasculinos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Masculino' and tipo ='camiseta'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcasMasculinos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Masculino' and tipo ='calca'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcadosMasculinos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Masculino' and tipo ='sapato'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados

    def mostrarMoletonsFemininos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Feminino' and tipo = 'moletom'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCamisetasFemininos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Feminino' and tipo = 'camiseta'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcasFemininos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Feminino' and tipo = 'calca'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcadosFemininos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Feminino' and tipo = 'sapato'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarMoletonsInfantis():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Infantil' and tipo = 'moletom'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCamisetasInfantis():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Infantil' and tipo = 'camisetas'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcasInfantis():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Infantil' and tipo = 'calca'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcadosInfantis():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Infantil' and tipo = 'sapato'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    

    def amostraProduto(codigo):
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary=True)

        sql = "SELECT * FROM tb_produtos WHERE codProduto = %s"
        cursor.execute(sql, (codigo,)) 
        produto = cursor.fetchone()

        cursor.close()
        conexao.close()
        return produto