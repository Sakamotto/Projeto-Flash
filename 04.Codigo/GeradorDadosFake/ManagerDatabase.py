import psycopg2
import sys
import pprint



class ManagerDatabase:
	
	def __init__(self):
		self.host = "localhost"
		self.dbname = "projetoflash"
		self.user = "postgres"
		self.password = "admin123"
	
	
	def connectDB(self):
		strConnection = self.getStrConnection()
		
		self.conn = psycopg2.connect(strConnection)

	
	def getDataSQL(self, strSql):
		cursor = self.conn.cursor()
		
		cursor.execute(strSql)
		
		return cursor.fetchall()
	
	def executeSQL(self, strSql):
		cursor = self.conn.cursor()
		
		cursor.execute(strSql)
		
		self.conn.commit()



	def getStrConnection(self):
		strConnection = ""
		
		strConnection += "host='" + self.host + "' "
		strConnection += "dbname='" + self.dbname + "' "
		strConnection += "user='" + self.user + "' "
		strConnection += "password='" + self.password + "'"
		
		return strConnection
	
	

	def closeDB(self):
		
		self.conn.close()

def main():
	
	db = ManagerDatabase()
	
	db.connectDB()
	
	db.executeSQL("INSERT INTO endereco (rua, bairro, municipio, cep) VALUES ('ruaTeste', 'bairroTeste', 'municipioTeste', 12345678);")
	
	print(db.getDataSQL("SELECT * FROM endereco;"))
	
	
	db.closeDB()
	
	return 0


if __name__ == "__main__":
	main()
