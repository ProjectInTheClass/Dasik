var express = require('express');
var router = express.Router();
var Food = require('../models/food');

/* GET home page. */
router.get('/', async function(req, res, next) {
  
  const foods = await Food.find({},{"_id":false, "foodimage":false});

  res.send({foods:foods})

});

/* GET home page. */
router.get('/a', async function(req, res, next) {
  
  const foods = await Food.find({},{"_id":false});

  res.send({foods:foods})

});
router.get('/inputdummy', function(req,res,next){

  var foodDummy = new Food();
  foodDummy.name = "name"
  foodDummy.type = "type"
  foodDummy.ingredient = "ingre"
  foodDummy.kcal = 2.2
  foodDummy.carbo = 3.3
  foodDummy.protein = 4.4
  foodDummy.fat = 5.5
  foodDummy.price = 1900
  foodDummy.siteurl = "siteurl"
  foodDummy.foodimage = "testimage"
  foodDummy.save()


  console.log("---------header")
  console.log(req.header)
  console.log("---------body")
  console.log(req.body)
  console.log("---------entire")
  console.log(req)
  res.json({Success:"success"})

});

router.post('/getMenu', async function(req,res,next){
  //console.log(req.body)
  //난류 우유 메밀 밀 대두 땅콩 호두 콩 고등어 새우 게 조개류 오징어 돼지고기 닭고기 소고기 아황산류 복숭아 토마토

  // 제외할 음식의 조건 세우기
  var exceptIngredients = []
  if (req.body.egg == 1){ exceptIngredients.push("난류") }
  if (req.body.milk == 1){ exceptIngredients.push("우유") }
  if (req.body.maemil == 1){ exceptIngredients.push("메밀") }
  if (req.body.mil == 1){ exceptIngredients.push("밀") }
  if (req.body.daedu == 1){ exceptIngredients.push("대두") }
  if (req.body.peanut == 1){ exceptIngredients.push("땅콩") }
  if (req.body.hodu == 1){ exceptIngredients.push("호두") }
  if (req.body.bean == 1){ exceptIngredients.push("콩") }
  if (req.body.fish == 1){ exceptIngredients.push("고등어") }
  if (req.body.shrimp == 1){ exceptIngredients.push("새우") }
  if (req.body.crab == 1){ exceptIngredients.push("게") }
  if (req.body.jogae == 1){ exceptIngredients.push("조개류") }
  if (req.body.squid == 1){ exceptIngredients.push("오징어") }
  if (req.body.fork == 1){ exceptIngredients.push("돼지고기") }
  if (req.body.chicken == 1){ exceptIngredients.push("닭고기") }
  if (req.body.beef == 1){ exceptIngredients.push("쇠고기") }
  if (req.body.ahawng == 1){ exceptIngredients.push("아황산류") }
  if (req.body.peach == 1){ exceptIngredients.push("복숭아") }
  if (req.body.tomato == 1){ exceptIngredients.push("토마토") }

  console.log(exceptIngredients)
  

  // 1. 모든 종류에서 선택한 종류가 제외된 음식들을 가져오기
  var riceList = []
  var noodleList = []
  var saladList = []
  var chickenList = []
  var hmrList = []
  var cookieList = []
  var firstGroup = []
  var secondGroup = []

  const foods = await Food.find({},{"_id":false});

  foods.forEach(function(food){
    var foodflag = 0
    var ingredients = food.ingredient.split(',')
    ingredients.some(function(ingre){
      ingre = ingre.trim()
      
      exceptIngredients.some(function(checkingre){
        if(checkingre == ingre){
          foodflag = 1
          return true
        }
      })
      if(foodflag == 1){
        return true
      }
    })
    if(foodflag == 0){
      if(food.type == "밥") { riceList.push(food); firstGroup.push(food) }
      if(food.type == "면") { noodleList.push(food); firstGroup.push(food) }
      if(food.type == "샐러드") { saladList.push(food); secondGroup.push(food) }
      if(food.type == "닭가슴살") { chickenList.push(food); secondGroup.push(food) }
      if(food.type == "간편식") { hmrList.push(food); firstGroup.push(food) }
      if(food.type == "쿠키") { cookieList.push(food); secondGroup.push(food) }
    }
  })

  //console.log('rice : ' + String(riceList.length))
  

  //월마다 데이터를 만들어 주어야 함. 
  let today = new Date()

  let month = today.getMonth() + 1
  let finalnum  = 0
  if (month == 1 && month == 3 && month == 5 && month == 7 && month == 8 && month == 10 && month == 12 ){ finalnum = 31 }
  else if (month == 2) {finalnum = 28}
  else {finalnum = 30}
  

  var i = 0
  var outputData = new Array();
  for(i = 1; i<=finalnum ; i++){
    var today_date = String(today.getMonth()+1) + "-" + String(i)

    //아침
    var mn = 0, mx = firstGroup.length
    var rand = Math.random() * (mx - mn) + mn
    var firstbre = new Object();
    firstbre.date = today_date;
    firstbre.time = "breakfast";
    console.log(parseInt(rand))
    firstbre.food = firstGroup[parseInt(rand)];
    
    mx = secondGroup.length
    rand = Math.random() * (mx - mn) + mn
    var secondbre = new Object();
    secondbre.date = today_date;
    secondbre.time = "breakfast";
    secondbre.food = secondGroup[parseInt(rand)];
    //점심
    var mn = 0, mx = firstGroup.length
    var rand = Math.random() * (mx - mn) + mn
    var firstlun = new Object();
    firstlun.date = today_date;
    firstlun.time = "lunch";
    firstlun.food = firstGroup[parseInt(rand)];
    
    mx = secondGroup.length
    rand = Math.random() * (mx - mn) + mn
    var secondlun = new Object();
    secondlun.date = today_date;
    secondlun.time = "lunch";
    secondlun.food = secondGroup[parseInt(rand)];
    
    //저녁
    var mn = 0, mx = firstGroup.length
    var rand = Math.random() * (mx - mn) + mn
    var firstdin = new Object();
    firstdin.date = today_date;
    firstdin.time = "dinner";
    firstdin.food = firstGroup[parseInt(rand)];
    
    mx = secondGroup.length
    rand = Math.random() * (mx - mn) + mn
    var seconddin = new Object();
    seconddin.date = today_date;
    seconddin.time = "dinner";
    seconddin.food = secondGroup[parseInt(rand)];

    console.log("firstgre : ",firstbre)
    outputData.push(firstbre)
    outputData.push(secondbre)
    outputData.push(firstlun)
    outputData.push(secondlun)
    outputData.push(firstdin)
    outputData.push(seconddin)
  }

  // var jsonData = JSON.stringify(outputData);
  
  console.log({diets:outputData})
  res.send({diets:outputData})
})

module.exports = router;
