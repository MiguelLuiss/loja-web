from data.conexao import Conexao

class Produto: 
    def mostrarprodutos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo from tb_produtos"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarMoletons():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo from tb_produtos where tipo = 'moletom'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    
    def mostrarCamisetas():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo from tb_produtos where tipo = 'camiseta'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcas():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo from tb_produtos where tipo = 'calca'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarCalcados():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo from tb_produtos where tipo = 'sapato'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    

