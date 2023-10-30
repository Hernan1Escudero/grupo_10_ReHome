const db = require("../../database/models");

module.exports = async (req, res) => {
  //const categories = readJSON('categories.json');
  const getProduct = await db.Product.findByPk(req.params.id);
  const categories = await db.Category.findAll();
  const getProductImage = await db.Images_product.findOne({
    where: { product_id: getProduct.id },
  });

  //console.log("Producto", getProduct);
  //console.log("Imagen", getProductImage);

  const product = {
    id: getProduct.id,
    name: getProduct.name,
    price: getProduct.price,
    discount: getProduct.discount,
    description: getProduct.description,
    image: getProductImage.file,
    category: getProduct.category_id - 1,
  };
  //console.log(getProduct.category_id,categories[getProduct.category_id-1].name)
  //console.log(getProductImage);
  //res.send("hola")
  return res.render("productEdit", {
    categories,
    ...product,
  });
};
