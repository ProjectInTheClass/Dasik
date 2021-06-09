var express = require('express');
var router = express.Router();
var User = require('../models/user');
var CheckMeal = require('../models/checkMeal');
var DayMealInfo = require('../models/dayMealInfo');
const Food = require('../models/food');

/* GET users listing. */
router.get('/', async function(req,res,next){
  
  const users = await User.find({},{"_id":false, "__v":false, checkmeal:{"_id":false}, monthDiet:{"_id":false}});
  
  res.send({users:users});
});

router.get('/inputdummy', async function(req,res,next){
  var user = new User();
  
  user.name = "User";
  user.height = 180;
  user.weight = 84;
  user.allergy = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  user.checkMeal = new Array(new CheckMeal());
  user.monthDiet = new Array(new DayMealInfo());
  user.save();

  res.send({user:user})
})

router.post('/findUser', async function(req, res, next) {
  // req -> userName 이 들어오면
  // 해당하는 유저의 내용을 다 보내주어야 함.

  var username = req.body.userName;
  var user = User.find({name:username},{"_id":false, "__v":false, checkMeal:{"_id":false}, monthDiet:{"_id":false}});

  res.send({user:user});
});

router.post('/saveUserInfo', async function(req,res,next){
  var body = req.body;
  console.log(body);

  var user = await User.findOne({name:body.name},{"_id":false, "__v":false, checkmeal:{"_id":false}, monthDiet:{"_id":false}});

  console.log(user.length)
  if (user.length == 0){
    var user = new User();
  
    user.name = body.name;
    user.height = body.height;
    user.weight = body.weight;
    user.allergy = body.allergy;
    user.checkMeal = body.checkMeal;
    user.monthDiet = body.monthDiet;
    user.save();
  }
  else{
    await User.update({name:body.name},{height:body.height, weight: body.weight, allergy: body.allergy, checkMeal: checkMeal, monthDiet:body.monthDiet})
  }
  res.send({success:"success"});
});

module.exports = router;
