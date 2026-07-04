import crud
import mysql.connector

print("--- Starting Connection Check ---")


db = mysql.connector.connect(
                host="localhost",
                user="root",
                password="mysql",
                database="inventory",
                port=3306,
                use_pure=True
            )

if db.is_connected():
    print("✅ Connected successfully!")
    cursor=db.cursor()
else:
    print("Connection failed")
    exit()
while True:
    print("""
1. View Product
2. Add Product
3. Update Product
4. Delete Product
5. Slip Add
6. Exit
          """)
    try:
        choice= int(input("Enter Choice number: "))
    except ValueError:
        print("Enter Number only!")
        continue
    except:
        print("Error: Invalid Entry")
    if choice==1:
        crud.read_product(cursor,db)
    elif choice==2:
        crud.add(cursor,db)
    elif choice==3:
        crud.update(cursor,db)
    elif choice==4:
        crud.delete(cursor,db)
    elif choice==5:
        crud.sales_add(cursor,db)
        print()
    elif choice==6:
        break
    else:
        print("Invalid Choice")
def low_stock(cursor,db):
    try:
        query="SELECT product_name,total_stock from product Where total_stock<10"
        cursor.execute(query)
        result=cursor.fetchall()
        if not result:
            print("No Low stock")
        else:
            print("LOw tock products")
            for row in result:
                print("Product: ",row[0]," Stock: ",row[1])
    except:
        print("Error Occured")
def best_selled(cursor,db):
    query="""SELECT p.product_name, SUM(s.quantity_sold) as total
    FROM sales s
    JOIN product p ON
    s.product_id=p.product_id
    GROUP BY p.product_name
    ORDER BY total DESC
    LIMIT 3;"""
    cursor.execute(query)
    result=cursor.fetchall()
    print("Best Selling Products: ")
    for row in result:
        print("Product: ", row[0], "Sold: ",row[1])
    db.commit()
low_stock(cursor,db)
best_selled(cursor,db)
cursor.close()
db.close()
