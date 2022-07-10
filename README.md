# T2A2 - Marketplace Project

#### R7 & R8 Identification of the problem and whiy it needs solving
As a resident in a big apartment building located in a busy area, I found that it is very difficult for us to handle our unwanted bulky household items. Unlike the usual residential area where the council offers kerbside collections, our building only has an annual fixed date for such household collections. Besides, there is only a limited space for people to put their bulky items for collection on that day which certainly makes the problem worse. Therefore, it comes to my mind to build a marketplace app for our apartments so people can handle their household items easier and more freely.

While there are already many marketplace apps available like Gumtree or Facebook marketplace, my app still brings certain advantages. Firstly, it just focuses on the range of our apartment building, which gives users refined local classifieds. Moreover, many tenants are moving in/out of the building frequently, so this app can serve as a billboard to connect people. People can find what they need when moving in and get rid of unwanted items when moving out. 

#### R9 A link (URL) to your deployed app (i.e. website)
(https://github.com/Jimmyboei/KaiqiLiao_T2A2)

#### R10 A link to your GitHub repository (repo)
(https://rise-apartment-marketplace.herokuapp.com/)

#### R11 Description of your marketplace app (website)

- Purpose

The marketplace app allows people in the Rise Apartment to list and sell their household items and browse other peoples' listings and contact the seller. 

- Functionality / features

New users can view all listings and if they are interested, they can sign up to creater their own listings and contact the seller. When creating new listings, users will be asked to select a category such as appliances or furnitures and put in details. A default image is provided for the listing and user can also choose to upload an image. They can update the listing details later or delete it if it's sold. Users can send messages to contact sellers. Messages are organised in group of sellers and buyers for easier view and access.   

- Sitemap

placeholder

- Screenshots

placeholder

- Target audience

The resident in Rise Apartment who wants to sell or buy household items.

- Tech stack (e.g. html, css, deployment platform, etc)
  - Ruby on Rails for the framework
  - sqlite3 for databese in app development
  - PostgresSQL for database in final production
  - Bootstrap for webpage styling
  - Github for source control
  - Heroku for deployment

#### R12 User stories for your app

- As a new user, I want to view all current listings and sign up for an account.
- As a user, I want to view all listings and create new listings.
- As a user, I want to access to my listings and edit or delete them.
- As a buyer, I want to contact the seller when viewing their listings.
- As a seller, I want to view the message sent to me for enquiring my listings.
- As a seller, I want to reply to enquiring messages.
- As a buyer, I want to check if the seller has replied to my messages.
- As a user, I want to keey sending messages to others regarding a specific listing.
- As a user, I cannot edit or delete messages I sent or received.
- As an admin user, I can view and edit the categories for listings.
 

#### R13 Wireframes for your app

lksdfjlkja

#### R14 An ERD for your app

dsafljk

#### R15 Explain the different high-level components (abstractions) in your app

This app is built in the Ruby on Rails in the MVC architecture and high-level components are as follows:
 - Models: it uses the ActiveRecord to define relationships between different models and interact with database for data manipulation. The data input validation is also defined in models.
 - Controllers: Each model has its own controllers that includes all actions required to pass HTTPS requests from the view to model or retrive the data required to the view.
 - Views: this is the app's front end interface to users. In this case it's the webpage represents information from database and styling with CSS Bootstrap. 

#### R16 Detail any third party services that your app will use

- Cloudinary is used for cloud storage of listings' images uploaded by user. It is also used to modify those images and generate the thumb image in the listing webpages.
- Heroku is used to host the app and its database and provide url access to users.

#### R17 Describe your projects models in terms of the relationships (active record associations) they have with each other

Models in this app are: User, Message, Listing and Category and their relationships are as follows:
- User has many listings and messages
- Listing belongs to one user and one category. Listing has many messages
- Messages belongs to one user and one listing.
- Category has many listings

#### R18 Discuss the database relations to be implemented in your application

The data is stored in the database as tables. Each table has its own unique id as primary key and establish the relationship with other tables using the foreign key.

For the User table, it has the user email and passowrd and its primary key user_id is used as foreign key in the Message and Listing table as one user can have many listings and messages. 

For the Listing table, it has the category_id and user_id as foreign key as belongs to one user and one category.

For the Message table, it has user_id and listing_id as foreign key as one message belongs to one user and one listing. To identify whether it's a sent or received message, the attribute is_response is used, which checks the current user_id with listing's user_id. So message can be grouped accordingly in the view.

#### R19 Provide your database schema design

**Active Storage Schema:**
```
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end
```
**Listing Schema:**
```
  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id", null: false
    t.integer "user_id", null: false
    t.index ["category_id"], name: "index_listings_on_category_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end
```

**Category Schema:**
```
create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
```

**Message Schema:**
```
  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.boolean "is_response"
    t.integer "user_id", null: false
    t.integer "listing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_messages_on_listing_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end
```

**User Schema:**
```
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
```

**User and Role Schema:**
```
  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end
```

**Foreign Key Schema:**
```
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "listings", "categories"
  add_foreign_key "listings", "users"
  add_foreign_key "messages", "listings"
  add_foreign_key "messages", "users"
```

#### R20 Describe the way tasks are allocated and tracked in your project

I used the Agile methodology for the project management and trello to devide each stage into to-do lists and small tasks to stay in the right track. In the planning stage, the first thing to do was to identify the problem and design the ERD. Once the relationship between models were cleared, the next task was to design the wireframe for webpages and start buidiling the app. This was done by diving the app development into sections based on the user stories and related features. The Github is used for source control throughout the project and also used in the Heroku development. In the final production stage the app and its database was checked again to ensure bug free before final release and finish the documentation.  