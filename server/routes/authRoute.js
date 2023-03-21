const express = require("express");
const jwt = require("jsonwebtoken");

const authRoute = express.Router();
const {User, joiValidate} = require("../model/userModel");
const verifyToken = require("../middleware/authToken");


authRoute.get("/auth/verify", verifyToken, async(req,res)=>{
    const user_id =req.header('user-id');
    const user = await User.findById(user_id);
    if (!user_id) return res.status(400).json({error:"There is no such a user"})
    res.status(200).json({...user._doc});
});

authRoute.post("/auth/login",async (req,res)=>{
    const {email,pwd} = req.body;
    try {
        let user = await User.findOne({email:email,pwd:pwd});

        if(user){ 
            
            var token = jwt.sign({_id: this._id},"tokenKey");
            return res.status(200).json({token:token,user_id:user._id})
        }

        res.status(400).json({error:"Email or password is incorrect."});
    } catch (error) {
        console.log(error);
    }

    
});


authRoute.post("/auth/register", async (req,res) =>{
    try {
        const err = joiValidate(req.body);
        
    if (err.error) return res.status(400).json({error: err.error.details[0].message});

    let mail = req.body.email;

    let user = await User.findOne({email:mail});
    
    if(user) return res.status(400).json({error:"This email already use."})

    const {name,surname,email,pwd,re_pwd} = req.body;
    user = new User({
        name: name,
        surname: surname,
        email: email,
        pwd: pwd,
        re_pwd: re_pwd
    });
    
    await user.save();

    res.status(200).json({msg:"Successful registration."});
    } catch (error) {
        console.log(error);
    }
    


});

module.exports = authRoute;