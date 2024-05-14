using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Carrito
    {
        public List<ItemCarrito> Items { get; set; } = new List<ItemCarrito>();

        public decimal ImporteTotal
        {
            get { return Items.Sum(i => i.SubTotal); }
        }
        public string ImporteTotalMoneda
        {
            get { return (Math.Truncate(ImporteTotal * 100) / 100).ToString("C"); }
        }

        public int CantidadProductos { get { return Items.Sum(i => i.Cantidad); } }

        public void agregarItem(Articulo articulo)
        {
            foreach (ItemCarrito item in Items)
            {
                if (item.Id == articulo.Id)
                {
                    item.Cantidad++;
                    return;
                }
            }
            Items.Add(new ItemCarrito(articulo));
            return;
        }
        public void aumentarItemExistente(int id)
        {
            foreach (ItemCarrito item in Items)
            {
                if (item.Id == id)
                {
                    item.Cantidad++;
                    return;
                }
            }
            throw new Exception("El artículo no está en el carrito.");
        }
        public void quitarItem(Articulo articulo)
        {
            foreach (ItemCarrito item in Items)
            {
                if (item.Id == articulo.Id)
                {
                    if (item.Cantidad > 1)
                        item.Cantidad--;
                    else
                        Items.Remove(item);
                    return;
                }
            }
            throw new Exception("El item no se encuentra en el carrito.");
        }
        public void quitarItem(int id)
        {
            foreach (ItemCarrito item in Items)
            {
                if (item.Id == id)
                {
                    if (item.Cantidad > 1)
                        item.Cantidad--;
                    else
                        Items.Remove(item);
                    return;
                }
            }
            throw new Exception("El item no se encuentra en el carrito.");
        }

        public void eliminarItem(int id)
        {
            foreach (ItemCarrito item in Items)
            {
                if (item.Id == id)
                {
                    Items.Remove(item);
                    return;
                }
            }
            throw new Exception("El item no se encuentra en el carrito.");
        }
        public int ObtenerCantidadEnCarrito(Articulo articulo)
        {
            foreach (ItemCarrito item in Items)
            {
                if (item.Id == articulo.Id)
                {
                    return item.Cantidad;
                }
            }
            return 0;
        }
    }
    
}
