# Learn_Fullstack.App

In this project I have built a complete Ruby on Rails application that manages related data through complex forms and RESTful routes. 
Main requirement is to add dynamic features to previous Rails application that are possible only through JavaScript and a JSON API.

For the first requirement we are to use our previous Rails app and upon that one build dynamic JS features. I decided to create a new Rails app just to get more practice. I added additional features and functionalities to differ from previous Rails project.

The app allows us to:

- Sign up, login or log out securely as user.
- This app includes a third party signup/login via Google thanks to the OmniAuth gem.
- User can see all lessons but can only create, update, and delete (CRUD) his own created lesson. 
- User can browse lessons via name.
- User can view users with most lessons created.
- All inputs are validated.
- App translates JSON responses into JavaScript Model Objects using constructor syntax. 
- Includes two prototype methods.
- Renders one index and one show page via JavaScript and an Active Model Serialization JSON Backend.
- Dynamically renders on the page at least one serialized 'has_many' relationship through JSON using JavaScript.
- Renders a form for creating a resource that is submitted dynamically and displayed through JavaScript and JSON without a page refresh.
- App does not use remote: true.

## Prerequisites

You will need to have the following installed on your computer in order to use RecipeManager:

- Ruby
- Rails 5+
- bundler

```
$ sudo gem install bundler
```
## Installation

To install this app onto your local machine:

- Fork and clone this repository with HTTPS

- Open your terminal and change to the local directory where you want to clone your repository and run:
```
$ git clone + git@github.com:AlanKrajina/learn_fullstack.app.git
```
```
$ cd learn_fullstack.app
```

- After checking out the repository, run the following code and automatically a file will be created or updated in your directory: Gemfile.lock with all the gems installed.
```
$ bundle install
```
- If you get any yarn errors run:
```
$ yarn install --check-files
```
- Set up the database:
```
$ rake db:migrate
$ rake db:seed

```
The app uses the dotenv gem for environment variables. Create a .env file in the root of the app and add GOOGLE_CLIENT_ID=your_key and GOOGLE_CLIENT_SECRET=your_secret. If you do not already have a Google account, you will need to do so in order to get these keys through Oauth on Google for developers, in order to log in through Google.

## Usage

- Run rails s and navigate to http://localhost:3000.
```
$ rails s
```
- You can play with and create data via your console: rails c.
```
$ rails c
```
## Requirements

In this assessment you are going to expand upon your previous Rails project assessment. The goal is to add dynamic features to your previous Rails application that are possible only through JavaScript and a JSON API.

Do not use remote: true in this application.

Must translate JSON responses from your Rails app into JavaScript Model Objects using either ES6 class or constructor syntax. The Model Objects must have at least one method on the prototype. (Formatters work really well for this.)

Take a blog domain example and creating a new Post, instead of plainly taking the JSON response of the newly created Post from the Rails app and appending it to the DOM, you would instead create a Post prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.

Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend.

For example: in a blog domain with users and posts, you might display the index of the user's posts on the users show page, fetching the posts via a AJAX GET request, with the backend rendering the posts in JSON format, and then appending the posts to the page.

Must render at least one show page (show resource - 'one specific thing') via JavaScript and an Active Model Serialization JSON Backend.

For example, in the blog domain, you might allow a user to view a post, using AJAX to fetch the post JSON and render it through JavaScript onto the page.

Your Rails application must dynamically render on the page at least one serialized 'has_many' relationship through JSON using JavaScript.

In the previous blog domain example, if each of the posts has many comments, you could render those comments as well on that post's show page.

Must use your Rails application to render a form for creating a resource that is submitted dynamically and displayed through JavaScript and JSON without a page refresh.

In the blog domain example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM using JavaScript (ES6 Template Literals can help out a lot with this).

- Blog explaining one of the requirements: https://alankrajina.github.io/flow_of_fetch_in_rails_and_js_project_to_view_index_content
