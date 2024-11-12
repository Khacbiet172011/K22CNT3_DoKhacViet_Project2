using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace K22CNT3_DoKhacViet_Project2.Models
{
    public class DKVCartItem
    {
        public int ID { get; set; }
        public string TenHinhNen { get; set; }
        public string HinhAnh { get; set; }
        public int SoLuongMua { get; set; }
        public float DonGiaMua { get; set; }
        public float ThanhTien { get; set; }
    }
}