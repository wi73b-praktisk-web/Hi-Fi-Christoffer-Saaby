const db = require('../config/sql').connect();
const passwordHash = require('password-hash');
const crypto = require('crypto');

module.exports = (app) => {
    app.post('/login', (req, res) => {
        if (req.body.password !== '' && req.body.username !== '') {
            console.log(passwordHash.generate(req.body.password));
            console.log('username', req.body.username);
            console.log('password', req.body.password);
            db.execute('SELECT Id, Password FROM bruger WHERE Username = ?', [req.body.username], (selError, rows) => {
                if (selError) {
                    console.log();
                } else
                if (passwordHash.verify(req.body.password, rows[0].Password)) {
                    crypto.randomBytes(256, (err, buf) => {
                        if (err) return res.status(500).end();
                        else {
                            const token = buf.toString('hex');
                            db.execute('INSERT INTO accestokens SET userid = ?, token = ?', [rows[0].Id, token], (insError) => {
                                if (insError) return res.status(500).end();
                                else return res.send({ "ID": rows[0].Id, "AccessToken": token });
                            });
                        }
                    });
                } else {
                    res.send(402);
                }
            });
        } else {
            res.send(411);
        }
    });
};