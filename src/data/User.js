const { v4: uuidv4 } = require('uuid');
const {hashSync} = require('bcryptjs');

const User = function ({name, surname, adress, city, province,country, email, password, image}) {

    this.id = uuidv4();
    this.name = name.trim();
    this.surname = surname.trim();
    this.adress = adress.trim();
    this.city = city.trim();
    this.province = province.trim();
    this.country = country.trim();
    this.email = email.trim();
    this.password = hashSync(password,10);
    this.role = 'user';
    this.image = image;
    this.shoppingCart= [];
    this.createAt = new Date;
}

module.exports = User