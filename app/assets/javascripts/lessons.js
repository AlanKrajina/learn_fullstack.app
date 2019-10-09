$(() => {
    bindClickHandlers()
})

const bindClickHandlers = () => {
    $('.all_lessons').on('click', e => {
        e.preventDefault()
        history.pushState(null, null, "lessons")
        getLessons()
    })



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
  

  }




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
  
  function Lesson(lesson) {
    this.id = lesson.id
    this.title = lesson.title
    this.content = lesson.content
    this.user = lesson.user
    this.comment = lesson.comment
    this.ratings = lesson.ratings

  
  };

  Lesson.prototype.formatIndex = function(){
    let lessonHtml = `
      <a href="/lessons/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.title}</h1></a>
      <p>${this.content}</p>
      <p>${this.comment.text}</p>
    `
    return lessonHtml
  };


  Lesson.prototype.formatShow = function(){
    let lessonHtml = `
      <h3>${this.title}</h3>
      <p>${this.content}</p>
      <p>${this.comment.text}</p>
    `
    return lessonHtml
  };