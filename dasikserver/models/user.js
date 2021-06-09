var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var CheckMeal = require('./checkMeal');
var DayMealInfo = require('./dayMealInfo');

var userSchema = new Schema({
    name: String,
    height: Number,
    weight: Number,
    allergy: [Number],
    checkMeal: {},
    monthDiet : [DayMealInfo.schema]
});

module.exports = mongoose.model('user',userSchema);