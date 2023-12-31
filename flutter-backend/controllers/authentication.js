const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../models/User");

const signup = async (req, res) => {
  try {
    const { email, username, password } = req.body;
    if (!email || !username || !password) {
      return res
        .status(400)
        .json({ message: "Email, username and password are required" });
    }
    if (password.length < 6) {
      return res
        .status(400)
        .json({ message: "Password should be at least 6 characters long" });
    }
    if (username.length < 3) {
      return res
        .status(400)
        .json({ message: "username should be at least 3 characters long" });
    }
    if (!email.includes("@")) {
      return res.status(400).json({ message: "Email should contain @" });
    }
    const checkExistingEmail = await User.findOne({ email });
    if (checkExistingEmail) {
      return res.status(400).json({ message: "Email already exists" });
    }
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    const user = new User({
      email,
      username,
      password: hashedPassword,
    });
    await user.save();
    res.json({ message: "Signup successful" });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Something went wrong" });
  }
};
const login = async (req, res) => {
  try {
    const { username, password } = req.body;
    if (!username || !password) {
      return res
        .status(400)
        .json({ message: "Username and password are required" });
    }
    const authenticatingUser = await User.findOne({ username });
    if (!authenticatingUser) {
      return res.status(404).json({ message: "Username does not exist" });
    }
    const passwordMatches = await bcrypt.compare(
      password,
      authenticatingUser.password
    );
    if (!passwordMatches) {
      return res.status(401).json({ message: "Password is incorrect" });
    }
    const payload = {
      id: authenticatingUser._id,
      userName: authenticatingUser.userName,
    };
    const secret = process.env.JWT_SECRET;
    const token = jwt.sign(payload, secret, { expiresIn: "1h" });
    res.status(200).json({ token });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Something went wrong" });
  }
};
module.exports = { signup, login };
