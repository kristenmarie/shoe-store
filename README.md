# _Shoe Store_

![image](https://user-images.githubusercontent.com/15882954/31039693-9b9853e2-a534-11e7-9ae5-82fc5e099620.jpg)

#### _An application to track shoe brands and stores they are in!_

#### By _**Kristen Marie Kulha**_

## Description

This web application allows users to add, update, delete and list shoe stores. The user an add and list shoe brands, which include price, add existing shoe brands to a store to show where they are sold (user can associate the same brand of shoes with multiple stores), and see all brands that a store sells on an individual store page.

## Specifications
* Store names and shoe brands are saved with a capital letter regardless of how they are entered.
  * Example input: shoe superstore
  * Example output: Show superstore
* Entered prices should be changed to currency format
  * Example input: 50
  * Example output: $50.00
* All stores and brands are unique, no two entries are the same
  * Example input: Adidas
  * Example output: "This brand is already in the database!"
* Store and brand names have a max of 100 characters
  * Example input: This is a really long store name that is completely unnecessary but it is for testing purposes!! :)
  * Example output: "Store names cannot exceed 100 characters"
* Stores and shoe brands can't be created with a blank name
  * Example input: ""
  * Example output: Name field cannot be left blank.
* Brand and Store names cannot contain offensive language
  * Example input: curmudgeon
  * Example output: Name is reserved
* Will not capitalize words in names that should remain lowercase.
  * Example input: wooley and walkers
  * Example output: Wooley and Walkers
* Brands can't be created without a price
  * Example price input: nil
  * Example output: Price can't be blank

## Setup/Installation Requirements

* _Clone directory from github using git_

* __NOTE: These instructions assume you already have Ruby and Sinatra installed.__

### Installing the necessary database:

* _Do you have postgres and psql installed? [Download](https://www.postgresql.org/download/)_

* _In terminal, navigate into main project directory folder_

* _In your terminal enter:_ ``` $ bundle install ```

* _In your terminal enter:_ ``` $ rake db:create ```

* _Enter:_ ```$ruby app.rb```

* _In web browser of choice copy and paste the following into the address field :_ ```http://localhost:4567/```


## 🐛Known Bugs🐛

_There are no known bugs at this time._

## 📧Support and contact details📧

_Feel free to contact me at kristen.m.kulha@gmail.com_

## Technologies Used

_Ruby, Sinatra, SQL, HTML, CSS, Bootstrap, ActiveRecord, Postgres_

### License

*This software is licensed under the MIT license.*

Copyright (c) 2017 **_Kristen Marie Kulha_**
