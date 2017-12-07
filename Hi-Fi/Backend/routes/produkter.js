const restify = require('restify');
const path = require('path');
const mysql = require(path.join(__dirname, '..', 'config', 'sql'));

module.exports = (app) => {

   app.get('/products', (req, res, next) => {
      let db = mysql.connect();
      db.execute(`SELECT * FROM products`, [], (err, rows) => {
         if (err) {
            console.log(err);
         } else {
            res.json(200, rows);
         }
      })
      db.end();
   });

   app.get('/vare/:id', (req, res, next) => {
      let id = (isNaN(req.params.id) ? 0 : req.params.id);
      if (id > 0) {
         let db = mysql.connect();
         db.execute(`SELECT * FROM vare WHERE Id = ?`, [req.params.id], (err, rows) => {
            if (err) {
               console.log(err);
            } else {
               res.json(200, rows);
            }
         })
         db.end();
      } else {
         res.json(400, {
            message: 'id ikke valid'
         });
      }
   });

   app.post('/vare', (req, res, next) => {

      let name = (req.body.name == undefined ? '' : req.body.name);
      let description = (req.body.description == undefined ? '' : req.body.description);
      let price = (req.body.price == undefined ? 0 : req.body.price);
      price = price.replace(',', '.');

      if (name != '' && description != '' && !isNaN(price)) {

         let db = mysql.connect();
         db.execute(`INSERT INTO vare SET Varenavn = ?, Gruppe = ?, Pris = ?`, [name, description, price], (err, rows) => {
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
      let description = (req.body.description == undefined ? '' : req.body.description);
      let price = (req.body.price == undefined ? 0 : req.body.price);
      let id = (isNaN(req.params.id) ? 0 : req.params.id);
      price = price.replace(',', '.');

      if (name != '' && description != '' && !isNaN(price) && id > 0) {

         let db = mysql.connect();
         db.execute(`UPDATE vare SET Varenavn = ?, Gruppe = ?, Pris = ? WHERE Id = ?`, [name, description, price, id], (err, rows) => {
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





   // ========================== static
   app.get('/.*', restify.plugins.serveStatic({
      'directory': 'public',
      'default': 'index.html'
   }));

}