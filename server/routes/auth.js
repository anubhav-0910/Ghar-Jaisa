//Package Imports
const client = require('twilio')('ACc08307b2eb2faca5f785db61e6c154be', '4dbd3574b5ecbfdcb4563aaad32427b1');
const express = require("express");
const bcryptjs = require("bcryptjs");
const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");
const otpGenerator = require("otp-generator");
const crypto = require("crypto");
const key = "otp-secret-key";


//Other Files Imports
const User = require("../models/user");
const auth = require("../middlewares/auth");
const { error } = require('console');


//initializing and adding router functionality
const authRouter = express.Router();

//__________________________________FINDING USER_________________________________

authRouter.get("/api/findUser/:email",  async (req, res) => {
    const emails=req.params.email;
    console.log(`${emails}`);
    const existingUser = await User.find({
        email:{$regex: req.params.email}
    });
    //console.log(existingUser.email);
    try{
        if(existingUser[0] != null)
        {
        if(existingUser[0].email == null || existingUser[0].email == undefined){
            res.send(201, {"result": false});
        }
         else
        {
            res.send(200, {"result": true});

    }
    } else{
            res.send(201, {"result": false});
    }
    } catch (e) {
        console.log(e);
        res.status(500).json({error:e.message});
    }
  });


//__________________________________SIGN-UP USER_________________________________
authRouter.post('/api/signup', async (req, res)=>{
    try {

        //****************get data from user in req.body*****************
    const {name, email, password,}=req.body;

    //VALIDATION:Checking for existing user
    const existingUser = await User.findOne({email});
    if(existingUser){
        return res.status(400).json({msg: "User with the same email address already exists"});
    }

    //Hashing the password

    const hashedPassword = await bcryptjs.hash(password, 8);

    //Creating a new user
    let user = new User({
        email,
        password: hashedPassword,
        name
    });

    //****************post data in the database**********************
    user= await user.save();
    //********************return the data to user********************
    res.json(user);

    } catch (e) {
        res.status(500).json({error:e.message});
    }





});

//__________________________________SIGNIN USER_________________________________

authRouter.post('/api/signin', async (req, res)=>{
    try {
    //****************get data from user in req.body*****************
    const {email, password}=req.body;

    //VALIDATION:Checking if the user exists
    const user = await User.findOne({email});
    if (!user) {
        return res
          .status(400)
          .json({ msg: "User with this email does not exist!" });
      }

      //VALIDATION: Checking for the password matching
      const isMatch = await bcryptjs.compare(password, user.password);
      if (!isMatch) {
        return res.status(400).json({ msg: "Incorrect password." });
      }

      //***************Storing the user token*****************
      const token = jwt.sign({id: user._id,}, "passwordKey");
      res.json({token, ...user._doc});


    } catch (e) {
        res.status(500).json({error:e.message});
    }
});

//__________________________________TOKEN VALIDATION____________________________________

authRouter.post("/tokenIsValid", async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        //VALIDATION: token is ull
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");

      //VALIDATION: token is incorrect
      if (!verified) return res.json(false);

      const user = await User.findById(verified.id);

      //VALIDATION: if user is valid or not
      if (!user) return res.json(false);

      //Success case
      res.json(true);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


//__________________________________GETTING USER DATA____________________________________

authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });


  //__________________________________OTP VERIFICATION_________________________________

  //OTP GENERATION
  authRouter.post("/api/otpLogin", async (req, res)=>{
    try {
        const {phone}=req.body;

        const otp = await otpGenerator.generate(4, {
            lowerCaseAlphabets: false,
            specialChars: false,
            upperCaseAlphabets: false,

        });
        const ttl = 5*60*1000;
        const expires = Date.now()+ttl;
        const data = `${phone}.${otp}.${expires}`;
        const hash= crypto.createHmac("sha256", key).update(data).digest("hex");
        const fullHash = `${hash}.${expires}`;


        //****************SEND MSG TO USER****************************


        client.messages
  .create({
    body: `Your otp is ${otp} for the FOOD DeliVery`,
    // to: `+918528469069`,
    to: `+919408698359`,
    from: `+16592993902`,
  })
  .then((message) => console.log(message))
  .catch((error) => {
    // You can implement your fallback code here
    console.log(error);
  });



        //***************************************************** */
        res.json(fullHash);

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
  });

  //OTP AUTHENTICATION
  authRouter.post("/api/otpVerify", async (req, res)=>{
    try {
        //variables
        const token = req.header("x-auth-token");
        const verified = jwt.verify(token, "passwordKey");
        const user = await User.findById(verified.id);
        //otp
        const {phone,otp, hash}=req.body;
        [hashValue, expire]= hash.split( '.');
        let now = Date.now();
        if(now > parseInt(expire)) {
            return res.status(400).json({msg: "OTP EXPIRED"});
        }
        let data = `${phone}.${otp}.${expire}`;

       let newCalculateHash = crypto
    .createHmac("sha256", key)
    .update(data)
    .digest("hex");

    if(newCalculateHash === hashValue){
        //update user verification status
        user.verified = 1;
        user.phone = phone;

        await user.save();
        res.json("OTP VERIFIED");
    } else {
        return res.status(400).json({msg:"INVALID OTP"});
    }

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
  });


//__________________________________CHANGE USER PASSWORD_________________________________

authRouter.post("/api/reset-password" , auth ,async(req, res) => {
    try {
        const {password, newPassword}=req.body;

        var token = req.header("x-auth-token");
        const verified = jwt.verify(token, "passwordKey");
        const user = await User.findById(verified.id);
;
    //VALIDATION: Checking for the password matching
      const isMatch = await bcryptjs.compare(password, user.password);
      if (isMatch==false) {
        return res.status(400).json({ msg: "Incorrect password." });
      }
        const hashedPassword = await bcryptjs.hash(newPassword, 8);
        user.password=hashedPassword;

       //****************post data in the database**********************
        await user.save();
        token = jwt.sign({id: user._id,}, "passwordKey");
      res.json({token, ...user._doc});




    } catch (e) {
        res.status(500).json({error: e.message});
    }
});


//export the authRouter functionality
module.exports = authRouter;
