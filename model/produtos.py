from data.conexao import Conexao

class Produto: 
    def mostrarMoletons():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url  from tb_produtos where tipo = 'moletom'"""
        
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
    
    def mostrarMoletonsMasculinos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Masculino' and tipo ='moletom'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    

    def mostrarFemininos():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Feminino'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    
    def mostrarInfantils():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """select codProduto,nome_produto,descricao,preco,sexo,tipo,url from tb_produtos where sexo = 'Masculino'"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
    

