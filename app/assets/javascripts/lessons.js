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
    <section class="twitter allign4">
    <p class="creator">Author:<p>
    <p class="author">${this.user.name}</p>
    <p class="p">Lesson title:</p>
    <a href="/lessons/${this.id}" data-id="${this.id}" class="show_link"><p class="subs title">${this.title}</p></a>
    <p class="p">Lesson content: </p>
    <p class="subs">${this.content}</p>
    <p class="p">Lesson comment: </p>
    <p class="subs">${this.comment.text}</p>
  </section>
    `
    return lessonHtml
  };


  Lesson.prototype.formatShow = function(){
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
    </section>
    `
    return lessonHtml
  };