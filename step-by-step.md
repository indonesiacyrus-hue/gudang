# Panduan Menjalankan Aplikasi di Laptop Lain Menggunakan XAMPP

Berikut adalah langkah-langkah untuk menjalankan aplikasi ini di komputer/laptop lain yang menggunakan **XAMPP** (tanpa Docker).

## 1. Persiapan File

1. _Copy_ (salin) seluruh folder project ini (`unindra` atau nama folder yang Anda gunakan) ke flashdisk atau arsipkan dalam format `.zip`.
2. Di laptop tujuan, buka folder instalasi XAMPP, lalu masuk ke dalam folder **`htdocs`** (Biasanya ada di `C:\xampp\htdocs\` untuk Windows atau `/Applications/XAMPP/htdocs/` untuk Mac).
3. _Paste_ (tempel) folder project tersebut di dalam folder `htdocs`. Pastikan nama foldernya tidak mengandung spasi, contohnya: `C:\xampp\htdocs\unindra`.

## 2. Setup Database via phpMyAdmin

1. Buka aplikasi **XAMPP Control Panel** di laptop tujuan.
2. Klik tombol **Start** pada modul **Apache** dan **MySQL**.
3. Buka web browser (Chrome, Firefox, Safari) dan akses alamat: `http://localhost/phpmyadmin`
4. Di panel sebelah kiri, klik tulisan **New** (Baru) untuk membuat database baru.
5. Masukkan **`unindra`** sebagai nama database, lalu klik tombol **Create** (Buat).
6. Setelah database `unindra` berhasil dibuat dan terpilih, klik menu/tab **Import** yang ada di bagian atas.
7. Klik **Choose File** (Pilih File), lalu cari file **`unindra.sql`** yang ada di dalam folder project Anda.
8. Scroll ke bagian paling bawah lalu klik tombol **Go** (Kirim) dan tunggu hingga proses import berhasil (ditandai dengan pesan sukses berwarna hijau).

## 3. Konfigurasi Password Database (PENTING!)

Secara _default_, MySQL bawaan XAMPP di Windows menggunakan username **`root`** dan password **kosong** (tanpa password).

Jika Anda gagal login ke database atau muncul tulisan "Access denied", Anda perlu menyesuaikan passwordnya:

1. Buka file konfigurasi database di text editor (seperti VSCode, Notepad++, atau Sublime):
   `application/config/database.php`
2. Cari baris **nomor 8** atau baris yang bertuliskan:
   ```php
   $db['default']['password'] = 'root';
   ```
3. Ubah tulisan `'root'` menjadi kosong jika XAMPP Anda tidak menggunakan password, seperti ini:
   ```php
   $db['default']['password'] = '';
   ```
4. Simpan (_Save_) file tersebut.

## 4. Konfigurasi Base URL (Opsional)

Aplikasi ini sudah diprogram agar bisa mendeteksi _Base URL_ secara otomatis (lihat file `application/config/config.php` baris ke-26).
Namun, jika tampilan web terlihat rusak (CSS/Gambar tidak muncul) saat dibuka melalui XAMPP, pastikan Anda menyesuaikan _fallback_ URL-nya sesuai nama folder Anda di `htdocs`.
Contoh:

```php
$config['base_url'] = getenv('BASE_URL') ?: 'http://localhost/unindra/';
```

_(Ganti `unindra` dengan nama folder tempat Anda menaruh project di `htdocs`)._

## 5. Jalankan Aplikasi

Jika semua langkah di atas sudah dilakukan, Anda tinggal membuka aplikasi melalui browser:
👉 **http://localhost/unindra/** (sesuaikan `unindra` dengan nama folder Anda).

Aplikasi sudah siap digunakan dengan data terbaru dari database `unindra`!
