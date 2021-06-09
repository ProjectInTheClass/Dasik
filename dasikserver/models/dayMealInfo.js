var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var Food = require('./food');

var dayMealInfoSchema = new Schema({
    date : String,
    breakfast : [Food.schema],
    lunch : [Food.schema],
    dinner : [Food.schema]
});

module.exports = mongoose.model('dayMealInfo', dayMealInfoSchema);