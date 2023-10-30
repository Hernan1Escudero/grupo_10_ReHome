const { unlinkSync, existsSync } = require("fs");
const { validationResult } = require("express-validator");
const { readJSON, writeJSON } = require("../../data");
//const User = require("../../data/User");
const db = require("../../database/models");
module.exports = (req, res) => {
  const errors = validationResult(req);
  const { name, surname, adress, city, province, country, email } = req.body;
  if (errors.isEmpty()) {
    db.Address.create({
      city: city,
      province: province,
      country: country,
      adress: adress,
    }).then((adress) => {
      db.Image_user.create({
        file: req.file.filename,
      })
      .then((image) => {
        //console.log("aaaaaa", image.id, adress.id);
        db.User.create({
          name: name,
          surname: surname,
          email: email,
          password: "hola",
          role_id: 1,
          address_id: adress.id,
          image_id: image.id,
        });
      })
      .then(()=>{
          res.render("register")
      }
      );
    });
  } else {
    if (req.file) {
      if (existsSync(`./public/img/users/${req.file.filename}`)) {
        unlinkSync(`./public/img/users/${req.file.filename}`);
      }
    }
    return res.render("register", {
      errors: errors.mapped(),
      old: req.body,
      imageError: "Debes volver a cargar la imagen",
    });
  }
};
