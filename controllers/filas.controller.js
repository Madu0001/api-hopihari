const mysql = require ("../mysql");

exports.verificarBrinquedo = async (req, res, next) => {
    try {
        const resultado = await mysql.execute (`
            SELECT * FROM rides WHERE id = ?;
            `, [req.params.idRides]);

            if(resultado.length == 0) {
                return res.status(404).send ({"Mensagem": "Brinquedo não encontrado"})
            }
            next();
    } catch (error) {
        return res.status(500).send(error);
    }
}


exports.entrarFila = async (req, res, next) => {
    try {
        const resultados = await mysql.execute (`
            INSERT INTO hopi_hari_db.lines (users_id, rides_id) VALUES (?,?)
            `,[res.locals.idUsuario, Number(req.params.idRides)])
            return res.status(201).send({"Mensagens": resultados})
    } catch (error) {
        return res.status (500).send(error)
    }
}