//const { readJSON } = require("../../data")
const { validationResult } = require('express-validator');
const db = require('../../database/models')

module.exports = (req,res) => {
    const errors = validationResult(req)

    if(errors.isEmpty()){
        const {name, surname} = req.body;
        db.User.update(
            {
                name : name.trim(),
                surname : surname.trim()
            },
            {
                where : {
                    id : req.session.userLogin.id
                }
            }
        )
            .then(response => {
                console.log(response);
                return res.redirect('/')
            })
    }else {

    //const users = readJSON('users.json');
    //const user = users.find(user => user.id === req.session.userLogin.id);
    db.User.findByPk(req.session.userLogin.id)
    .then(user => {
        //const birthday = new Date(user.birthday).toISOString();
        //console.log(user);
        return res.render('profile',{
            ...user.dataValues,
            //birthday : birthday.split('T')[0]
            errors : error.mapped()
        })
    })
    .catch(error => console.log(error))

   
}
}


/* db.User.findByPk(req.session.userLogin.id)
        .then(user => {
            const birthday = new Date(user.birthday).toISOString();
            console.log(birthday.split('T')[0]);
            return res.render('profile',{
                ...user.dataValues,
                birthday : birthday.split('T')[0]
            })
        })
        .catch(error => console.log(error))
    */