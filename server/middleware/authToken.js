const jwt = require("jsonwebtoken");

function verifyToken(req,res,next){
    const token = req.header('x-auth-token');
    try {
        if (!token) return res.status(401).json({err:"Access denied. There is no token."})
        
        const verify = jwt.verify(token,"tokenKey");

        if(!verify) return res.status(400).json({err:"Invalid token."})
        
        
        next();
    } catch (error) {
        return res.status(401).json({err:"Access denied."})
    }
}

module.exports = verifyToken;