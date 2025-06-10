import  mysql.connector
    
class Conexao:
    
    # def criarConexao ():
    #     #conexao banco de dados
    #     conexao = mysql.connector.connect(host = "dbm2a1-aluno-08cc.j.aivencloud.com", 
    #                                     port = 26105,
    #                                     user = "avnadmin",
    #                                     password = "AVNS_OG9ZN-tmW5v5naWRNb9",
    #                                     database = "db_Loja_M2A1")
    #     return conexao

     def criarConexao ():
        #conexao banco de dados
        conexao = mysql.connector.connect(host = "localhost", 
                                        port = 3306,
                                        user = "root",
                                        password = "root",
                                        database = "db_loja_m2a1")
        return conexao