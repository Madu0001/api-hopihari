const express = require("express");
const router = express.Router();
const login = require("../middleware/usuarios.middleware")

router.post("/", () => {console.log("Rota de Fila")});

module.exports = router;