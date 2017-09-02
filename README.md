# Members only
App demonstrates sort of private blog where you can see authors profiles and their posts if you sign and have access rights

* Ruby v2.2, Rails 5.1

* In development used SQLite engine v3.6.18
# Brief description
Includes authentication and authorization system. Uses session for usual seance and cookie for memorizing user. Cookie token is placed in Users database table.
Authorization is based on checking mark while registration.
For password and cookie encryption were used SecureRandom and BCrypt
