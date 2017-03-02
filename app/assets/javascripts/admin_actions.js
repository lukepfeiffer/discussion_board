$(document).ready(function() {
  $('#admin-overview').on('click', '.remove_admin', function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    var username = $(this).attr('id')

    if (confirm("Are you sure you want to revoke " + username + "'s admin privelages?")) {
      window.location.href = url;
    }
  })
  $('#admin-overview').on('click', '.make_admin', function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    var username = $(this).attr('id')

    if (confirm("Are you sure you want to add " + username + " as an admin?")) {
      window.location.href = url;
    }
  })
})
