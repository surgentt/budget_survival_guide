jQuery(document).ready(function($) {
  $(".clickableRow").click(function() {
        window.document.location = $(this).attr("href");
  });

  if($('span#numOfBeers')[0]) {
    var result = $('#result').text();
    result = result.split(",").join("");
    result = parseInt(result);
    var numOfBeers = Math.round(result / 3);
    $('span#numOfBeers').append(numOfBeers);


    for(var i=0; i<numOfBeers; i++) {
      $('div.beerPictures').animate("<img alt='Beer' class='beer' height='32' src='/assets/beer.png' width='32'>");
    }

    // var myVar = setInterval(function(){showBeer()},1);

    // function showBeer(){
      
    // }

    // function myStopFunction() {
    //   clearInterval(myVar);
    // }

  }
});