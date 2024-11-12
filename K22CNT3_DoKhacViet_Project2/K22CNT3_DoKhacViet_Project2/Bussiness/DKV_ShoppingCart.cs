using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using K22CNT3_DoKhacViet_Project2.Models;

namespace K22CNT3_DoKhacViet_Project2.Bussiness
{
    public class DKV_ShoppingCart
    {
        public List<DKVCartItem> Items { get; set; }

        public DKV_ShoppingCart()
        {
            Items = new List<DKVCartItem>();
        }

        // Chức năng thêm sản phẩm vào giỏ hàng
        public void AddToCart(DKVCartItem item)
        {
            var existingItem = Items.FirstOrDefault(x => x.ID == item.ID);
            if (existingItem != null)
            {
                existingItem.SoLuongMua += item.SoLuongMua;
            }
            else
            {
                Items.Add(item);
            }
        }

        // Xóa sản phẩm trong giỏ hàng
        public void RemoveCartItem(int id)
        {
            var itemToRemove = Items.FirstOrDefault(x => x.ID == id);
            if (itemToRemove != null)
            {
                Items.Remove(itemToRemove);
            }
        }

        // Tính tổng trị giá của hóa đơn
        public float GetTongThanhTien()
        {
            return Items.Sum(x => x.SoLuongMua * x.DonGiaMua);
        }

        // Cập nhật Shopping cart
        public void UpdateFromCart(int id, int qty)
        {
            var existingItem = Items.FirstOrDefault(x => x.ID == id);
            if (existingItem != null)
            {
                existingItem.SoLuongMua = qty;
            }
        }
    }
}
