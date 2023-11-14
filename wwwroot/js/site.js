function SubirReceta()
{
    let nombre = $("#Titulo").val();
    let ingredientes= $("#Ingredientes").val();
    let img = $("#Portada").val();
    let banner = $("#Banner").val();
    let pasos = $("#Pasos").val();
    let desc = $("#Descripcion").val();
    let tipo = $("#Tipo").val();
    $.ajax(
        {
           
            type: 'POST',
            dataType: 'JSON',
            url: 'Home/ModalSubirReceta',
            data: {NombreReceta: nombre, Ingredientes: ingredientes, Img: img, Banner: banner, Pasos: pasos, Desc: desc, Tipo: tipo},
            success:
                function(response)
                {
                    
                }

        });
}