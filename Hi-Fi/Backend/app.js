const restify = require('restify');
const corsmiddleware = require('restify-cors-middleware');
const logger = require('morgan');
const path = require('path');
const server = restify.createServer({
    'name': 'hi-fi',
    'version': '1.0.0'
});

server.use(logger('dev'));
server.use(restify.plugins.bodyParser());
const cors = corsmiddleware({ origins: ['*'],"allowHeaders": ['Authorization', 'userID'] });
server.pre(cors.preflight);
server.use(cors.actual);

require('./routes/index')(server);



plugins = require('restify-plugins'),
    fs = require('fs'),
    request = require('request'),
    FormData = require('form-data');

const port = process.env.port || 1337;

server.use(logger('dev'));

server.use(plugins.multipartBodyParser());  // Enabling multipart
server.use(restify.plugins.acceptParser(server.acceptable));
server.use(restify.plugins.queryParser());
server.use(restify.plugins.bodyParser());

server.listen(port, function (err) {
    if (err) console.log(err);
    console.log('=================================================================');
    console.log('%s is listening on %s', server.name, port);
});


//note til martin der skal installeres 2 modules for at det virker den første er npm install restify-plugins -S og den anden er npm install request -S