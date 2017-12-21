const restify = require('restify');
const path = require('path');
const mysql = require(path.join(__dirname, '..', 'config', 'mysql'));

const passwordHash = require('password-hash');
const crypto = require('crypto');

module.exports = (app) => {
    app.post('/login', (req, res) => {
        if (req.body.password !== '' && req.body.username !== '') {
            let db = mysql.connect();
            db.execute('SELECT Id, Password FROM bruger WHERE Username = ?', [req.body.username], (selError, rows) => {
                if (passwordHash.verify(req.body.password, rows[0].password)) {
                    crypto.randomBytes(256, (err, buf) => {
                        if (err) return res.status(500).end();
                        else {
                            const token = buf.toString('hex');
                            db.execute('INSERT INTO accestokens SET userid = ?, token = ?, created =?', [rows[0].id, token, Date()], (insError) => {
                                if (insError) return res.status(500).end();
                                else return res.send({ "ID": rows[0].id, "AccessToken": token });
                            });
                        }
                    });
                } else {
                    res.send(401);
                }
            });
        } else {
            res.send(401);
        }
    });
};