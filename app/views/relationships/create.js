document.addEventListener("turbolinks:load", function () {
    $("#follow_form_"+"<%= user.id %>").html("<%= escape_javascript(render partial: 'users/follow_form', locals: { user: @user } ) %>")
});
