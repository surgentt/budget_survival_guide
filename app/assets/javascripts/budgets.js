jQuery(document).ready(function($) {
  $(".clickableRow").click(function() {
        window.document.location = $(this).attr("href");
  });

  if($('span#numOfBeers')[0]) {
    var result = $('#result').text();
    result = result.split(",").join("");
    result = parseInt(result);

    if(result < 0){
      $('div#budget_result').empty();
      $('div#budget_result').append("<h2>You're broke... maybe you should adjust your budget</h2>");
      $('div#budget_result').append("<img alt='Poor' class='poor' src='/assets/poor.png'>");
    }

    var numOfBeers = Math.round(result / 3);

    var counter = 0;
    var percent_complete = 0;

    var transition = function() {
      counter ++;
      $('div.beerPictures').append("<img alt='Beer' class='beer' height='32' src='/assets/beer.png' width='32'>");
      $('span#numOfBeers').empty(counter);
      $('span#numOfBeers').append(counter);
      percent_complete = (counter / numOfBeers) * 100
      $("div.progress-bar").css("width", percent_complete+"%")
    }

    var loadBeer = setInterval(function(){
      if (counter < numOfBeers){
        transition()
      } else{
        clearInterval(loadBeer)
      }
    }, 15);

  }
});