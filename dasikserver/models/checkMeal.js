var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var checkMealSchema = new Schema({
    name : String,
    date : String,
    check : String
});

module.exports = mongoose.model('checkMeal',checkMealSchema);