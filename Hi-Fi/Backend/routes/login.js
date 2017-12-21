const restify = require('restify');
const path = require('path');
const mysql = require(path.join(__dirname, '..', 'config', 'sql'));

const passwordHash = require('password-hash');
const crypto = require('crypto');

module.exports = (app) => {
    
    app.post('/login', (req, res) => {
        console.log(req.body.username);
        console.log(req.body.password);
        if (req.body.password !== '' && req.body.username !== '') {
            let db = mysql.connect();
            db.execute('SELECT id, password FROM bruger WHERE username = ?', [req.body.username], (selError, rows) => {
                if (passwordHash.verify(req.body.password, rows[0].password)) {
                    crypto.randomBytes(256, (err, buf) => {
                        if (err) return res.status(500).end();
                        else {
                            const token = buf.toString('hex');
                            console.log(Date());
                            db.execute('INSERT INTO accestokens SET userid = ?, token = ?', [rows[0].id, token], (insError) => {
                                if (insError) return res.status(501).end();
                                else return res.send({ "ID": rows[0].id, "AccessToken": token });
                            });
                        }
                    });
                } else {
                    res.send(400);
                }
            });
        } else {
            res.send(402);
        }
    });
}; // module exports end