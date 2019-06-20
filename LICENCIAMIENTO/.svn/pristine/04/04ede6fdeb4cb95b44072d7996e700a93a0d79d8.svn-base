//FUNCION PARA DETERMINAR  EN QUE LENGUAJE  SE MOSTRARA  LA PAGINA WEB
CambiarLenguaje = function (lang) {
    //ASIGNACION EL TIPO DEL IDIOMA  A UN LOCALSTORAGE
    localStorage.setItem("idioma", lang);
}

//FUNCION NAVEGACION DEL MENU PRINCIPAL
NavegacionMenu = function (modulo) {
    sessionStorage.setItem("modulo", modulo);
    var navigateURL = "";

    switch (modulo) {
        case 1:
            navigateURL = '/IDP/Default.aspx';
            break;
        case 2:
            navigateURL = '/FYD/Default.aspx';
            break;
        case 3:
            navigateURL = '/MPC/Default.aspx';
            break;
        case 4:
            navigateURL = '/EO/Default.aspx';
            break;
        case 5:
            navigateURL = '';
        case 6:
            navigateURL = '/PDE/VentanaInicioPDE.aspx';
            break;
        case 7:
            navigateURL = '/Administracion/CatalogoConsultaInteligente.aspx';            
            break;
        case 8:
            navigateURL = '/ModulosApoyo/ReportesPersonalizados.aspx';
            break;

    }

    if (navigateURL.length > 0)
        Navegacion(2, navigateURL);
}


//NAVEGACION ENTRE PAGINAS
Navegacion = function (segundos, pagina) {
    $telerik.$("body").fadeOut("slow");
    setTimeout(function () {
        location.href = pagina;
    }, (parseInt(segundos) * 1000));
}

String.format = function () {
    // The string containing the format items (e.g. "{0}")
    // will and always has to be the first argument.
    var theString = arguments[0];

    // start with the second argument (i = 1)
    for (var i = 1; i < arguments.length; i++) {
        // "gm" = RegEx options for Global search (more than one instance)
        // and for Multiline search
        var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
        theString = theString.replace(regEx, arguments[i]);
    }

    return theString;
}