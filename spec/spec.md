# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app. (Yes)
- [x] Use ActiveRecord for storing information in a database. (I used ActiveRecord to create 2 models. A wine model and a user model and created an association between them - Wines belong_to users and Users have_many wines). Set up validations to confirm correct data before it is persisted to the database.)
- [x] Include more than one model class (e.g. User, Post, Category) (Yes - Wine and User)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) (Yes - Users have many wines)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) (Yes- Wines belong to users).
- [x] Include user accounts with unique login attribute (username or email) (Yes - ActiveRecord  validations tests for this before data persisted)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (Yes - wines belong to users and they can be created, read, updated, and destroyed).
- [x] Ensure that users can't modify content created by other users (Yes - only can edit and delete your own wine reviews)
- [x] Include user input validations (Yes - username, email, etc.)
- [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) (Yes - for example, if you try to sign up with an already taken email you will get a specific error message per that validation)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code (Yes - includes all of these things).

Confirm
- [X] You have a large number of small Git commits (Yes)
- [X] Your commit messages are meaningful (Yes)
- [X] You made the changes in a commit that relate to the commit message (Yes)
- [X] You don't include changes in a commit that aren't related to the commit message (Yes)
