const Product = require("../models/Product");

const getProducts = async (req, res) => {
  try {
    console.log("getProducts");
    const products = await Product.find();
    res.status(200).json({ products });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Something went wrong" });
  }
};
module.exports = getProducts;
