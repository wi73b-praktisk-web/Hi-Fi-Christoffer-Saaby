(() => {
document.addEventListener('DOMcontentLoaded', () =>{
    document.querySelector('#send').addEventListener('click', () => {
        const form = document.querySelector('#kontakt');
        formular(form);
    })
})
})();

function formular(form) {
    var send = true;
    if (form.navn.value == 0) {
        document.getElementById("navn_validering").innerHTML = "Udfyld venligst navn.";
        form.navn.focus();
        (document.getElementById("navn").style.borderColor = 'red');
        send = false;
        
    }else{
        navn.style.borderColor ="grey";
        document.getElementById("navn_validering").innerHTML = "";
    }

    if (form.telefon.value == 0) {
        document.getElementById("telefon_validering").innerHTML = "Udfyld venligst telefon.";
        form.telefon.focus();
        (document.getElementById("telefon").style.borderColor = 'red');
        send = false;
        
       
        }else{
        if (isNaN(form.telefon.value))
        {
        document.getElementById("telefon_validering").innerHTML = "Dette er ikke et tal.";
        form.telefon.focus();
        (document.getElementById("telefon").style.borderColor = 'red');
        send = false;  
        }
        else
        {
            if(form.telefon.value.length !=8)
            {
        document.getElementById("telefon_validering").innerHTML = "Dette er ikke et gyldigt telefon nummer.";
        form.telefon.focus();
        (document.getElementById("telefon").style.borderColor = 'red');
        send = false;
            }
            else
            {
                telefon.style.borderColor ="gray"; 
                document.getElementById("telefon_validering").innerHTML = "";
            }
        }
    }
    
    if (form.email.value == 0) {
        document.getElementById("email_validering").innerHTML = "Udfyld venligst email.";
        form.email.focus();
        (document.getElementById("email").style.borderColor = 'red');
        send = false;
        
     }
    else
    {
       if(checkEmail(form.email.value))
    {
        email.style.borderColor ="gray";
        document.getElementById("email_validering").innerHTML = "";
    }
        else
    {
        document.getElementById("email_validering").innerHTML = "Der er ugyldige eller manglende tegn.";
        form.email.focus();
        (document.getElementById("email").style.borderColor = 'red');
        send = false;
    }
}
    return send;
}

function checkEmail(email){
 var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
 if (filter.test(email)){
 return true;
 }
 return false;
}