const mongoose = require("mongoose");
const Joi = require("joi");

const userModel = new mongoose.Schema({
    name: {type:String, required : true},
    surname: {type:String, required : true},
    email: {type:String, unique:true, required : true},
    pwd: {type:String, required : true},
});

const userModelJoi = Joi.object({
    name : Joi.string()
        .required()
        .min(3)
        .max(15)
        .messages({
            'string.base': `Name should be a type of 'String.`,
            'string.empty': `Name can't be an empty field.`,
            'string.min': `Name should have a minimum length of 3.`,
            'string.max': `Name should have a max length of 15.`,
            'any.required': `Name is a required field.`
          }),
    surname: Joi.string()
        .required()
        .min(3)
        .max(15)
        .messages({
            'string.base': `Surname should be a type of 'String.`,
            'string.empty': `Surname can't be an empty field.`,
            'string.min': `Surname should have a minimum length of 3.`,
            'string.max': `Surname should have a max length of 15.`,
            'any.required': `Surname is a required field.`
          }),
    email: Joi.string()
        .required()
        .min(5)
        .max(30)
        .email()
        .messages({
            'string.base': `Email should be a type of 'String.`,
            'string.empty': `Email can't be an empty field.`,
            'string.min': `Email should have a minimum length of 5.`,
            'string.max': `Email should have a max length of 30.`,
            'string.email': `Invalid email.`,
            'any.required': `Email is a required field.`
          }),
    pwd: Joi.string()
        .required()
        .min(6)
        .max(15)
        .messages({
            'string.base': `Password should be a type of 'String.`,
            'string.empty': `Password can't be an empty field.`,
            'string.min': `Password should have a minimum length of 6.`,
            'string.max': `Password should have a max length of 15.`,
            'any.required': `Password is a required field.`,
          }),
        
    re_pwd: Joi.any().equal(Joi.ref('pwd'))
    .required()
    .label('Confirm password.')
    .options({ messages: { 'any.only': `Passwords don't match.`} }),
            
    token: Joi.optional(),
    id : Joi.optional()
        
})

function joiValidate (user){
    return userModelJoi.validate(user);
}

const User = mongoose.model("User",userModel);

module.exports = {User, joiValidate};