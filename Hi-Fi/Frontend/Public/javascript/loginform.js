(() => {
    document.addEventListener('DOMContentLoaded', () => {
        const form = document.querySelector('.loginForm');

        form.onsubmit = () => {
            // console.log(confirm('Hejsa'));
            if (localStorage.getItem('token')) {
                if (confirm('Du er logget ind\n\nVil du logge af?')) {
                    localStorage.clear();
                } else {
                    console.log('test');
                    const data = JSON.stringify({
                        'username': form.username.value,
                        'password': form.password.value
                    });

                    fetch('http://localhost:1337/login.js', {
                        'method': 'POST',
                        'headers': {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json',
                            'Content-Length': data.length
                        },
                        'mode': 'cors',
                        'cache': 'default',
                        'body': data
                    })
                        .then((result) => result.json())
                        .then((data) => {
                            localStorage.setItem('token', data.AccessToken);
                            localStorage.setItem('userid', data.ID);
                            document.getElementById('status').innerHTML = "Du er nu logget ind ...";
                        })
                        .catch((err) => {
                            console.log(err);
                        });

                    return false;
                };
            }
        }
    });
})();

document.getElementById('logud').addEventListener('click', () => {
    if (confirm('Vil du logge af?')) {
        localStorage.clear();
    }
})