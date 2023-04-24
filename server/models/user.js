//Package Imports
const mongoose = require("mongoose");
const { productSchema } = require("./product");


//User model Schema
const userSchema = mongoose.Schema({
    name:{
        required: true,
        type:String,
        trim:true,
    },
    email:{
        required: true,
        type:String,
        trim:true,
        validate:{
            //VALIDATION:Checking for valid email address
            validator: (value) => {
                const re =
  /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please enter a valid email address",
        }
    },
    password:{
        required: true,
        type:String,
        validate:{
            //VALIDATION:Checking for strong password
            validator: (value) => {
                const rp = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                return value.length>6;
            },
            message: "Please enter a strong password",
        }
    },
    address:{
        default: "",
        type:String,
    },
    type:{
        type:String,
        default:'user',
    },
    verified:{
        type: Number,
        default: 0,
        
    },
    phone:{
        type:Number,
        default: 0,
    },
    //cart
    cart: [
        {
          product: productSchema,
          quantity: {
            type: Number,
            required: true,
          },
        },
      ],
});


//Create a user model
const User = mongoose.model('User', userSchema);

//Export the model
module.exports = User;