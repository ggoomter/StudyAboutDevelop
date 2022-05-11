<script type="text/javascript">

 var imagePaths = ["static/img/Gwangjang_seoul.jpg", "static/img/Bukchon_seoul.jpg", "static/img/Lifeistrip_daejeon.jpg", "static/img/Cafe_breezin_seoul.jpg"];
 var showCanvas = null;
 var showCanvasCtx = null;
 var img = document.createElement("img");
 var currentImage = 0;
 var revealTimer;

 window.onload = function () {
    showCanvas = document.getElementById('GoSlideShow');
    showCanvasCtx = showCanvas.getContext('2d');
    img.setAttribute('width','600');
    img.setAttribute('height','400');
    switchImage();
    setInterval(switchImage,3000);
    }

 function switchImage() {
    img.setAttribute('src',imagePaths[currentImage++]);

    if (currentImage >= imagePaths.length) {
        currentImage = 0;
        }
    showCanvasCtx.globalAlpha = 0.1;
    revealTimer = setInterval(revealImage,100);
 }

  function revealImage() {
    showCanvasCtx.save();
    showCanvasCtx.drawImage(img,0,0,600,400);
    showCanvasCtx.globalAlpha += 0.1;

    if (showCanvasCtx.globalAlpha >= 1.0) {
        clearInterval(revealTimer);
        }
    showCanvasCtx.restore();
 }
</script>