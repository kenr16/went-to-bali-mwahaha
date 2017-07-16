# README

E-commerce site. Uses `bcrypt` and `materialize`. There's a seed file. Set up your own admin. If you have questions, I'll be in Bali with no email. Ask someone else.

To set up:

* `rake db:setup`

* Sorry, didn't get around to tests. It mostly works. There might be a few bugs.


Went to Bali

Objective

The objective of Went to Bali was to take an existing codebase and refactor the code, add additional features and fix any bugs found in the software.  It is the first time that the coursework has requested the refactor of an existing set of code rather than simply creating one's own  project from scratch.

Description

Went to Bali will allow the user to log in as either an new user or an admin, and if an account does not currently exist, create a new one.  From there, the user can add fictional items to a shopping cart and check out, clearing their basket and adding their order to their order history.  As an admin, the user can add new products to the site, or edit existing products, and in doing so, add images to the products using the paperclip gem to store the images in a database.

Technologies Used

This site was made in Ruby-on-Rails base, with several additional Gem installed, as well as a Postgres database with an ActiveRecord controller.

Setup

From the command line, navigate to the desired folder run "git clone https://github.com/kenr16/went-to-bali-mwahaha"
run "cd went-to-bali-mwahaha"
run "bundle install"
open a new tab and start the postgres server (if not already running) by running "postgres"
In the first tab, run "rake db:create" to create the databases.
run "rake db:migrate" to create the required tables and columns inside the database.
run "rake db:seed" to run the seed file and populate the database.
run "rails s" To start the server
Open browser and navigate to http://localhost:3000/

Added functionality:

Ensure that users can't order a negative number of items.
Add flash messages for signing up, signing in and signing out.
Add product update and delete functionality for admins.
Add admin flash messages for adding, updating and deleting products.
Add Paperclip for product image upload.
Fix the row height for products, which can quickly become uneven.

Technologies Used

Added online Yard Documentation functionality (Special thanks to Aaron Campf)
Run in the command line "yard doc"
run "yard server"
navigate to in the browser "http://localhost:8808/"
enjoy!

HTML
CSS, Bootstrap, SASS Materialize
JavaScript
Ruby
Rails
Faker
Postgres
PSQL
ActiveRecord
bcrypt
Support and contact details

Contact
For further help and support, please contact Ken Rutan vis his current github account, email address will not be listed here for privacy reasons.

Known bugs
Cannot add items to the cart without logging in first.

License

MIT © 2017 Ken Rutan
