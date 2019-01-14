# Checkout Products within Promotion

Our client is an online marketplace; here is a sample of some of the products available on the site:

```bash
Product code  | Name                   | Price
----------------------------------------------------------
001           | Lavender heart         | £9.25
002           | Personalised cufflinks | £45.00
003           | Kids T-shirt           | £19.95
```

This is just an example of products, your system should be ready to accept any kind of product.
Our marketing team wants to offer promotions as an incentive for our customers to purchase these items.
If you spend over £60, then you get 10% off of your purchase. If you buy 2 or more lavender hearts then the price drops to £8.50.
Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.
The interface to our checkout looks like this (shown in Ruby):
```bash
co = Checkout.new(promotional_rules)
co.scan(item)
co.scan(item)
price = co.total
```

Test data
---------
```bash
Basket: 001,002,003
Total price expected: £66.78

Basket: 001,003,001
Total price expected: £36.95

Basket: 001,002,001,003
Total price expected: £73.76 
```

## Getting Started

Get the code. Clone this git repository and check out the latest release:
```bash
git clone https://github.com/trungtinhandsome/logivan_backend_test
cd logivan_backend_test
```    

### Prerequisites

Installing Rails with a specific version number.
```bash
gem install rails -v 5.1.6
```  

### Installing
1.  Install the required gems by running the following command in the project root directory:

    ```bash
    bundle install --without production
    ```
    
2.  Migrate the database:

    ```bash
    rails db:migrate
    ```
    
3. Having run the migration, we can run the local web server:

    ```bash
    rails server
    ```

## Running the automated tests
Run this command below to run the automated tests. 

```
rails test
```

### Manual testing

1/. Adding products with this link below:
```
http://localhost:3000/products/new
```
Example add for:
```
Product code  | Name                   | Price
----------------------------------------------------------
001           | Lavender heart         | £9.25

```
```
If you buy 2 or more lavender hearts then the price drops to £8.50.
```
Product code = 001

Name = Lavender heart

Price = 9.25

Quantity discount = 2

Price discount = 8.5

2/. Adding promotions with this link below:

```
http://localhost:3000/promotions/new
```

Example add for:

```
If you spend over £60, then you get 10% off of your purchase.
```

Code = 60DISCOUNT10

Min total price = 60

Discount rate = 10

Check to "Includes discount item" if it merges to : 
```
If you buy 2 or more lavender hearts then the price drops to £8.50.
```

3/. Calculate total checkout with this link below: 

Example:

```
http://localhost:3000/checkout/001,002,003/60GIAM10
```

```
http://localhost:3000/checkout/001,003,001/60GIAM10
```

```
http://localhost:3000/checkout/001,002,001,003/60GIAM10
```

With params has meaning: '/checkout/:product_codes/:promotion_code'


## Built With

* [RailsTutorial](https://www.railstutorial.org/book/) - Learn Web Development with Rails.
* [API](http://api.rubyonrails.org) - The API Documentation.

## Authors

* **Tin Lee** - *Initial work* - [TinLee](https://github.com/trungtinhandsome)
