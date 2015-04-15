$(document).on('page:change', function() {
  $(".new_question").on('submit', function(e) {
    e.preventDefault();
    var source = $('#question_template').html();
    var templating = Handlebars.compile(source);
    var context = {};

    $.ajax({
      url: '/questions',
      type: 'POST',
      data: {question: { title: $('#question_title').val(), content: $('#question_content').val()}}
    })
    .done(function(response) {
      context.question = response;
      $('.questions ul').append(templating(context))
      $('#question_title').val('')
      $('#question_content').val('')
    })
    .fail(function(response) {
      $('.error').text('');
      $('.error').append(response.responseText)
    })
  });
})

