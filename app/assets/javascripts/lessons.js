$(() => {
    bindClickHandlers();
})

const bindClickHandlers = () => {
    $('.all_lessons').on('click', e => {
        e.preventDefault()
        history.pushState(null, null, "lessons")
        getLessons()
    })


// show lesson Ajax      
    $(document).on('click', ".show_link", function(e) {
      e.preventDefault()

      $('#app-container').html('')
      let id = $(this).attr('data-id')
      fetch(`/lessons/${id}.json`)
      .then(res => res.json())
      .then(lesson => {
       let newLesson = new Lesson(lesson)
        let lessonHtml = newLesson.formatShow()
  
        $('#app-container').append(lessonHtml)
      })
    })


// new lesson Ajax
    $('#new_lesson').on('submit', function(e) {
      e.preventDefault()
      const values = $(this).serialize()

      $.post("/lessons", values).done(function(data){
     //   console.log(data)
        $('.twitter').html('')
        let newLesson = new Lesson(data)
        let lessonHtml = newLesson.formatShow()
        $('.twitter').html(lessonHtml)
      })
    })
  }



// index lessons Ajax      
  const getLessons = () => {
    fetch(`/lessons.json`)
      .then(res => res.json())
      .then(lessons => {
         $('#app-container').html('')
         lessons.forEach(lesson => {
           let newLesson = new Lesson(lesson)
  
           let lessonHtml = newLesson.formatIndex()
  
           $('#app-container').append(lessonHtml)
         })
      })
  }
 


// Lesson constructor Ajax      
  function Lesson(lesson) {
    this.id = lesson.id
    this.title = lesson.title
    this.content = lesson.content
    this.user = lesson.user
    this.comment = lesson.comment
    this.ratings = lesson.ratings
  };




// class functions for Lesson Ajax      
  Lesson.prototype.formatIndex = function(){
    let postRatings = this.ratings.map(rating => {
      return (`
      *${rating.stars}
      `)
    })

    let lessonHtml = `
    <section class="twitter allign4">
    <p class="creator">Author:<p>
    <p class="author">${this.user.name}</p>
    <p class="p">Lesson title:</p>
    <a href="/lessons/${this.id}" data-id="${this.id}" class="show_link"><p class="subs title">${this.title}</p></a>
    <p class="p">Lesson content: </p>
    <p class="subs">${this.content}</p>
    <p class="p">Lesson comment: </p>
    <p class="subs">${this.comment.text}</p>
    <p class="p">Lesson Ratings: </p>
    <p class="subs">${postRatings}</p>

  </section>
    `
    return lessonHtml
  };




  Lesson.prototype.formatShow = function(){

    let postRatings = this.ratings.map(rating => {
      
      if (rating.stars != null){

      return (`
      *${rating.stars}
      `)

        } else {
          return (`
            There are no ratings yet.
          `)
    }})
    let lessonHtml = `
      <section class="twitter allign3">
      <p class="creator">Author:<p>
      <p class="author">${this.user.name}</p>
      <p class="p">Lesson title:</p>
      <p class="subs title">${this.title}</p>
      <p class="p">Lesson content: </p>
      <p class="subs">${this.content}</p>
      <p class="p">Lesson comment: </p>
      <p class="subs">${this.comment.text}</p> 
      <p class="p">Lesson Ratings: </p>

      <p class="subs">${postRatings}</p>
    </section>
    `
    return lessonHtml
  };
