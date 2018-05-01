function save_list_add(movieID, obj) {
  $.ajax({
    url: "user/saveMovie.php",
    method: "GET",
    data: {id: movieID},
    dataType: "html"
  }).done(function(result) {
    console.log(result);
    if(result === "0")
      showMessage("You must be signed in to save movies.");
    else
      showMessage("Saved movie.");
  });

  $(obj).prop("onclick", null);
  $(obj).closest(".movie-interaction").removeClass("green").addClass("gray");
  $(obj).find('.interaction-text').html("Saved");
  $(obj).find('.movie-add-button').find('.fa').removeClass("fa-plus-circle").addClass("fa-check-circle");
}

function watch_list_add(movieID, obj) {
  $.ajax({
    url: "user/watchSaveMovie.php",
    method: "GET",
    data: {id: movieID},
    dataType: "html"
  }).done(function(result) {
    if(result === "0")
      showMessage("Error saving to watch list.");
    else
      showMessage("Saved to watch list.");
  });

  $(obj).prop("onclick", null);
  $(obj).closest(".movie-interaction").removeClass("orange").addClass("gray");
  $(obj).find('.interaction-text').html("Watch List");
  $(obj).find('.movie-add-button').find('.fa').removeClass("fa-plus-circle").addClass("fa-check-circle");
}

function watch_list_remove(movieID, obj) {
  $.ajax({
    url: "user/watchRemoveMovie.php",
    method: "GET",
    data: {id: movieID},
    dataType: "html"
  }).done(function(result) {
    if(result === "0")
      showMessage("Error removing from watch list.");
    else {
      showMessage("Removed from watch list.");
    }
  });

  $(obj.closest(".movie-item")).fadeOut(1000);
}

function save_list_remove(movieID, obj) {
  $.ajax({
    url: "user/removeMovie.php",
    method: "GET",
    data: {id: movieID},
    dataType: "html"
  }).done(function(result) {
    if(result === "0")
      showMessage("Error removing.");
    else {
      showMessage("Removed movie.");
    }
  });

  $(obj.closest(".movie-item")).fadeOut(1000);
}


function showMessage(message) {
  $("#message").html(message);

  $("#message").slideDown();

  setTimeout(function() {
    $("#message").slideUp();
  }, 1500);
}


$(document).ready(function(){
  $(".rating div").click(function() {
    $(".rating-input").val(this.innerHTML);
  });

  $(".message").click(function() {
    $(".message").slideUp();
  })
});
