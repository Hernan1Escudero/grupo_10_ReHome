//const { readJSON, writeJSON } = require("../../data");
//const categories = readJSON('../data/categories.json');
const data = require("../../data")
const read = data.readJSON

module.exports = (req,res) => {

    const productos = readJSON('products.JSON');
     console.log(req.body)
     
    const productsModify = productos.filter(product = producto.id !== req.params.id)

    writeJSON(productsModify, 'products.JSON');

    return res.render("productErase") 

}


