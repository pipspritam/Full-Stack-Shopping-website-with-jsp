# Shopping website with jsp
## Authors
* Ayush Nandi 
    * Email <ayush.idnan@gmail.com>
    * Github [@xarcode](https://github.com/xarcode "xarcode profile") 
    * Instagram [@_whoisayush](https://www.instagram.com/_whoisayush "Ayush's instagram")
* Pritam Mondal 
    * Email <pritammondalpips@gmail.com>
    * Github [@pipspritam](https://github.com/pipspritam "pipspritam profile")
    * Instagram [@pritam_pips](https://www.instagram.com/pritam_pips "Pritam's instagram")
## Website Objective
This is an implementation of an e-commerce website where users can buy products online. It handles everything from Product viewing, adding cart items, to placing orders and handling transcations. This website is built on jsp (backend) and hrml/css/javascript (frontend)

***

## Requirements
* Tomcat Server
* Oracle Database (11 g)
* Java 8

***
## Home page files
* User Home - shopping_website_with_jsp/index.jsp
* Admin Home - shopping_website_with_jsp/admin/admin_index.jsp
## Tables used
1. ITEM
    ``` sql
    CREATE TABLE  "ITEM" 
   (	"PRODUCT_ID" VARCHAR2(30), 
	"PRODUCT_NAME" NVARCHAR2(500), 
	"PRICE" NUMBER, 
	"DESCRIPTION" NVARCHAR2(2000), 
	"QUANTITY" NUMBER, 
	"DISCOUNT" NUMBER(5,0), 
	"COMPANY" VARCHAR2(30), 
	"CATEGORY" VARCHAR2(30), 
	 PRIMARY KEY ("PRODUCT_ID") ENABLE
   ) ; 
   ```
   * Item table used for storing information about all products in the inventory. These include, 
        * Product id (primary key)
        * Product name
        * Price
        * Description
        * Quantity
        * Discount
        * Company
        * Category

2. USERS
    ``` sql
    CREATE TABLE  "USERS" 
   (	"NAME" VARCHAR2(30), 
	"EMAIL" VARCHAR2(30), 
	"PHONE" VARCHAR2(12), 
	"PASSWORD" VARCHAR2(30), 
	"ADDRESS" NVARCHAR2(2000), 
	"PINCODE" NUMBER(6,0), 
	 PRIMARY KEY ("EMAIL") ENABLE
   ) ;
    ```
   * Users table is used for storing information about all the registered users of this website. These include
        * Name
        * Email (primary key)
        * Phone
        * Password
        * Address
        * Pincode
`
3. CART
    ``` sql
    CREATE TABLE  "CART" 
   (	"PRODUCT_ID" VARCHAR2(30), 
	"EMAIL" VARCHAR2(30), 
	"QUANTITY" NUMBER(5,0), 
	 PRIMARY KEY ("EMAIL", "PRODUCT_ID") ENABLE
   ) ;
   ```
   * This table is used to store the products currently in a registered user's cart. This is achieved by combining two columns ( email and product id )to represent a primary key.
   * The columns in this table are as follows:
        * Product Id (primary key)
        * Email (primary key)
        * Quantity
4. ORDERS
    ``` sql
    CREATE TABLE  "ORDERS" 
   (	"ORDER_ID" VARCHAR2(30), 
	"BUY_DATE" VARCHAR2(10), 
	"USER_EMAIL" VARCHAR2(30), 
	"PRODUCT_ID" VARCHAR2(30), 
	"QUANTITY" NUMBER, 
	"TOTAL_PAYABLE" NUMBER, 
	"SHIPPING_NAME" VARCHAR2(30), 
	"SHIPPING_PHONE" VARCHAR2(10), 
	"SHIPPING_ADDRESS" NVARCHAR2(2000), 
	"SHIPPING_PINCODE" VARCHAR2(7), 
	"PRODUCT_NAME" NVARCHAR2(500), 
	"PAYMENT_METHOD" VARCHAR2(30), 
	"BUY_TIME" VARCHAR2(30), 
	"SHIPPING_EMAIL" VARCHAR2(30), 
	"PRICE" NUMBER, 
	 PRIMARY KEY ("ORDER_ID") ENABLE
   ) ;
    ```
   * This table is used to store all the processed orders in the website. This table is also used to show the order history of each user. The admin has access to the entire order history
   * This table has the following columns
        * Order Id (primary key)
        * Buy Date
        * User email
        * Product ID
        * Quantity
        * Total Payable
        * Shipping Name
        * Shipping Phone
        * Shipping Address
        * Shipping Pincode
        * Product Name
        * Payment Method
        * Buy Time
        * Shipping Email
        * Price

5. TEMP_ORDER
    ``` sql
    CREATE TABLE  "TEMP_ORDER" 
   (	"ORDER_ID" VARCHAR2(30), 
	"EMAIL" VARCHAR2(30)
   ) ;
   ```
   * The need for an intermediate table arose during the implementation of bill printing for items ordered through the cart, because passing multiple product ids through the same form and storing them in the target jsp page was not possible.
   * Hence, the cart product ids were transfered to this intermediate table, and during the generation of bill, this tabel was used to get all the required information. Once the date is retreived, this table is deleted of all data
   * The columns include
        * Order Id
        * Email

6. WISHLIST
    ``` sql
    CREATE TABLE  "WISHLIST" 
   (	"EMAIL" VARCHAR2(30), 
	"PRODUCT_ID" VARCHAR2(30), 
	 PRIMARY KEY ("PRODUCT_ID", "EMAIL") ENABLE
   ) ;
   ```
   * Table used to store the items wishlisted by the website's registered users
   * This table is referred to while showing individual user's wishlist. 
   * The table has the following columns
        * Email (Primary key)
        * Product Id (Primary key)

7. ADMIN
    ``` sql
    CREATE TABLE  "ADMIN" 
   (	"NAME" VARCHAR2(30), 
	"EMAIL" VARCHAR2(30), 
	"PASSWORD" VARCHAR2(30), 
	 PRIMARY KEY ("EMAIL") ENABLE
   ) ;
    ```
    * This table stores information about all the current admins of this website
    * The columns include
        * Name
        * Email (primary key)
        * Password

8. MESSAGE_TABLE
    ``` sql
    CREATE TABLE  "MESSAGE_TABLE" 
   (	"MESSAGE" VARCHAR2(30)
   ) ;
   ```
   * Used to pass messages between backend and frontend while redirecting
   * Columns used
        * Message