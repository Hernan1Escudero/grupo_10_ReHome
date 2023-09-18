const { validationResult } = require("express-validator");
const { readJSON, writeJSON } = require("../../data");
const User = require("../../data/User");

module.exports = (req, res) => {
    const usuarios = readJSON("users.json")
    const modify_request = req.body
    delete modify_request.password2;
    const newUser = new User(modify_request);
    console.log(newUser)
    usuarios.push(newUser);
    writeJSON(usuarios, 'users.json')
    res.redirect('register')
}