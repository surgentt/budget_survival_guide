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

    function changeProgress(int){
     $("div.progress-bar").css("width", 100+"%")
    }

    start = 0
    setTimeout(function(){
      changeProgress(start)
    }, 1000)


    // Won't stop

    var transition = function() {
      $('div.beerPictures').append("<img alt='Beer' class='beer' height='32' src='/assets/beer.png' width='32'>");
    }

    setInterval(transition, 10);

    clearInterval(transition);




    // Not working!!

    // $( "div.beerPictures'" ).animate({ "width": numOfBeers }, "slow" );

    // var myVar = setInterval(function(){showBeer()},1000);

    // function showBeer() {
    //   $('div.beerPictures').append("<img alt='Beer' class='beer' height='32' src='/assets/beer.png' width='32'>");
    // }

    // function myStopFunction() {
    //   clearInterval(myVar);
    // }

  }
});