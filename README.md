# Setup
- You will probably need to change the application.yml file to your local database credentials
```
bundle install
rake db:create
rake db:migrate
rake db:seed_fu
rails s
```

# Testing
```
rspec spec/models/pay_account_spec.rb
```
or
```
rspec
```

# Test
1. Commit code to your repository at start(THIS IS IMPORTANT) and make sure to only take around an hour. This test is more about a feel of where you are at and less if you can complete everything.
2. Make the create button work and shows a form that allows a user to enter nickname, account number, and account type
3. Implement Account Class to read xml file(assets/xml/loan.xml) and find the loan number and borrower name in the xml to be displayed in pay_accounts/index.html.erb(can be placed anyhwhere in the index file)
4. Use javascript/jQuery to connect the hide button. The button should replace the all the characters except the last 4, with *.
Example: 4111111111111111 -> ************1111

# Extra Credit(but not required)
1. Create a new migration for a user
2. Write some tests for pay_accounts
3. Build a navigation bar
4. Feel free to add anything you might feel adds to the project
