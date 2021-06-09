var express = require('express');
var router = express.Router();
var User = require('../models/user');
var CheckMeal = require('../models/checkMeal');
var DayMealInfo = require('../models/dayMealInfo');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;
