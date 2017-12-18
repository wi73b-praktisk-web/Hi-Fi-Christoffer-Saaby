module.exports = (server) => {
	server.post('/login', (req, res) => {
		if (req.body.brugernavn === 'Christoffer' &&
			req.body.adgangskode === '1234') {
			res.send('success');
		} else {
			res.send('error');
		}
	});
};