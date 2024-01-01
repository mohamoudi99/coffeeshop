const Order = require("../models/Order");
const Product = require("../models/Product");
const User = require("../models/User");

const addOrder = async (req, res) => {
  try {
    const { products, address, floor, phone } = req.body;
    if (!products || !address || !floor || !phone) {
      return res.status(400).json({ message: "All fields are required" });
    }
    console.log(products);
    const productsNames = products.map((product) => product.name);
    //find by name, products ordered from the database and return only the _id
    const productsOrdered = await Product.find({
      name: { $in: productsNames },
    });
    const productsToFillDb = productsOrdered.map((product, i) => {
      console.log(products[i].amount);
      return {
        product: product._id,
        quantity: products[i].amount,
      };
    });
    let totalPrice = 0;
    products.forEach((element) => {
      totalPrice += element.total;
    });
    console.log(productsOrdered);
    const order = new Order({
      user: req.body._id,
      products: productsToFillDb,
      totalPrice,
      address,
      floor,
      phone,
    });
    await order.save();
    res.status(200).json({ message: "Order added successfully" });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Something went wrong" });
  }
};
module.exports = addOrder;
