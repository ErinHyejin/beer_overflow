$(document).on('page:change', function() {
  $(".new_answer").on('submit', function(e) {
    e.preventDefault();
    var source = $('#answer_template').html();
    var templating = Handlebars.compile(source);
    var context = {};

    console.log($(this));

    var q_id = $(this).data().qId;
    $.ajax({
      url: '/questions/'+ q_id +'/answers',
      type: 'POST',
      data: {answer: { title: $('#answer_title').val(), content: $('#answer_content').val()}}
    })
    .done(function(response) {
      context.answer = response;
      $('.answers ul').append(templating(context))
      $('#answer_title').val('')
      $('#answer_content').val('')
    })
    .fail(function(response) {
      $('.error').text('');
      $('.error').append(response.responseText)
    })
  });
})
