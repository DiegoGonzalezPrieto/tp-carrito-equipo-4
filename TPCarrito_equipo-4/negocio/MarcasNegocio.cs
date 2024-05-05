using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class MarcasNegocio
    {
        /// <summary>
        /// Devuelve un listado de Marcas de la base de datos
        /// </summary>
        /// <returns></returns>
        public static List<Marca> ListaMarcas()
        {
            List<Marca> listaDeMarcas = new List<Marca>();
            Data datosDeMarcas = new Data();

            try
            {
                datosDeMarcas.setearConsulta("SELECT Id, Descripcion FROM MARCAS");
                datosDeMarcas.ejecutarLectura();

                while (datosDeMarcas.Lector.Read())
                {
                    Marca marca = new Marca();
                    marca.Id = (int)datosDeMarcas.Lector["Id"];
                    marca.Nombre = (string)datosDeMarcas.Lector["Descripcion"];

                    listaDeMarcas.Add(marca);
                }

                return listaDeMarcas;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datosDeMarcas.cerrarConexion();
            }


        }

        public void agregarMarca(Marca nuevaMarca)
        {

            Data datos = new Data();

            try
            {
                datos.setearConsulta("INSERT INTO MARCAS (Descripcion) VALUES('" + nuevaMarca.Nombre + "')");
                datos.ejecutarLectura();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void modificar(Marca marca)
        {
            Data datos = new Data();
            try
            {
                datos.setearConsulta("UPDATE MARCAS SET Descripcion = @descripcion WHERE Id = @id");
                datos.setearParametro("@descripcion", marca.Nombre);
                datos.setearParametro("@id", marca.Id);


                datos.ejecutarAccion();


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool eliminar(int id)
        {

            // revisar que la marca no esté asociada a ningún producto.
            ArticulosNegocio articulosNegocio = new ArticulosNegocio();
            List<Articulo> articulos = articulosNegocio.listar();

            if (articulos.FindAll(a => a.Marca.Id == id).Count > 0)
            {
                return false;
            }

            try
            {
                Data datos = new Data();
                datos.setearConsulta("DELETE FROM MARCAS WHERE Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
