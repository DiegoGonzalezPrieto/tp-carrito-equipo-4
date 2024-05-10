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
            get { return "$ " + ImporteTotal.ToString(); }
        }

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
    }
}
