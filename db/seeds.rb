User.create(name: 'Semi', email: 'semi@abc.com')

comment1 = Comment.create(text: "Great lesson!")
comment2 = Comment.create(text: "Update would be great")

Lesson.create(title: "Rails with JavaScript Portfolio Project", content: "In this assessment you are going to expand upon your previous Rails project assessment. The goal is to add dynamic features to your previous Rails application that are possible only through JavaScript and a JSON API.", user_id:1, comment_id:comment1)
Lesson.create(title: "Rails Portfolio Project", content: "In this lesson you're going to build a complete Ruby on Rails application that manages related data through complex forms and RESTful routes. The goal of the application is to build a Content Management System, whether the content being managed is Blog Posts, Recipes, a Library of Resources, or any domain model that lends itself to these requirements (the majority of ideas you could come up with would probably meet the requirements).", user_id:1, comment_id:comment2)

rating1 = Rating.create(stars: "9", lesson_id: 1)
rating2 = Rating.create(stars: "10", lesson_id: 1)
rating3 = Rating.create(stars: "5", lesson_id: 2)