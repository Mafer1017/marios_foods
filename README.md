# Mario's Specialty Foods

##### By: Marcus Ferreira

## Description

_This project allows users to input food products and add reviews for each product._

## Technologies Used

* _Ruby_
* _Rails_
* _Gems_
* _Bundler_
* _RSpec_
* _Capybara_
* _Postgres_
* _SQL_


## Setup/Installation Requirements

* Clone or download this repository onto your desktop
* Navigate to top-level of directory
* In the main project directory, enter `bundle install` in the terminal to include necessary gems.
* Create the necessary databases on your device using postgres by inputting the following command in the terminal:
    `rake db:create`  
* Migrate the database by running:
    `rake db:migrate` 
* Create the testing database by inputting the following command in the terminal:
    `rake db:test:prepare` 
* Seed the database by running:
    `rake db:seed` 
* In a separate terminal window, run:
    `rails s`
* Open your browser and nagivate to `http://localhost:3000/`
* Create an account by clicking the Sign Up link in the top of the homepage and enter the required details.
* Open the rails console by entering the command `rails c` in your terminal
* Navigate to the account you created by inputting ` user = User.where(email: "YOUR EMAIL HERE")` command
* Change user status to admin by entering the command `user.update(admin: true)


## Known Bugs

_There are no known bugs_

## License

[MIT](https://opensource.org/licenses/MIT)


Copyright (c) 2022 Marcus Ferreira