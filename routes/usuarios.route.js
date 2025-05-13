const express = require("express");
const router = express.Router();
const usuariosCotroller = require("../controllers/usuarios.controller");

router.post( "/", usuariosCotroller.cadastrarUsuario);
router.put( "/:id", usuariosCotroller.atualizarUsuario);
router.post( "/login", usuariosCotroller.login);

module.exports = router;