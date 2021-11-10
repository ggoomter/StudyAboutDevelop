{
   function calcTriangle(width, height) {
      return 0.5 * width * height;
   }
   function calcSquare(width, height) {
      return width * height;
   }
   function calcCircle(radius) {
      return Math.pow(radius, 2) * Math.PI;
   }
   function calcHexagon(leng) {
      return 3 * Math.sqrt(3) * Math.pow(leng, 2) / 2;
   }

   const funcObj = [
      ["삼각형", calcTriangle],
      ["사각형", calcSquare],
      ["원형", calcCircle],
      ["육각형", calcHexagon],
   ]
   const funcMap = new Map(funcObj);

   function calcFigure(type, width, height) {
      return funcMap.get(type)(width, height);  //funcMap.get(type) 에 (width,height) 한것
   }

   const arr = [
      ["삼각형", 3, 5],
      ["사각형", 4, 10],
      ["원형", 10],
      ["육각형", 12],
   ];
   const results = arr.map(e => calcFigure(...e));
   console.log(results);
}
