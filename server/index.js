const express = require("express");
const mongoose =require("mongoose");

const authRoute = require("./routes/authRoute");

const PORT = 3000;
const app = express();


const DB = "<your mongodb connection string>";
mongoose.set('strictQuery', false);

app.use(express.json());
app.use(authRoute);


mongoose.connect(DB).then(()=>{
    console.log("Connection successful");
}).catch(e => {
    console.log(e);
})

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected at port ${PORT}`);
});