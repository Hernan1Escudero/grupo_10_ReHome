const { readJSON } = require("../../data")
const db = require('../../database/models')

module.exports = (req,res) => {

    //const users = readJSON('users.json');
    //const user = users.find(user => user.id === req.session.userLogin.id);
    db.User.findByPk(req.session.userLogin.id)
    .then(user => {
        //const birthday = new Date(user.birthday).toISOString();
        console.log(user);
        res.send('Hola')
        /*return res.render('profile',{
            ...user.dataValues,
            birthday : birthday.split('T')[0]
        })*/
    })
    .catch(error => console.log(error))

   
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