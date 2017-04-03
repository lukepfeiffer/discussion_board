$(document).ready(function() {
  // Like comment function
  $('.like-buttons').on('click', '.fa-thumbs-o-up', function(){
    var comment = $(this);
    var voteCount =  comment.data('vote-count');
    var id = comment.data('id');
    var voteCounter = $('.vote-count' + id);
    $.ajax({
      type: 'GET',
      url: comment.data('url'),
      success: function(){
        if(voteCount >= 0) {
          voteCounter.text('+' + (voteCount + 1));
        }
      }
    });
  });

  // Dislike comment function
  $('.like-buttons').on('click', '.fa-thumbs-o-down', function(){
    var comment = $(this);
    var voteCount =  comment.data('vote-count');
    var id = comment.data('id');
    var voteCounter = $('.vote-count' + id);
    $.ajax({
      type: 'GET',
      url: comment.data('url'),
      success: function(){
        if(voteCount > 0) {
          voteCounter.text('+' + (voteCount - 1));
        }
      }
    });
  });

  // Show form to post a reply
  $('.comment').on('click', '.reply-button', function(){
    var replyId = $(this).data('id');
    var form = $('.hidden' + replyId);
    form.show();
  });

  // Show all replies for a comment
  $('.comment').on('click', '.replies', function(){
    var commentReply = $(this);
    var commentId = commentReply.data('id');
    var hideReplies = $('.hide-replies' + commentReply.data('id'));
    $.ajax({
      type: 'GET',
      url: commentReply.data('url'),
      success: function(response){
        $('.like-buttons' + commentId).after(response);
        hideReplies.show();
        commentReply.hide();
      }
    });
  });

  // Hide replies for a comment
  $('.comment').on('click', '.hide-replies', function(){
    var commentId = $(this).data('id');
    var replyContainer = $('.reply-container' + commentId);
    var hideReply = $(this);
    var viewReply = $('replies' + commentId);
    replyContainer.remove();
    viewReply.show();
    hideReply.show();

  });

});
