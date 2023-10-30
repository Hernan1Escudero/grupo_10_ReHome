const data = require("../../data")
const { readJSON } = require("../../data")
const db = require('../../database/models')

module.exports = async(req,res) => {

    const user = await db.User.findByPk(req.session.userLogin.id)
    const adress = await db.Address.findByPk(user.address_id)
    const image = await db.Image_user.findByPk(user.image_id)

    const userObject = {
        id: user.id,
        name : user.name,
        surname: user.surname,
        adress: adress.address,
        city: adress.city,
        province : adress.province,
        country: adress.country,
        image: image.file
    }
       
    console.log(userObject);
        //res.send('Hola')
        return res.render('profile',{
          ...userObject,
        })

}