const { readJSON, writeJSON } = require("../../data")
const Product = require("../../data/product")

module.exports=(req,res)=>{
    
    const productosDatabse = readJSON("products.json")
    
    const productoNuevo = new Product(req.body)
    productosDatabse.push(productoNuevo)
    console.log(req.body)
    writeJSON(productosDatabse,"products.json")
    return res.send(req.file)
}