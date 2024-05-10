using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class ItemCarrito : Articulo
    {
        public ItemCarrito()
        { }

        public ItemCarrito(Articulo articulo)
        {
            Id = articulo.Id;
            CodigoArticulo = articulo.CodigoArticulo;
            Nombre = articulo.Nombre;
            Descripcion = articulo.Descripcion;
            Marca = articulo.Marca;
            Categoria = articulo.Categoria;
            Imagenes = articulo.Imagenes;
            Precio = articulo.Precio;
            Cantidad = 1;
        }
        public int Cantidad { get; set; }

        public decimal SubTotal
        {
            get { return Precio * Cantidad; }
        }

        public string SubTotalMoneda
        {
            get { return "$ " + SubTotal.ToString(); }
        }

    }
}
