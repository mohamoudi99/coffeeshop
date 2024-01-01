const { Schema, model } = require("mongoose");
const OrderSchema = new Schema({
  user: {
    type: Schema.Types.ObjectId,
    ref: "User",
  },
  products: [
    {
      product: {
        type: Schema.Types.ObjectId,
        ref: "Product",
      },
      quantity: Number,
      
    },
  ],
  totalPrice: Number,
  date: {
    type: Date,
    default: Date.now,
  },
  address: String,
  floor: String,
  phone: String,
});
const Order = model("Order", OrderSchema);
module.exports = Order;
