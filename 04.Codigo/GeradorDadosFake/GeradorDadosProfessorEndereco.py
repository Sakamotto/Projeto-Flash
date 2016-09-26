from ManagerDatabase import ManagerDatabase
import random
import faker


class generateData:
	
	
	
	
	def popularProfessor(self, quantidade):
		gerenciadorDB = ManagerDatabase()

		gerenciadorDB.connectDB()
		
		fake = faker.Factory.create("pt_BR")
		
		
		for i in range(quantidade):
			nome = fake.name()
			matricula = ("000000" + str(random.randint(0, 999999)))[-6:]
			cpf = self.generateCPF()
			municipio = fake.city()
			bairro = fake.bairro()
			endereco = fake.street_name()
			numero = fake.numerify()
			cep = fake.postcode()
			area_conhecimento_id = str(random.randint(11, 15))
			
			strSQLEndereco = "INSERT INTO flash.endereco (numero, endereco, bairro, municipio, cep) VALUES " + \
					 "('" + numero + "'," + \
					 "'" + endereco + "'," + \
					 "'" + bairro + "'," + \
					 "'" + municipio + "'," + \
					 "'" + cep + "');"
			
			gerenciadorDB.executeSQL(strSQLEndereco)
			
			endereco_id = str(gerenciadorDB.getDataSQL("SELECT MAX(endereco_id) FROM flash.endereco")[0][0])
			
			
			strSQLProfessor = "INSERT INTO flash.professor (nome, matricula, cpf, endereco_id) VALUES " + \
					 "('" + nome + "'," + \
					 "'" + matricula + "'," + \
					 "'" + cpf + "'," + \
					 "'" + endereco_id + "');"
			
			gerenciadorDB.executeSQL(strSQLProfessor)
		
		gerenciadorDB.closeDB()	
	
	
	
	
	
	
	def generateCPF(self):
		cpf = ""
		
		s1 = "000" + str(random.randint(0, 999))
		s2 = "000" + str(random.randint(0, 999))
		s3 = "000" + str(random.randint(0, 999))
		s4 = "00" + str(random.randint(0, 99))
		
		cpf += s1[-3:] + "." + s2[-3:] + "." + s3[-3:] + "-" + s4[-2:]
		
		return cpf
	
	def generateNumberTel(self):
		telefone = ""
		
		s1 = "00" + str(random.randint(0, 99))
		s2 = "0000" + str(random.randint(0, 9999))
		s3 = "0000" + str(random.randint(0, 9999))
		
		telefone += "(" + s1[-2:] + ")" + s2[-4:] + "-" + s3[-4:]
		
		return telefone
	
	
	

def main():
	
	teste = generateData()
	
	print(teste.popularProfessor(20))
	
	
	return 0


if __name__ == "__main__":
	main()
