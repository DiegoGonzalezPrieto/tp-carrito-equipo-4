using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Articulo
    {
        public int Id { get; set; }
        [DisplayName("Código de Artículo")]
        public  string CodigoArticulo { get; set; }
        [DisplayName("Nombre Artículo")]
        public string Nombre { get; set; }
        [DisplayName("Descripcíon")]
        public string Descripcion { get; set; }
        [DisplayName("Marca Artículo")]
        public Marca Marca { get; set; }
        [DisplayName("Categoría Artículo")]
        public Categoria Categoria { get; set; }

        public List<Imagen> Imagenes { get; set; }

        [DisplayName("Precio")]
        public decimal Precio { get; set; }

        override public string ToString()
        {
            string s = "Cod. Artículo: " + this.CodigoArticulo;
            s += "\nNombre: " + this.Nombre;
            s += "\nCategoría: " + this.Categoria;
            s += "\nMarca: " + this.Marca;
            return s;
        }
    }
}
