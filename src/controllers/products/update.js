const { unlinkSync, existsSync } = require("fs");
const { validationResult } = require("express-validator");
const { readJSON, writeJSON } = require("../../data");
const db = require("../../database/models");

module.exports = async (req, res) => {
  const errors = validationResult(req);

  const { name, price, category, discount, description } = req.body;
  console.log("BODYYY", req.body);
  if (errors.isEmpty()) {

    const product = await db.Product.findByPk(req.params.id);
    const newCategory = await db.Category.findOne({
      where:{
        name: category
      }
    });
    console.log(newCategory)

     db.Product.update(
      {
        description: description.trim(),
        name,
        price,
        category_id: newCategory.id,
        discount,
        description,
      },
      {
        where: {
          id: req.params.id,
        },
      }
    ); 
    /* 
    req.files.image &&
      existsSync(`./public/products/${product.image}`) &&
      unlinkSync(`./public/products/${product.image}`);

    req.files.images &&
      product.images.forEach((image) => {
        existsSync(`./public/images/${image}`) &&
          unlinkSync(`./public/images/${image}`);
      }); */
    return res.redirect("/admin");
  } else {
    const categories = await db.Category.finAll();

    req.files.image &&
      existsSync(`./public/img/products/${req.files.image[0].filename}`) &&
      unlinkSync(`./public/img/products/${req.files.image[0].filename}`);

    if (req.files.images) {
      req.files.images.forEach((file) => {
        existsSync(`./public/img/products/${file.filename}`) &&
          unlinkSync(`./public/img/products/${file.filename}`);
      });
    }

    const product = await db.Product.findByPk(req.params.id);
    return res.render("productEdit", {
      errors: errors.mapped(),
      categories,
      ...product,
    });
  }
};
