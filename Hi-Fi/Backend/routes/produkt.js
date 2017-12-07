const db = require('../config/sql').connect();
const security = require('../services/security');

module.exports = function (app) {

	app.get('/produkter', function (req, res) {
		db.query('select * from vare', function (err, data) {
			res.send(data);
		});
	});

	app.get('/produkter/varegrupper', (req, res) => {
		db.query('select * from varegrupper', function (err, data) {
			res.send(data);
		});
	});
	app.get('/produkter/varegrupper/:id', (req, res) => {
		console.log(req.params.id);
		var gruppeid = req.params.id;

		db.query(`SELECT * FROM vare WHERE Gruppe = ${gruppeid}`, function (err, data) {
			res.send(data);
		});
	});
} // module.export end