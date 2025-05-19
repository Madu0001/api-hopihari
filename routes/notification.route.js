const notifications = require('../controllers/notification.controller')
const express = require('express')
const router = express.Router()
const login = require("../middleware/usuarios.middleware")

router.get ("/:id",
    login.required,
    notifications.getNotificacoes
);

module.exports = router;