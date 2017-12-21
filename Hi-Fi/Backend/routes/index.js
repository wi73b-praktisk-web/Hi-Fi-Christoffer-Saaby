module.exports = (app) => {
    require('./produkt')(app);
    require('./login')(app);
    // require('security')(app);
    // require('./loginsecurity')(app);
};