function game() {
  var trex = $(".rennende-dino");
  var spino = $(".stoute-spino");
  var flyingDino = $(".vliegende-dino");
  var stegoDino = $(".stegosaurus-dino");
  var dinoArray = [trex, spino, flyingDino, stegoDino]
  runLoop(dinoArray);
}

function startGame() {
  $('.start-button').on('click', function() {
    game()
  });
}

function flyDino() {
  $('.flying-dino').animate({
    left: "100%",
    top: '10px'
  }, 3500);
}

function runLoop(dinoArray) {
  var roar = preloadRoar();
  var yay = preloadYay();
  var counter = 0
  for (var i = 0; i < 20; i++) {
    (function(ind) {
      setTimeout(function(ind){
        var randomDino = dinoArray[Math.floor(Math.random() * dinoArray.length)]
        var dino = createDino(randomDino, counter);

        dino.click(function() {
          yay.play();
          counter += 1;
          $('.counter').html("Je hebt zoveel dinos gered: " + counter);
          $(this).stop();
          $(this).animate({
            top: "10px"
          }, 1000);
          $(this).animate({
            left: "100%"
          }, 1000);
        });

        runAnimation(dino, roar);
      }, 3000 * ind);
    })(i);
  };
}

function createDino(dinoElement, counter) {
  var anotherDino = dinoElement.clone();
  anotherDino.appendTo('.game-background');
  return anotherDino;
}

function runAnimation(dino, roar) {
  dino.animate({
    left: "59%"
  }, 5000, function(){
    roar.play();
    dino.addClass('spinning');
    dino.fadeOut(3000);
  });
}

function preloadRoar(){
  var audio = new Audio('audios/dino-roar.mp3');
  audio.preload = "auto";
  $(audio).on("loadeddata");  // jQuery checking
  return audio;
}

function preloadYay(){
  var audio = new Audio('audios/yay.mp3');
  audio.preload = "auto";
  $(audio).on("loadeddata");  // jQuery checking
  return audio;
}

function runPreAnimation() {
  walkSpinoRight();
  flyDinoDownRight();
}

function walkSpinoRight() {
  $('.bad-spino.pre').animate({
    left: '1200px'
  }, 4000, function() {
    $(this).toggleClass('turn-around');
    walkSpinoLeft();
  });
}

function walkSpinoLeft() {
  $('.bad-spino.pre').animate({
    left: '20px'
  }, 2000, function() {
    $(this).toggleClass('turn-around');
    walkSpinoRight();
  });
}

function flyDinoDownRight() {
  $('.flying-dino.pre').animate({
    left: '600px',
    top: '500px'
  }, 1000, function() {
    flyDinoStraight();
  });
}

function flyDinoStraight() {
  $('.flying-dino.pre').animate({
    left: '900px'
  }, 2000, function() {
    flyDinoUpRight();
  });
}

function flyDinoUpRight() {
  $('.flying-dino.pre').animate({
    left: '1300px',
    top: '-100px'
  }, 3000, function() {
    flyDinoBack();
  });
}

function flyDinoBack() {
  $('.flying-dino.pre').animate({
    left: '-30px',
    top: '-20px'
  }, 4000, function() {
    flyDinoDownRight();
  });
}



$(document).ready(function() {
  runPreAnimation();
  startGame();
});
