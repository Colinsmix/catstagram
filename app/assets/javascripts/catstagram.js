$(document).ready(function() {
  $('[data-post-id]').on('submit', '[data-meow-button="create"]', function(event) {
    event.preventDefault();

    $form = $(event.currentTarget);

    $.ajax({
      type: "POST",
      url: $form.attr('action'),
      dataType: "json",
      success: function(meow) {
        // Create the String version of the form action
        action = '/posts/' + meow.post_id + '/meows/'+ meow.id;

        // Create the new form
        $newForm = $('<form>').attr({
          action: action,
          method: 'delete',
          'data-meow-button': 'delete'
        });

        // Create the new submit input
        $meowButton = $('<input>').attr({type: 'submit', value: 'Remove Meow'});

        // Append the new submit input to the new form
        $newForm.append($meowButton);

        // Replace the old create form with the new remove form
        $form.replaceWith($newForm);
      }
    });
  });

  $('[data-post-id]').on('submit', '[data-meow-button="delete"]', function(event) {
    event.preventDefault();

    $form = $(event.currentTarget);

    $.ajax({
      type: "DELETE",
      url: $form.attr('action'),
      dataType: "json",
      success: function() {
        // Find the parent wrapper div so that we can use its data-post-id
        $post = $form.closest('[data-post-id]');

        // Create the String version of the form action
        action = '/posts/' + $post.data('post-id') + '/meows';

        // Create the new form for creating a Meow
        $newForm = $('<form>').attr({
          action: action,
          method: 'post',
          'data-meow-button': 'create'
        });

        // Create the new submit input
        $meowButton = $('<input>').attr({type: 'submit', value: 'Meow'});

        // Append the new submit input to the new form
        $newForm.append($meowButton);

        // Replace the old create form with the new remove form
        $form.replaceWith($newForm);
      }
    });
  });
});
