# Cart

This is application that immitates Cart behaviour during the online shopping.

# Requirements

* Ruby `3.1.2`
* Postgresql (`brew install postgresql`)

# Local Installation

1. Clone this repo and install Ruby gems

```
gem install bundler
bundle install
```

2. Start services (they should be started on startup)

```
brew services start postgresql
```

3. Run rake task for database creation and seeding

```
rails db:setup
```

4. Launch the server

```
rails s
```

# Tests

To run the test suite

```
rspec

```

# Additional information

The are several routes available:

* http://localhost:3000 – list of available products
* http://localhost:3000/cart – cart, which contains all added products and displays prices. Cart is created automatically for each session
* http://localhost:3000/admin/offers – administration zone, where *offers* can be managed. In order to access it, please use username `admin` and password `admin`

# UI:
### Products page
<img width="1440" alt="Screen Shot 2023-02-12 at 20 26 36" src="https://user-images.githubusercontent.com/899220/218332681-2184322f-242d-4bcb-9d3e-aa00a323c3a8.png">

### Cart page
<img width="1440" alt="Screen Shot 2023-02-12 at 20 28 51" src="https://user-images.githubusercontent.com/899220/218332759-e9fcd14f-bd23-4dd4-8d4c-cfdcd47f2600.png">

### Administration
<img width="1440" alt="Screen Shot 2023-02-12 at 20 29 16" src="https://user-images.githubusercontent.com/899220/218332767-7c218592-22e8-4c58-9dbc-0ae7c2466675.png">
