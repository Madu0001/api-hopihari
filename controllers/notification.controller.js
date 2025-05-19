const mysql = require('../mysql');

exports.getNotificacoes = async (req, res, next) => {
    try {
        const idUsuario = res.locals.idUsuario; 
        console.log("ID do usuário recebido:", idUsuario);

        const resultado = await mysql.execute(
            `SELECT * FROM notifications WHERE users_id = ?`,
            [idUsuario]
        );
        console.log("Resultado da consulta:", resultado);

        if (resultado.length === 0) {
            return res.status(404).send({ "mensagem": "Nenhuma notificação encontrada para este usuário!" });
        }

        return res.status(200).send({ "mensagem": "Notificações encontradas!", "resultado": resultado });
    } catch (error) {
        console.error("Erro no endpoint de notificações:", error);
        return res.status(500).send({ error });
    }
};