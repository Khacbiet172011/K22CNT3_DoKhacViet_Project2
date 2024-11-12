using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using K22CNT3_DoKhacViet_Project2.Models;

namespace K22CNT3_DoKhacViet_Project2.Controllers
{
    public class DKV_HINH_NENController : Controller
    {
        private DKVDbEntities db = new DKVDbEntities();

        // GET: DKV_HINH_NEN
        public ActionResult Index()
        {
            var hINH_NEN = db.HINH_NEN.Include(h => h.LOAI_HINH_NEN);
            return View(hINH_NEN.ToList());
        }

        // GET: DKV_HINH_NEN/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HINH_NEN hINH_NEN = db.HINH_NEN.Find(id);
            if (hINH_NEN == null)
            {
                return HttpNotFound();
            }
            return View(hINH_NEN);
        }

        // GET: DKV_HINH_NEN/Create
        public ActionResult Create()
        {
            ViewBag.MaLoai = new SelectList(db.LOAI_HINH_NEN, "ID", "MaLoai");
            return View();
        }

        // POST: DKV_HINH_NEN/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,MaHinhNen,TenHinhNen,HinhAnh,SoLuong,DonGia,MaLoai,TrangThai")] HINH_NEN hINH_NEN)
        {
            if (ModelState.IsValid)
            {
                db.HINH_NEN.Add(hINH_NEN);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLoai = new SelectList(db.LOAI_HINH_NEN, "ID", "MaLoai", hINH_NEN.MaLoai);
            return View(hINH_NEN);
        }

        // GET: DKV_HINH_NEN/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HINH_NEN hINH_NEN = db.HINH_NEN.Find(id);
            if (hINH_NEN == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoai = new SelectList(db.LOAI_HINH_NEN, "ID", "MaLoai", hINH_NEN.MaLoai);
            return View(hINH_NEN);
        }

        // POST: DKV_HINH_NEN/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,MaHinhNen,TenHinhNen,HinhAnh,SoLuong,DonGia,MaLoai,TrangThai")] HINH_NEN hINH_NEN)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hINH_NEN).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaLoai = new SelectList(db.LOAI_HINH_NEN, "ID", "MaLoai", hINH_NEN.MaLoai);
            return View(hINH_NEN);
        }

        // GET: DKV_HINH_NEN/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HINH_NEN hINH_NEN = db.HINH_NEN.Find(id);
            if (hINH_NEN == null)
            {
                return HttpNotFound();
            }
            return View(hINH_NEN);
        }

        // POST: DKV_HINH_NEN/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HINH_NEN hINH_NEN = db.HINH_NEN.Find(id);
            db.HINH_NEN.Remove(hINH_NEN);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
