module.exports = (app) => {
    require('./produkt')(app);
    //require('./kontakt')(app);
    require('./login')(app);
    //require('security')(app);
    require('./produkter')(app);
};