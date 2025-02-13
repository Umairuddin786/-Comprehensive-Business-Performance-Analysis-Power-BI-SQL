import pandas as pd
import numpy as np
import random
from faker import Faker

# Initialize Faker
fake = Faker()
np.random.seed(42)

# Define number of records
n_customers = 10000
n_products = 500
n_orders = 50000
n_marketing = 20000

# 1. Customers Table
customers = {
    'customer_id': [f"CUST{str(i).zfill(6)}" for i in range(1, n_customers + 1)],
    'customer_name': [fake.name() for _ in range(n_customers)],
    'customer_age': np.random.randint(18, 75, n_customers),
    'customer_gender': np.random.choice(['Male', 'Female', 'Other'], n_customers, p=[0.48, 0.48, 0.04]),
    'customer_city': [fake.city() for _ in range(n_customers)],
    'customer_state': [fake.state() for _ in range(n_customers)],
    'customer_country': np.random.choice(['USA', 'Canada', 'UK', 'Germany', 'India'], n_customers),
    'customer_income': np.random.randint(25000, 150000, n_customers),
    'date_of_registration': [fake.date_between(start_date='-10y', end_date='today') for _ in range(n_customers)],
    'preferred_contact_method': np.random.choice(['Email', 'Phone', 'SMS'], n_customers),
    'customer_phone': [fake.phone_number() for _ in range(n_customers)],
    'customer_email': [fake.email() for _ in range(n_customers)]
}
customers_df = pd.DataFrame(customers)

# 2. Products Table with Realistic Product Names
categories = ['Electronics', 'Clothing', 'Home Appliances', 'Books', 'Toys']
subcategories = {
    'Electronics': ['Smartphones', 'Laptops', 'Headphones', 'Cameras'],
    'Clothing': ['Men', 'Women', 'Kids'],
    'Home Appliances': ['Kitchen', 'Laundry', 'Cleaning'],
    'Books': ['Fiction', 'Non-Fiction', 'Education'],
    'Toys': ['Action Figures', 'Board Games', 'Dolls']
}
real_product_names = {
    'Smartphones': ['iPhone 14', 'Samsung Galaxy S22', 'Google Pixel 7', 'OnePlus 10 Pro', 'Xiaomi Mi 12'],
    'Laptops': ['MacBook Pro', 'Dell XPS 13', 'HP Spectre x360', 'Lenovo ThinkPad X1', 'Asus ZenBook 14'],
    'Headphones': ['Sony WH-1000XM4', 'Bose QC35 II', 'Apple AirPods Max', 'Beats Studio3', 'Sennheiser HD 450BT'],
    'Cameras': ['Canon EOS R5', 'Nikon Z7 II', 'Sony A7 IV', 'Fujifilm X-T4', 'Panasonic Lumix GH5'],
    'Men': ['Levi\'s Jeans', 'Nike T-Shirt', 'Adidas Hoodie', 'Puma Shorts', 'Under Armour Jacket'],
    'Women': ['H&M Dress', 'Zara Top', 'Gucci Scarf', 'Chanel Handbag', 'Uniqlo Skirt'],
    'Kids': ['Gap Kids Sweater', 'Old Navy Pants', 'Nike Sneakers', 'Adidas Cap', 'Carter\'s Jacket'],
    'Kitchen': ['Instant Pot', 'KitchenAid Mixer', 'Cuisinart Blender', 'Le Creuset Dutch Oven', 'OXO Knife Set'],
    'Laundry': ['LG Washing Machine', 'Samsung Dryer', 'Whirlpool Iron', 'Bosch Laundry Basket', 'Panasonic Steamer'],
    'Cleaning': ['Dyson Vacuum', 'iRobot Roomba', 'Swiffer Mop', 'Shark Steam Cleaner', 'Black+Decker Dustbuster'],
    'Fiction': ['The Great Gatsby', '1984', 'To Kill a Mockingbird', 'Pride and Prejudice', 'The Catcher in the Rye'],
    'Non-Fiction': ['Sapiens', 'Educated', 'Becoming', 'The Immortal Life of Henrietta Lacks', 'Born a Crime'],
    'Education': ['Algebra Textbook', 'Physics for Engineers', 'Introduction to Programming', 'Biology Basics', 'Chemistry Essentials'],
    'Action Figures': ['Marvel Iron Man', 'Batman Action Figure', 'Spider-Man Figure', 'Transformers Optimus Prime', 'Star Wars Yoda'],
    'Board Games': ['Monopoly', 'Scrabble', 'Chess Set', 'Catan', 'Ticket to Ride'],
    'Dolls': ['Barbie Doll', 'American Girl Doll', 'Disney Princess Doll', 'LOL Surprise Doll', 'Baby Alive']
}

products = {
    'product_id': [f"PROD{str(i).zfill(6)}" for i in range(1, n_products + 1)],
    'category': [random.choice(categories) for _ in range(n_products)],
    'subcategory': [random.choice(subcategories[cat]) for cat in random.choices(categories, k=n_products)],
}
products['product_name'] = [random.choice(real_product_names[subcat]) for subcat in products['subcategory']]

products.update({
    'unit_price': np.random.randint(20, 1000, n_products),
    'manufacturer': [fake.company() for _ in range(n_products)],
    'stock_quantity': np.random.randint(10, 1000, n_products),
    'launch_date': [fake.date_between(start_date='-5y', end_date='today') for _ in range(n_products)],
    'supplier_contact': [fake.phone_number() for _ in range(n_products)],
    'product_rating': np.random.uniform(1, 5, n_products).round(1)
})

products_df = pd.DataFrame(products)




# 3. Orders Table
orders = {
    'order_id': [f"ORD{str(i).zfill(6)}" for i in range(1, n_orders + 1)],
    'customer_id': np.random.choice(customers['customer_id'], n_orders),
    'product_id': np.random.choice(products['product_id'], n_orders),
    'order_date': [fake.date_between(start_date='-2y', end_date='today') for _ in range(n_orders)],
    'shipment_date': [fake.date_between(start_date=od, end_date=od + pd.Timedelta(days=random.randint(1, 7)))
                      for od in pd.to_datetime([fake.date_between(start_date='-2y', end_date='today') for _ in range(n_orders)])],
    'quantity': np.random.randint(1, 50, n_orders),
    'total_price': np.random.randint(50, 2000, n_orders),
    'payment_method': np.random.choice(['Credit Card', 'PayPal', 'Bank Transfer'], n_orders),
    'order_status': np.random.choice(['Completed', 'Pending', 'Cancelled'], n_orders),
    'shipping_address': [fake.address() for _ in range(n_orders)],
    'shipping_cost': np.random.randint(5, 100, n_orders),
    'shipping_method': np.random.choice(['Standard', 'Expedited', 'Overnight'], n_orders)
}
orders_df = pd.DataFrame(orders)

# 4. Marketing Table
marketing = {
    'campaign_id': [f"CAM{str(i).zfill(6)}" for i in range(1, n_marketing + 1)],
    'order_id': np.random.choice(orders['order_id'], n_marketing),
    'campaign_type': np.random.choice(['Email Campaign', 'Social Media', 'TV Commercial', 'Google Ads', 'Radio Ads'], n_marketing),
    'start_date': [fake.date_between(start_date='-2y', end_date='-1y') for _ in range(n_marketing)],
    'end_date': [fake.date_between(start_date='-1y', end_date='today') for _ in range(n_marketing)],
    'marketing_spend': np.random.randint(500, 20000, n_marketing),
    'reach': np.random.randint(5000, 200000, n_marketing),
    'impressions': (np.random.randint(5000, 200000, n_marketing) * 1.2).astype(int),
    'clicks': (np.random.randint(5000, 200000, n_marketing) * 0.01).astype(int),
    'conversion_rate': np.random.uniform(0.01, 0.1, n_marketing).round(2)
}
marketing_df = pd.DataFrame(marketing)

# 5. Financials Table
financials = {
    'financial_id': [f"FIN{str(i).zfill(6)}" for i in range(1, n_orders + 1)],
    'order_id': orders['order_id'],
    'cogs': np.random.randint(100, 1000, n_orders),
    'operational_expenses': np.random.randint(500, 5000, n_orders),
    'other_expenses': np.random.randint(100, 3000, n_orders),
    'total_revenue': np.random.randint(500, 10000, n_orders),
    'profit': np.random.randint(-500, 9000, n_orders),
    'financial_date': pd.to_datetime(orders['order_date']),
    'taxes_paid': np.random.randint(10, 500, n_orders),
    'discount_given': np.random.randint(0, 300, n_orders)
}
financials_df = pd.DataFrame(financials)

# Save DataFrames
customers_df.to_csv('customers.csv', index=False)
products_df.to_csv('products.csv', index=False)
orders_df.to_csv('orders.csv', index=False)
marketing_df.to_csv('marketing.csv', index=False)
financials_df.to_csv('financials.csv', index=False)

print("Data generation completed with realistic and comprehensive attributes.")
