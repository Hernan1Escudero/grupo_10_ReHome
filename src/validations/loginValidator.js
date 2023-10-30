const { check, body } = require("express-validator");
const db = require("../database/models");
const { compareSync } = require("bcryptjs");
module.exports = [
  check("email")
    .notEmpty()
    .withMessage("El email es obligatorio")
    .isEmail()
    .withMessage("Formato inválido"),
  body("password")
    .custom(async(value, {req}) => {
      console.log("AQUI ESTOY")
        const user = await db.User.findOne({ where: { email: req.body.email } });
        
        if(!user || !compareSync(value,user.password)){
           console.log("Aver")
          //console.log(user,req.body.email,"ASDASDASDAD")
            return false
        }
            return true
    }).withMessage('Contraseña Incorrecta')

];
