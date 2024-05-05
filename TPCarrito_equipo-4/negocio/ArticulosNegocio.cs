using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using dominio;

namespace negocio
{
    public class ArticulosNegocio
    {
        public List<Articulo> listar()
        {
            List<Articulo> lista = new List<Articulo>();

            Data accesoDatos = new Data();

            try
            {

                accesoDatos.setearConsulta("SELECT A.Id, Codigo, Nombre, A.Descripcion, M.Descripcion Nombre_Marca, "
                    + "C.Descripcion Nombre_Categoria, M.Id Id_Marca, C.Id Id_Categoria, A.Precio, I.ImagenUrl UrlImagen FROM ARTICULOS A JOIN CATEGORIAS C " +
                    "ON A.IdCategoria = C.Id JOIN MARCAS M ON A.IdMarca = M.Id LEFT JOIN IMAGENES I ON I.IdArticulo = A.Id ORDER BY A.Id ASC");



                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    // Si el artículo que se está leyendo ya fue cargado, es porque tiene más de una imagen.
                    int indiceArticuloExistente = lista.FindIndex(a => a.Id == (int)accesoDatos.Lector["Id"]);
                    if (indiceArticuloExistente != -1)
                    {
                        // le agrego la imagen nueva y avanzo al siguiente registro.
                        Imagen imagen = new Imagen();
                        imagen.Url = (string)accesoDatos.Lector["UrlImagen"];
                        lista[indiceArticuloExistente].Imagenes.Add(imagen);
                        continue;
                    }

                    Articulo articulo = new Articulo();
                    articulo.Id = (int)accesoDatos.Lector["Id"];
                    articulo.CodigoArticulo = (string)accesoDatos.Lector["Codigo"];
                    articulo.Nombre = (string)accesoDatos.Lector["Nombre"];
                    articulo.Descripcion = (string)accesoDatos.Lector["Descripcion"];

                    //Creacion de Marca y relacion en datagrid
                    articulo.Marca = new Marca();
                    if (!(accesoDatos.Lector["Id_Marca"] is DBNull))
                    {
                        articulo.Marca.Id = (int)accesoDatos.Lector["Id_Marca"];
                        articulo.Marca.Nombre = (string)accesoDatos.Lector["Nombre_Marca"];
                    }

                    //Creacion de Categoria y relacion en datagrid
                    articulo.Categoria = new Categoria();
                    if (!(accesoDatos.Lector["Id_Categoria"] is DBNull))
                    {
                        articulo.Categoria.Id = (int)accesoDatos.Lector["Id_Categoria"];
                        articulo.Categoria.Nombre = (string)accesoDatos.Lector["Nombre_Categoria"];
                    }
                    articulo.Precio = (decimal)accesoDatos.Lector["Precio"];
                    articulo.Imagenes = new List<Imagen>();

                    // si no tiene imagenes, no se cargan en el objeto
                    if (!(accesoDatos.Lector["UrlImagen"] is DBNull))
                    {
                        Imagen auxImagen = new Imagen();
                        auxImagen.Url = (string)accesoDatos.Lector["UrlImagen"];
                        articulo.Imagenes.Add(auxImagen);
                    }


                    lista.Add(articulo);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        public void agregar(Articulo articuloNuevo)
        {
            Data datos = new Data();

            try
            {
                datos.setearConsulta("INSERT INTO ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio) OUTPUT inserted.Id VALUES('" + articuloNuevo.CodigoArticulo + "', '" + articuloNuevo.Nombre + "', '" + articuloNuevo.Descripcion + "', @IdMarca, @IdCategoria, " + articuloNuevo.Precio + ")");
                datos.setearParametro("@IdMarca", articuloNuevo.Marca.Id);
                datos.setearParametro("@IdCategoria", articuloNuevo.Categoria.Id);
                int idNuevoArticulo = datos.insertarYObtenerId(); // ejecucion de insert obteniendo id de objeto insertado
                articuloNuevo.Id = idNuevoArticulo;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
                if (articuloNuevo.Imagenes != null)
                    this.agregarImagenes(articuloNuevo);
            }
        }

        private void agregarImagenes(Articulo articulo)
        {
            int idArticulo = articulo.Id;
            this.quitarImagenes(idArticulo);

            try
            {
                // Agregar imagenes relacionadas

                foreach (Imagen imagen in articulo.Imagenes)
                {
                    this.agregarImagen(imagen, idArticulo);
                }

            }
            catch (Exception ex)
            {
                throw ex;

            }
        }

        private void quitarImagenes(int idArticulo)
        {
            Data datos = new Data();
            try
            {
                datos.setearConsulta("DELETE FROM IMAGENES WHERE IdArticulo = @Id");
                datos.setearParametro("@Id", idArticulo);
                datos.ejecutarAccion();

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

        private void agregarImagen(Imagen imagen, int idArticulo)
        {
            Data datos = new Data();
            try
            {
                datos.setearConsulta("INSERT INTO IMAGENES (IdArticulo, ImagenUrl) VALUES (@IdArticulo, @Url)");
                datos.setearParametro("@IdArticulo", idArticulo);
                datos.setearParametro("@Url", imagen.Url);
                datos.ejecutarAccion();

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


        public void modificar(Articulo articuloModificado)
        {
            Data datos = new Data();
            try
            {
                datos.setearConsulta("UPDATE ARTICULOS SET Codigo = @codigo, Nombre = @nombre, Descripcion = @descripcion, IdMarca = @idmarca, IdCategoria = @idcategoria, Precio = @precio WHERE Id = @id");
                datos.setearParametro("@codigo", articuloModificado.CodigoArticulo);
                datos.setearParametro("@nombre", articuloModificado.Nombre);
                datos.setearParametro("@descripcion", articuloModificado.Descripcion);
                datos.setearParametro("@idmarca", articuloModificado.Marca.Id);
                datos.setearParametro("@idcategoria", articuloModificado.Categoria.Id);
                datos.setearParametro("@precio", articuloModificado.Precio);
                datos.setearParametro("@id", articuloModificado.Id);

                datos.ejecutarAccion();


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();

                this.agregarImagenes(articuloModificado);

            }
        }

        public void eliminar(int id)
        {
            Data datos = new Data();
            try
            {
                datos.setearConsulta("DELETE FROM ARTICULOS WHERE Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
                datos.cerrarConexion();

                quitarImagenes(id);

            }
            catch (Exception ex)
            {

                datos.cerrarConexion();
                throw ex;
            }
        }

        public List<Articulo> filtrar(string campo, string criterio, string filtro)
        {
            List<Articulo> lista = new List<Articulo>();
            Data Datos = new Data();

            try
            {
                string consulta = "SELECT A.Id, Codigo, Nombre, A.Descripcion, M.Descripcion Nombre_Marca, "
                    + "C.Descripcion Nombre_Categoria, A.Precio, I.ImagenUrl UrlImagen FROM ARTICULOS A JOIN CATEGORIAS C " +
                    "ON A.IdCategoria = C.Id JOIN MARCAS M ON A.IdMarca = M.Id JOIN IMAGENES I ON I.IdArticulo = A.Id and ";

                switch (campo)
                {
                    case "Precio":
                        {
                            switch (criterio)
                            {
                                case "Mayor a":
                                    consulta += "A.Precio > " + filtro;
                                    break;
                                case "Menor a":
                                    consulta += "A.Precio < " + filtro;
                                    break;
                                default:
                                    consulta += "A.Precio = " + filtro;
                                    break;
                            }
                            break;
                        }
                    case "Marca":
                        {
                            switch (criterio)
                            {
                                case "Comienza con":
                                    consulta += "M.Descripcion like '" + filtro + "%' ";
                                    break;
                                case "Termina con":
                                    consulta += "M.Descripcion like '%" + filtro + "'";
                                    break;
                                default:
                                    consulta += "M.Descripcion like '%" + filtro + "%'";
                                    break;
                            }
                            break;
                        }
                    case "Categoria":
                        {
                            switch (criterio)
                            {
                                case "Comienza con":
                                    consulta += "C.Descripcion like '" + filtro + "%' ";
                                    break;
                                case "Termina con":
                                    consulta += "C.Descripcion like '%" + filtro + "'";
                                    break;
                                default:
                                    consulta += "C.Descripcion like '%" + filtro + "%'";
                                    break;
                            }
                            break;
                        }
                    case "Nombre":
                        {
                            switch (criterio)
                            {
                                case "Comienza con":
                                    consulta += "A.Nombre like '" + filtro + "%' ";
                                    break;
                                case "Termina con":
                                    consulta += "A.Nombre like '%" + filtro + "'";
                                    break;
                                default:
                                    consulta += "A.Nombre like '%" + filtro + "%'";
                                    break;
                            }
                            break;
                        }
                    default: break;
                }

                Datos.setearConsulta(consulta);
                Datos.ejecutarLectura();
                while (Datos.Lector.Read())
                {
                    Articulo articulo = new Articulo();

                    // Si el artículo que se está leyendo ya fue cargado, es porque tiene más de una imagen.
                    int indiceArticuloExistente = lista.FindIndex(a => a.Id == (int)Datos.Lector["Id"]);
                    if (indiceArticuloExistente != -1)
                    {
                        // le agrego la imagen nueva y avanzo al siguiente registro.
                        Imagen imagen = new Imagen();
                        imagen.Url = (string)Datos.Lector["UrlImagen"];
                        lista[indiceArticuloExistente].Imagenes.Add(imagen);
                        continue;
                    }

                    articulo.Id = (int)Datos.Lector["Id"];
                    articulo.CodigoArticulo = (string)Datos.Lector["Codigo"];
                    articulo.Nombre = (string)Datos.Lector["Nombre"];
                    articulo.Descripcion = (string)Datos.Lector["Descripcion"];
                    //Creacion de Marca y relacion en datagrip
                    articulo.Marca = new Marca();
                    articulo.Marca.Id = (int)Datos.Lector["Id"];
                    articulo.Marca.Nombre = (string)Datos.Lector["Nombre_Marca"];
                    //Creacion de Categoria y relacion en datagrip
                    articulo.Categoria = new Categoria();
                    articulo.Categoria.Id = (int)Datos.Lector["Id"];
                    articulo.Categoria.Nombre = (string)Datos.Lector["Nombre_Categoria"];
                    articulo.Precio = (decimal)Datos.Lector["Precio"];
                    articulo.Imagenes = new List<Imagen>();

                    // si no tiene imagenes, no se cargan en el objeto
                    if (!(Datos.Lector["UrlImagen"] is DBNull))
                    {
                        Imagen auxImagen = new Imagen();
                        auxImagen.Url = (string)Datos.Lector["UrlImagen"];
                        articulo.Imagenes.Add(auxImagen);
                    }
                    lista.Add(articulo);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}



