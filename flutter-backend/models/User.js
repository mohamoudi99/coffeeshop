const { Schema, model } = require("mongoose");
const UserSchema = new Schema({
  email: {
    type: String,
    unique: true,
    lowercase: true,
  },
  username: {
    type: String,
    unique: true,
    lowercase: true,
  },
  password: String,
});
const User = model("User", UserSchema);
module.exports = User;
