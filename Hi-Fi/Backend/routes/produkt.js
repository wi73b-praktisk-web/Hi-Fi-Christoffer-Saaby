const db = require('../config/sql').connect();
const security = require('../services/security');

module.exports = function (app) {
// Der bliver hentet alle rækker fra tabellen "vare"
	app.get('/produkter', function (req, res) {
		db.query('select * from vare', function (err, data) {
			res.send(data);
		});
	});
// Der bliver hentet alle rækker fra tabellen "varegrupper"
	app.get('/produkter/varegrupper', (req, res) => {
		db.query('select * from varegrupper', function (err, data) {
			res.send(data);
		});
	});
	app.get('/produkter/varegrupper/:id', (req, res) => {
		console.log(req.params.id);
		var gruppeid = req.params.id;
// Der bliver hentet alle rækker fra tabellen "vare" med et bestemt gruppeid
		db.query(`SELECT * FROM vare WHERE Gruppe = ${gruppeid}`, function (err, data) {
			res.send(data);
		});
	});;
  
	 app.post('/vare', (req, res, next) => {
  
		let name = (req.body.name == undefined ? '' : req.body.name);
		let varegruppe = (req.body.varegruppe == undefined ? '' : req.body.varegruppe);
		let varenummer = (req.body.varenummer == undefined ? '' : req.body.varenummer);
		let price = (req.body.price == undefined ? 0 : req.body.price);
		price = price.replace(',', '.');
  
		if (name != '' && varegruppe != '' && varenummer != '' && !isNaN(price)) {
  
		   let db = mysql.connect();
		   db.execute(`INSERT INTO vare SET Varenavn = ?, Gruppe = ?, Varenummer = ?, Pris = ?`, [name, varegruppe, varenummer, price], (err, rows) => {
			  if (err) {
				 console.log(err);
			  } else {
				 res.json(200, rows);
			  }
		   })
		   db.end();
		} else {
		   res.json(400, {
			  message: 'validering fejlede'
		   });
		}
	 });
  
	 app.put('/vare/:Id', (req, res, next) => {
  
		let name = (req.body.name == undefined ? '' : req.body.name);
		let varegruppe = (req.body.varegruppe == undefined ? '' : req.body.varegruppe);
		let varenummer = (req.body.varenummer == undefined ? '' : req.body.varenummer);
		let price = (req.body.price == undefined ? 0 : req.body.price);
		let id = (isNaN(req.params.id) ? 0 : req.params.id);
		price = price.replace(',', '.');
  
		if (name != '' && varegruppe != '' && varenummer != '' && !isNaN(price) && id > 0) {
  
		   let db = mysql.connect();
		   db.execute(`UPDATE vare SET Varenavn = ?, Gruppe = ?, Varenummer = ?, Pris = ? WHERE Id = ?`, [name, varegruppe, varenummer, price, id], (err, rows) => {
			  if (err) {
				 console.log(err);
			  } else {
				 res.json(200, rows);
			  }
		   })
		   db.end();
		} else {
		   res.json(400, {
			  message: 'validering fejlede'
		   });
		}
	 });
  
	 app.del('/vare/:Id', (req, res, next) => {
		let id = (isNaN(req.params.id) ? 0 : req.params.id);
		if (id > 0) {
		   let db = mysql.connect();
		   db.execute(`DELETE FROM vare WHERE Id = ?`, [req.params.id], (err, rows) => {
			  if (err) {
				 console.log(err);
			  } else {
				 res.json(204);
			  }
		   })
		   db.end();
		} else {
		   res.json(400, {
			  message: 'id ikke valid'
		   });
		}
	 });
} // module.export end