const router = require("express").Router();
const addOrder = require("../controllers/orders");

router.post("/orders", addOrder);
module.exports = router;
