import  mysql.connector
    
class Conexao:
    
    def criarConexao ():
        #conexao banco de dados
        conexao = mysql.connector.connect(host = "localhost", 
                                        port = 3307,
                                        user = "M2A1",
                                        password = "m2a12025!",
                                        database = "db_Loja_M2A1")
        return conexao