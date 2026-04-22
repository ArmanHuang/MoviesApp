# 🎬 Movie App (Flutter)

Aplikasi mobile berbasis Flutter yang menampilkan daftar film dari Public API dengan fitur pencarian, filter kategori, serta dukungan offline menggunakan caching.

---

# 📌 Deskripsi Proyek

Aplikasi ini dikembangkan sebagai bagian dari **Ujian Tengah Semester (UTS)** pada mata kuliah *Mobile Application Development (Flutter)*.

Fokus utama proyek ini adalah:

* Arsitektur aplikasi (modular)
* Integrasi API
* State management
* User Experience (UX)

---

# 🚀 Fitur Utama

## 1. 🔍 Search Movie

Pengguna dapat mencari film berdasarkan judul secara real-time menggunakan fitur pencarian.

---

## 2. 🎯 Filter Kategori

Pengguna dapat memfilter film berdasarkan kategori:

* Popular
* Top Rated
* Upcoming

---

## 3. 📦 Offline Caching

* Data film disimpan secara lokal menggunakan **SharedPreferences**
* Saat tidak ada koneksi internet:

  * Aplikasi tetap menampilkan data terakhir
  * Menampilkan indikator **Offline Mode**

---

## 4. ⚠️ Error Handling

* Menampilkan pesan user-friendly saat API gagal
* Menghindari error crash
* Menampilkan data cache sebagai fallback

---

## 5. ⏳ Loading State

Menggunakan **Loading Widget (CircularProgressIndicator / custom widget)** untuk memberikan pengalaman pengguna yang lebih smooth saat data dimuat.

---

## 6. ♻️ Reusable Widgets

Menggunakan komponen UI yang dapat digunakan kembali:

* `MovieCard`
* `LoadingWidget`

---

# 🏗️ Arsitektur & Struktur Folder

Aplikasi ini menggunakan **Modular Architecture** dengan pemisahan tanggung jawab:

```
lib/
│
├── models/        # Model data (Movie)
├── services/      # API Service (HTTP request)
├── providers/     # State management (Provider)
├── views/         # Halaman UI (HomePage, DetailPage)
├── widgets/       # Reusable components
```

---

# 🛠️ Teknologi yang Digunakan

* Flutter
* Dart
* Provider (State Management)
* HTTP Package (API Request)
* SharedPreferences (Offline Caching)

---

# ⚙️ Cara Kerja Aplikasi

1. Aplikasi mengambil data dari **Public Movie API (TMDB)**
2. Data ditampilkan dalam bentuk list film
3. Saat data berhasil diambil:

   * Data disimpan ke cache lokal
4. Jika offline:

   * Aplikasi mengambil data dari cache

---

## 👤 User dapat melakukan:

* 🔍 Search movie
* 🎯 Filter kategori
* 📱 Melihat detail film
* 📦 Mengakses data saat offline

---

# 🧠 Alasan Pemilihan State Management

Proyek ini menggunakan **Provider** karena:

* Mudah dipahami
* Ringan dan efisien
* Cocok untuk aplikasi skala kecil–menengah
* Memisahkan logic dan UI dengan jelas
* Mendukung reactive UI

---

# ▶️ Cara Menjalankan Project

```bash
git clone <https://github.com/username/movie_app.git>
cd movie_app
flutter pub get
flutter run
```

---

# 🧪 Testing Offline Mode

1. Jalankan aplikasi dalam kondisi online
2. Pastikan data sudah muncul
3. Matikan koneksi internet
4. Restart aplikasi
5. Aplikasi akan:

   * Menampilkan data terakhir
   * Menampilkan pesan **Offline Mode**

---

# 🎯 Penutup

Aplikasi ini dirancang untuk memberikan pengalaman pengguna yang optimal dengan:

* Struktur kode yang rapi
* Mudah dikembangkan (scalable)
* Responsif terhadap kondisi online/offline

