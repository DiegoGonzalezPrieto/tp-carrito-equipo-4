using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class CategoriasNegocio
    {
        public static List<Categoria> ListaCategorias()
        {
            {
                List<Categoria> ListaDeCategorias = new List<Categoria>();
                Data datosDeCategorias = new Data();

                try
                {
                    datosDeCategorias.setearConsulta("SELECT id, descripcion FROM CATEGORIAS");
                    datosDeCategorias.ejecutarLectura();


                    while (datosDeCategorias.Lector.Read())
                    {

                        Categoria categoria = new Categoria();
                        categoria.Id = (int)datosDeCategorias.Lector["id"];
                        categoria.Nombre = (string)datosDeCategorias.Lector["Descripcion"];

                        ListaDeCategorias.Add(categoria);
                    }
                    return ListaDeCategorias;
                }

                catch (Exception ex)
                {

                    throw ex;

                }
                finally
                {
                    datosDeCategorias.cerrarConexion();
                }

            }
        }

            public void agregarCategoria(Categoria nuevaCategoria)
            {

                Data datos = new Data();

                try
                {
                    datos.setearConsulta("INSERT INTO CATEGORIAS (Descripcion) VALUES('" + nuevaCategoria.Nombre + "')");
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

        public bool eliminar(int id)
        {

            // revisar que la categoría no esté asociada a ningún producto.
            ArticulosNegocio articulosNegocio = new ArticulosNegocio();
            List<Articulo> articulos = articulosNegocio.listar();

            if (articulos.FindAll(a => a.Categoria.Id == id).Count > 0)
            {
                return false;
            }

            try
            {
                Data datos = new Data();
                datos.setearConsulta("DELETE FROM CATEGORIAS WHERE Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void modificarCategoria(Categoria categoria)
        {
            Data datos = new Data();
            try
            {
                datos.setearConsulta("UPDATE CATEGORIAS SET Descripcion = @descripcion WHERE Id = @id");
                datos.setearParametro("@descripcion", categoria.Nombre);
                datos.setearParametro("@id", categoria.Id);


                datos.ejecutarAccion();


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
                
        }
    }

