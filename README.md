# README

This is a rails application about building a blog for RTH test

Heroku link: https://whispering-anchorage-41246.herokuapp.com/

# Installation

+ `git clone git@github.com:Vuta/blog_test.git`
+ `bundle`
+ `rails db:migrate && rails db:seed` (seeding data may take a few minutes)

# API for retrive posts

All the request must set `app_token` in the header to `temporary token`

* To retrieve a single post: Send a GET request to API endpoint: https://whispering-anchorage-41246.herokuapp.com/api/v1/posts/:post_id

* To retrieve list posts: Send a GET request to API endpoint: https://whispering-anchorage-41246.herokuapp.com/api/v1/posts, with the `params`: `page`, `per_page`. If those params are nil, all posts will be returned. 

* To search for posts: Send a GET request to API endpoint: https://whispering-anchorage-41246.herokuapp.com/api/v1/search, with the `params`: `title`, `user_id`, `page`, `per_page`. This will retrieve posts that contain the `title` or posted by `user_id` or both. If those params are nil, all posts will be returned.

### Developed by **Tran Anh Vu**
