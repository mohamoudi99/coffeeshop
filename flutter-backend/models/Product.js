const { Schema, model } = require("mongoose");
const ProductSchema = new Schema({
  name: { type: String, required: true, unique: true },
  description: String,
  price: Number,
  image: String,
});

const Product = model("Product", ProductSchema);
// //insert 4 products into the database (Black 4$ description of your choice, White 4$ description of your choice, Blue 4$ description of your choice, Red 4$ description of your choice)
// const Black = new Product({
//   name: "Black",
//   description: "Premium black coffee served with lotus biscuits",
//   price: 4,
//   image: "lib/images/black.jpeg",
// });
// const Caramel = new Product({
//   name: "Caramel",
//   description: "Caramel frappe with whipped cream",
//   price: 3.5,
//   image: "lib/images/caramel.jpeg",
// });
// const Mocha = new Product({
//   name: "Mocha",
//   description: "Mocha frappe with whipped cream and chocolate sauce",
//   price: 4,
//   image: "lib/images/mocha.jpeg",
// });
// const Vanilla = new Product({
//   name: "Vanilla",
//   description: "Vanilla frappe with whipped cream",
//   price: 4,
//   image: "lib/images/vanilla.jpeg",
// });
// Black.save();
// Caramel.save();
// Mocha.save();
// Vanilla.save();

module.exports = Product;
