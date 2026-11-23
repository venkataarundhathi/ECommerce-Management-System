import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="YOUR_PASSWORD",
    database="ecommerce_db"
)

cursor = conn.cursor()

cursor.execute("SELECT * FROM product")

rows = cursor.fetchall()

for row in rows:
    print(row)

cursor.close()
conn.close()
