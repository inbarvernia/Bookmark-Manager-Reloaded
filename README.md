# Bookmark Manager

## User Stories
```
As a browser user
So that I can go back to pages I've bookmarked
I want to be able to view a list of bookmarks
```
```
As a browser user
So I can find useful webpages again
I want to be able to add them to bookmarks
```
## How to use
### To set-up the project
Clone this repository and then run `bundle install`.

### To set-up the database
Connect to `psql` and create the `bookmark_manager` database:
```
CREATE DATABASE bookmark_manager;
```
To set-up the appropriate tables, connect to the database in `psql` (using `\c bookmark_manager;`) and run the SQL scripts in `db/migrations` in order.

Create a second database for tests using `\c bookmark_manager_test` and run the SQL scripts in `db/migrations` for it as well.

### To run the Bookmark Manager app
run `rackup -p 4567`

### To view bookmarks
Open a browser and navigate to `localhost:4567/bookmarks/`.
