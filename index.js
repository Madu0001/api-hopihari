const express = require("express");
const app = express();
const cors = require("cors");
const helmet = require("helmet");
const bodyParsen = require("body-parser");

const usuariosRoute = require("./routes/usuarios.route");
const filasRoute = require("./routes/filas.routes")

app.use(cors());
app.use(helmet());

app.use(bodyParsen.urlencoded({ extended: false }));
app.use(bodyParsen.json());

app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept, Authorization"
    );

    if (req.method === "OPTIONS") {
        res.header("Access-Control-Allow-Methods", "PUT, POST, PATCH, DELETE");
    }
    next();
});

app.use("/usuarios", usuariosRoute);
app.use("/filas", filasRoute);

module.exports = app;