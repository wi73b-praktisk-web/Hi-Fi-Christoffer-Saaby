module.exports = (server) => {
	server.post('/login', (req, res) => {
		if (req.body.brugernavn === 'martinlaursen' &&
			req.body.adgangskode === '1234') {
			res.send('success');
		} else {
			res.send('error');
		}
	});
};