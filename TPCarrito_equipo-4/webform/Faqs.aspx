<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Faqs.aspx.cs" Inherits="webform.Faqs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 50%; margin: auto;">
        <div>
            <h2 style="text-align: center; margin: 50px;">Bienvenido a nuestra sección de Preguntas Frecuentes (FAQs)</h2>
            <p style="text-align: justify;">En esta sección, encontrarás respuestas a las preguntas más frecuentes sobre nuestra página de artículos.
                Hemos recopilado y respondido a las consultas más comunes para ayudarte a navegar y utilizar nuestra página de la mejor manera posible.
                Aquí, podrás obtener información sobre cómo buscar artículos por marca o categoría, cómo ver detalles de los artículos, cómo agregar artículos al carrito de compras y mucho más.</p>
            <p>Si no encuentras la respuesta a tu pregunta, no dudes en contactarnos. Estamos aquí para ayudarte.</p>
        </div>
        <div>
            <h4 style="text-align: center; margin: 20px;">¿Cómo puedo buscar artículos por marca?</h4>
            <p>En la página de inicio, encontrarás una opción para seleccionar y ver los artículos por marca. Al seleccionar una marca específica,
                serás redirigido a la página 'Ver productos' donde podrás ver todos los artículos de la marca seleccionada.</p>
        </div>

        <div>
            <h4 style="text-align: center; margin: 20px;">¿Cómo puedo buscar artículos por categoría?</h4>
            <p>En la página de inicio, también tendrás la opción de seleccionar y ver los artículos por categoría. Al seleccionar una categoría específica,
                serás redirigido a la página 'Ver productos' donde podrás ver todos los artículos de la categoría seleccionada.</p>
        </div>

        <div>
            <h4 style="text-align: center; margin: 20px;">¿Qué información se proporciona para cada artículo?</h4>
            <p>Cada artículo en nuestra página tiene una imagen, un nombre y una descripción</p>
        </div>

        <div>
            <h4 style="text-align: center; margin: 20px;">¿Cómo puedo ver más detalles de un artículo?</h4>
            <p>Al seleccionar un artículo ya sea por marca o categoría, serás redirigido a otra página, en la misma se listaran articulos con informacion basica,
                pero las mismas tiene un boton indicando si quieres ver mas detalles sobre ese articulo, dando click podrás ver ese artículo en detalle.</p>
        </div>

        <div>
            <h4 style="text-align: center; margin: 20px;">¿Cómo puedo agregar artículos al carrito de compras?</h4>
            <p>En la página de detalles del artículo, encontrarás la opción de 'Agregar al carrito'. Al seleccionar esta opción, el artículo se agregará a tu carrito de compras.</p>
        </div>
        <div>
            <h4 style="text-align: center; margin-top: 20px; margin-bottom:20px;">¿Cómo puedo ver los artículos en mi carrito de compras?</h4>
            <p>Puedes ver los artículos en tu carrito de compras visitando la sección 'Carrito' en nuestra página, indicada en el menu de navegacion.</p>
        </div>
        <div>
            <h4 style="text-align: center; margin: 20px;">¿Cómo puedo ver todos los artículos?</h4>
            <p>Puedes ver todos los artículos presionando en nuestro menu de navegacion la opcion de 'Ver productos', aqui encontraras todos los articulos de la pagina sin importar su marca o categoría.</p>
        </div>
        <div>
            <h4 style="text-align: center; margin: 20px;">¿Cómo puedo encontrar un artículos especifico?</h4>
            <p>Puedes encontar un artículos especifico atravez de un filtrado, para eso debe ubicarse en la pagina 'Ver productos' y
                en la misma tendra una opcion de 'Filtrado' en parte superior derecha de la pagina, esto desplegara un canvas de busqueda donde podra filtrar por varias opciones. .</p>
        </div>
    </div>

</asp:Content>
