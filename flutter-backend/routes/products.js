const router = require("express").Router();
const getProducts = require("../controllers/getProducts");
router.get("/products", getProducts);
module.exports = router;
