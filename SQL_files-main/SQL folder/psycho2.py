import psycopg2

connection = psycopg2.connect(host = "localhost", database = "University_large", user = "postgres", password = "A.Password")
cursor = connection.cursor()
cursor.execute(f"SELECT * FROM instructors:")
query = cursor.fetchall()
print('Instructors: ', query[0])
cursor.close()
connection.close()
