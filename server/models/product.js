//External Imports
const mongoose = require("mongoose");

//Internal Imports


const productSchema = mongoose.Schema({
    //Name of the dish
    name:{
        required:true,
        type: String,
        trim:true,
    },
    //Description of dish
    description:{
        required:true,
        type: String,
        trim:true,
    },
    //Images related to the dish
    images:[{
        required:true,
        type: String,
    },],
    //Is available or not
    availability:{
        required: true,
        type: Boolean,
    },
    //Price of the dish
    price:{
        required:true,
        type: Number,
        
    },
    //Category of the dish
    category:{
        required:true,
        type: String,
    },
    //ratings related to the dish
});


//Making a model of the Product above and exporting it
const Product = mongoose.model('Product', productSchema);
module.exports={Product, productSchema};