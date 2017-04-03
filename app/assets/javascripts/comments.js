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
});
