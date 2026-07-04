#User Add Product
def add(cursor,db):
    try:
        product_name=input("Name of Product: ").strip()
        total_stock=int(input("Enter Total Stock: "))
        price=float(input("Enter Price: "))
        discount=float(input("Enter Discount on Product: "))
        while price<0:
            print("Message: Price can't be negative")
            price=float(input("Enter Price: "))
        while discount<0:
            print("Message: Discount can't be negative")
            discount=float(input("Enter Discount on Product: "))
        add="INSERT INTO product (product_name, total_stock, price, discount) VALUES(%s,%s,%s,%s)"
        values=(product_name, total_stock, price, discount)
        cursor.execute(add,values)
        db.commit()
        print("INSERTED Successfully!")
    except Exception as e:
        print("Error: ",e)
#user update product
def update(cursor,db):
    try:
        user=int(input("Enter product id to Update: "))
        print("""What do youo want to update?
            1.Price  
            2.Total stock
            3.discount""")
        choice=input("Enter your choice:").lower()
        #price update
        if choice=="1" or choice=="price":
            new_price=float(input("Enter New Price: "))
            update="UPDATE product SET price=%s WHERE product_id=%s"
            values=(new_price,user)
        #total stock update
        elif choice=="2" or choice=="total stock":
            new_stock=int(input("Enter total number of stock: "))
            update="UPDATE product SET total_stock=%s WHERE product_id=%s"
            values=(new_stock,user)
        #discount update
        elif choice=="3" or choice=="discount":
            new_discount=float(input("Enter discount: "))
            update="UPDATE product SET discount=%s WHERE product_id=%s"
            values=(new_discount,user)
        else:
            print("invalid choice")
            update=None
        if update:
            cursor.execute(update,values)
            db.commit()
            print("UPDATED Successfully!")
    except TypeError as te:
        print("Error: ",te)
    except Exception as  e:
        print("Error: ",e)
# user read 
def read_product(cursor,db):
    try:
            read_query="SELECT * from product"
            cursor.execute(read_query)
            result=cursor.fetchall()
            for rows in result:
                print(rows)
    except Exception as e:
        print("Error: ",e)
# delete
def delete(cursor,db):
    try:
        delete_product=int(input("Enter Product id to Delete: "))
        confirm=input(f"Are you sure you want to delete {delete_product} (yes/no)?").lower()
        if confirm=="yes":
            del_query="DELETE FROM product WHERE product_id=%s"
            values=(delete_product,)
            cursor.execute(del_query,values)
            db.commit()
            print("DELETED Successfully!")
        else:
            print("DELETE Cancelled!")
    except Exception as e:
        print("Error: ",e)
def sales_add(cursor,db):
    try:
        user=input("Enter Product name: ")
        discount=float(input("Enter Discount on product"))
        number=int(input("Enter number of Product sold: "))
        query="Select product_id,total_stock from product where product_name=%s"
        values=(user,)
        cursor.execute(query,values)
        result=cursor.fetchone()
        if result is None:
            print("Product not found")
            return
        product_id=result[0]
        current_stock=result[1]
        if current_stock>=number:
            query="UPDATE product Set total_stock = total_stock-%s where product_id=%s"
            values=(number,product_id)
            cursor.execute(query,values)  
            query="INSERT INTO sales (product_id,discount_applied, quantity_sold,sale_date) VALUES(%s,%s,%s,Now())"
            values=(product_id,discount,number)
            cursor.execute(query,values)
            db.commit()
        else:
            print("Not enough stock")
    except Exception as e:
        db.rollback()
        print("Error Occured",e)

        
"""def total_stock(cursor,db):
    query="SELECT product_name, total_stock,price from product"
    cursor.execute(query,)
    db.commit()
def dashboard_3months(cursor,db):
    try:
        query="SELECT product.brand_id,SUM(sales.quantity_sold) AS total_sales,AVG(sales.quantity_sold) AS avg_sales" \
        "FROM sales" \
        "JOIN product ON sales.product_id=product.product_id"
        "WHERE sales.sale_date>= CURRENT_DATE-INTERVAL 3 MONTHS " \
        "GROUP BY product.brand_id" 
        cursor.execute(query)
        result=cursor.fetchall()
        print("3- Months")
        for row in result:
            brand_id=row[0]
            total_sales=row[1]
            avg_sales=row[2]
            if avg_sales<50:
                 status="Weak"
            elif avg_sales<=100:
                status="Warning"
            else:
                status="good"
            print(f"Brand Id: {brand_id}")   
            print(f"Total Sales: {total_sales}") 
            print(f"Average Sales: {avg_sales}")      
            print(f"Status : {status}") 
            print("-"*30)  
    except Exception as e:
        print("Error: ",e)"""


