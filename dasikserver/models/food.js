var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var foodSchema = new Schema({
    name: String,
    type: String,
    ingredient: String,
    kcal: Number,
    carbo: Number,
    protein: Number,
    fat: Number,
    price:Number,
    siteurl:String,
    foodimage:String
});

module.exports = mongoose.model('food',foodSchema);