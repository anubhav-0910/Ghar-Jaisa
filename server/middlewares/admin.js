const jwt = require('jsonwebtoken');
const User = require('../models/user');

//
//__________________________________ADMIN VALIDATION________________________________
//
const admin = async(req, res, next ) =>{
    try {
        const token = req.header("x-auth-token");
        //Incorrect token
        if (!token)
          return res.status(401).json({ msg: "No auth token, access denied" });
    
        const verified = jwt.verify(token, "passwordKey");
        //Wrong credentials
        if (!verified)
          return res
            .status(401)
            .json({ msg: "Token verification failed, authorization denied." });

        const user = await User.findById(verified.id);
        //Wrong user types
        if(user.type == 'user' || user.type == 'seller'){
            return res.status(401).json({msg: 'You are not admin!'});
        }
        req.user = verified.id;
        req.token = token;
        next();
      } catch (err) {
        res.status(500).json({ error: err.message });
      }
};

//Exporting admin middleware
module.exports=admin;