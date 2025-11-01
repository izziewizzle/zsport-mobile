Nama    : Izzati Maharani Yusmananda<br>
NPM     : 2406361675<br>
Kelas   : PBP F<br>
Link    : [ZSPORT](https://izzati-maharani-zsport.pbp.cs.ui.ac.id/)

<details align="justify">
    <summary><b>Tugas 7</b></summary>

## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree pada Flutter adalah struktur hierarki yang menggambarkan susunan semua elemen UI di layar. Setiap tampilan terdiri dari kumpulan widget yang saling membungkus, mulai dari root (seperti MaterialApp) hingga widget kecil seperti teks atau tombol. Hubungan parent-child berarti widget induk mengatur tata letak dan perilaku widget anak di dalamnya. Misalnya, Scaffold menjadi parent dari Column, dan Column menjadi parent dari beberapa tombol. Struktur ini membuat Flutter mudah mengelola dan merender tampilan secara terorganisir.

## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
1. MaterialApp: Berfungsi sebagai kerangka utama aplikasi berbasis Material Design. Di sini saya mengatur judul aplikasi, tema warna (ThemeData/useMaterial3), dan menentukan halaman awal lewat properti home.
2. Scaffold: Menjadi struktur dasar halaman. Scaffold menyediakan bagian-bagian utama seperti AppBar, body, serta tempat untuk menampilkan SnackBar.
3. AppBar: Menampilkan judul aplikasi di bagian atas layar (“ZSPORT”).
4. SafeArea: Melindungi tampilan agar tidak tertutup oleh area notifikasi atau notch di layar ponsel.
5. Center: Memusatkan seluruh konten di tengah layar.
6. Padding: Memberikan jarak di sekeliling konten agar tampil lebih rapi dan tidak menempel ke tepi layar.
7. Column: Menyusun beberapa widget anak secara vertikal (dari atas ke bawah).
8. SizedBox: Memberi jarak antar elemen, seperti spasi di antara ketiga tombol utama.
9. FilledButton.icon: Membuat tombol dengan ikon dan teks di dalamnya. Saya menggunakan tiga tombol dengan warna berbeda: biru (All Products), hijau (My Products), dan merah (Create Product).
10. Icon: Menampilkan ikon kecil di dalam tombol (misalnya ikon toko, inventori, dan tambah produk).
11. Text: Menampilkan teks, seperti judul di AppBar dan label pada setiap tombol.
12. SnackBar: Menampilkan pesan notifikasi singkat di bagian bawah layar ketika tombol ditekan.
13. ScaffoldMessenger: Mengatur dan menampilkan SnackBar di dalam Scaffold aktif.

## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget MaterialApp berfungsi sebagai wadah utama aplikasi Flutter yang memakai gaya Material Design. Melalui widget ini, saya bisa mengatur hal-hal penting seperti judul aplikasi, tema warna, navigasi antar-halaman, dan menentukan halaman mana yang tampil pertama kali lewat properti home.

MaterialApp biasanya ditempatkan sebagai widget paling atas (root) karena semua elemen lain seperti Scaffold, AppBar, dan SnackBar butuh konteks dari widget ini supaya bisa bekerja dan menampilkan gaya Material Design dengan benar. Jadi, MaterialApp merupakan fondasi utama yang membuat seluruh tampilan aplikasi Flutter terlihat seragam dan berfungsi sesuai standar desain Material.

## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Perbedaan utama antara StatelessWidget dan StatefulWidget ada pada kemampuannya untuk berubah saat aplikasi berjalan.

StatelessWidget digunakan untuk tampilan yang tidak berubah—artinya, semua data dan UI-nya bersifat tetap selama widget tersebut aktif. Contohnya seperti teks statis, ikon, atau tombol yang hanya menampilkan aksi sederhana tanpa memengaruhi tampilan lainnya.

Sedangkan StatefulWidget digunakan untuk tampilan yang bisa berubah secara dinamis, misalnya karena interaksi pengguna, input data, animasi, atau perubahan nilai dari variabel tertentu. Widget jenis ini memiliki state (keadaan) yang bisa diperbarui dengan memanggil setState().

Dalam proyek ZSPORT, saya menggunakan StatelessWidget karena tampilan aplikasinya sederhana dan tidak memerlukan perubahan data saat berjalan. Kalau nanti aplikasinya butuh fitur yang interaktif atau data yang bisa berubah (seperti form input, counter, atau daftar produk yang bisa diperbarui), barulah saya akan menggunakan StatefulWidget.

## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang menyimpan informasi tentang posisi sebuah widget di dalam widget tree. Flutter menggunakan BuildContext untuk tahu di mana sebuah widget berada dan bagaimana ia berinteraksi dengan widget lain di sekitarnya.

BuildContext penting karena banyak fungsi di Flutter memerlukan konteks ini agar tahu “lingkungan” tempat widget tersebut berada. Misalnya, untuk menampilkan SnackBar, Flutter perlu tahu Scaffold mana yang aktif—dan informasi itu diambil dari BuildContext.

Dalam metode build, BuildContext digunakan sebagai parameter agar widget bisa mengakses data dari widget induknya, seperti tema, ukuran layar, atau navigasi. Contohnya di proyek ZSPORT, fungsi _showSnack membutuhkan BuildContext supaya bisa memanggil ScaffoldMessenger.of(context).showSnackBar(...) dan menampilkan pesan pada layar yang benar.

## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah fitur di Flutter yang memungkinkan pengembang melihat hasil perubahan kode secara langsung tanpa mengulang aplikasi dari awal. Saat hot reload dijalankan, Flutter hanya memperbarui bagian kode yang berubah dan mempertahankan state (keadaan) aplikasi sebelumnya. Misalnya, jika sedang di halaman tertentu dan mengganti warna tombol, hasilnya langsung terlihat tanpa kehilangan posisi halaman atau data yang sedang ditampilkan.

Sementara itu, hot restart akan menjalankan ulang seluruh aplikasi dari awal, sehingga semua state atau data yang tersimpan akan hilang. Hot restart digunakan jika perubahan yang dilakukan memengaruhi struktur utama aplikasi, seperti mengubah variabel global atau isi fungsi main().