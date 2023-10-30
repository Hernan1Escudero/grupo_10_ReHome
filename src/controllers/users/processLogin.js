const { validationResult } = require("express-validator")
const db = require("../../database/models");

module.exports = async (req,res) => {

    const errors = validationResult(req);

    if(errors.isEmpty()){
        const user = await db.User.findOne({ where: { email: req.body.email } });
        //console.log("el user",user.role_id)
        const role = await db.Role.findByPk(user.role_id);
        req.session.userLogin = {
            id : user.id,
            role : role.name
        }
        req.body.remember !== undefined && res.cookie('grupoReHome10',req.session.userLogin,{
            maxAge : 1000 * 60 * 60
        })
        //console.log(req.session.userLogin)
        return res.redirect('/')
    }else {
        return res.render('login',{
            errors : errors.mapped(),
            old : req.body
        });
    }
}