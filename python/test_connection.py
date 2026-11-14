import mysql.connector

try:
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Redmi_5g",
        database="ecommerce_db",
        port=3306
    )

    if connection.is_connected():
        print("MySQL Database Connected Successfully!")
        print("Database:", connection.database)

    connection.close()

except mysql.connector.Error as error:
    print("Database Connection Failed!")
    print(error)