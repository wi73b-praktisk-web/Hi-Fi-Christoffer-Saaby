var urlparametre = hentAlleUrlParametre();
console.log(urlparametre.gruppe);

// hvis vi har modtaget en gruppe i url så viser den produkter ellers viser den grupperne.
if (urlparametre.gruppe !== undefined) {
// udskriv produkter
    fetch(`http://localhost:1337/produkter/varegrupper/${urlparametre.gruppe}`)
    .then((response) => {
        // grib svarets indhold (body) og send det som et json objekt til næste .then()
        return response.json();
    })
    .then((data) => {
        // nu er json objektet lagt ind i data variablen, udskriv data
        console.log(data);
        document.getElementById('container').innerHTML = '';

    var container = document.getElementById('container');
    var counter = 0;
    var html = '';

    data.forEach(function(vare) {
        html = '';

        if((counter %3) == 0) {
            html = '<hr>';
        }

        html += `
        <div class="box">
            <h4>${vare.Varenavn}</h4>
            <img src="img/${vare.Billed}">
            </div>`;

            container.innerHTML += html
            counter++;    
    }, this);

    });
} else {
 // udskriv grupper
 fetch('http://localhost:1337/produkter/varegrupper')
 // fetch('http://localhost:1337/produkter')
 .then((response) => {
     // grib svarets indhold (body) og send det som et json objekt til næste .then()
     return response.json();
 })
 .then((data) => {
     // nu er json objektet lagt ind i data variablen, udskriv data
     console.log(data);
     document.getElementById('container').innerHTML = '';

 var container = document.getElementById('container');
 var counter = 0;
 var html = '';

 data.forEach(function(varegrupper) {
     html = '';

     if((counter %3) == 0) {
         html = '<hr>';
     }

     html += `
        <div class="box">
            <a href="produkter.html?gruppe=${varegrupper.Id}">
            <h4>${varegrupper.Gruppe}</h4>
            <img src="img/${varegrupper.billede}">
            </a>
        </div>`;

         container.innerHTML += html
         counter++;    
 }, this);

 });
}