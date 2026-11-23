from db_connection import get_connection

def display_products():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM product")

    products = cursor.fetchall()

    print("\n----- PRODUCT DETAILS -----")

    for product in products:
        print(product)

    cursor.close()
    conn.close()


def add_product():
    conn = get_connection()
    cursor = conn.cursor()

    category_id = int(input("Enter category ID: "))
    name = input("Enter product name: ")
    model = input("Enter model number: ")
    price = float(input("Enter price: "))

    query = """
        INSERT INTO product
        (category_id, product_name, model_number, price)
        VALUES (%s, %s, %s, %s)
    """

    cursor.execute(query, (category_id, name, model, price))
    conn.commit()

    print("Product added successfully!")

    cursor.close()
    conn.close()


def update_product():
    conn = get_connection()
    cursor = conn.cursor()

    product_id = int(input("Enter product ID: "))
    new_name =input("Enter new product name:")
    new_model = input("Enter new model number:")
    new_price = float(input("Enter new price: "))

    query = """
        UPDATE product
        SET product_name = %s,
            model_number = %s,
            price = %s
        WHERE product_id = %s
    """

    cursor.execute(query, (new_name, new_model, new_price, product_id))
    conn.commit()
    if cursor.rowcount:
        print("Product updated successfully!")
    else:
        print("Product ID not found or no changes made.")

    cursor.close()
    conn.close()


def delete_product():
    conn = get_connection()
    cursor = conn.cursor()

    product_id = int(input("Enter product ID: "))

    confirm = input("Are you sure? (yes/no): ")

    if confirm.lower() == "yes":
        cursor.execute(
            "DELETE FROM product WHERE product_id = %s",
            (product_id,)
        )
        conn.commit()

        print("Product deleted!" if cursor.rowcount else "Product ID not found.")
    else:
        print("Deletion cancelled.")

    cursor.close()
    conn.close()


while True:
    print("\n===== PRODUCT MANAGEMENT =====")
    print("1. Display Products")
    print("2. Add Product")
    print("3. Update Product")
    print("4. Delete Product")
    print("5. Exit")

    choice = input("Enter your choice: ")

    if choice == "1":
        display_products()
    elif choice == "2":
        add_product()
    elif choice == "3":
        update_product()
    elif choice == "4":
        delete_product()
    elif choice == "5":
        print("Exiting...")
        break
    else:
        print("Invalid choice!")