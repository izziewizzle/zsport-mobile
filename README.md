Nama    : Izzati Maharani Yusmananda<br>
NPM     : 2406361675<br>
Kelas   : PBP F<br>

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
</details>

<details align="justify">
    <summary><b>Tugas 8</b></summary>

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Pada Flutter, Navigator.push() menambahkan halaman baru di atas halaman sebelumnya sehingga pengguna masih bisa kembali, sedangkan Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru dan menghapus halaman lama dari tumpukan. Dalam aplikasi saya, Navigator.push() digunakan saat berpindah dari Halaman Utama ke Halaman Tambah Produk agar pengguna bisa kembali, sementara Navigator.pushReplacement() digunakan setelah produk disimpan agar pengguna langsung kembali ke beranda tanpa kembali ke form lama.

## Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Saya memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk menjaga struktur halaman yang konsisten di seluruh aplikasi. Scaffold menjadi kerangka utama setiap halaman, karena menyediakan struktur dasar seperti area untuk AppBar, body, dan Drawer. AppBar digunakan di bagian atas untuk menampilkan judul halaman dan menjaga tampilan tetap seragam antarhalaman. Sementara Drawer berfungsi sebagai menu navigasi samping yang berisi opsi menuju Halaman Utama dan Halaman Tambah Produk. Dengan menggabungkan ketiga widget ini, setiap halaman pada aplikasi memiliki tata letak dan navigasi yang konsisten, sehingga pengalaman pengguna menjadi lebih nyaman dan teratur.

## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Dalam desain antarmuka Flutter, penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView memberi fleksibilitas serta kenyamanan dalam menampilkan elemen form. Padding digunakan untuk memberikan jarak di sekitar elemen agar tampilan lebih rapi dan tidak menempel ke tepi layar. SingleChildScrollView dan ListView sama-sama memungkinkan halaman form bisa di-scroll, sehingga seluruh input tetap bisa diakses meski layar kecil atau keyboard muncul. Dalam aplikasi ZSPORT, saya menggunakan Padding di sekitar seluruh isi form agar tata letaknya nyaman dilihat, lalu membungkus elemen form di dalam ListView agar pengguna dapat menggulir ke bawah saat mengisi data seperti name, price, description, dan thumbnail. Kombinasi ini membuat form terlihat bersih, mudah dibaca, dan tetap responsif di berbagai ukuran layar.

## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Saya menyesuaikan warna tema aplikasi Football Shop (ZSPORT) dengan menggunakan properti ThemeData pada widget MaterialApp agar seluruh elemen memiliki tampilan yang konsisten dengan identitas brand. Dalam aplikasi ini, saya menggunakan colorSchemeSeed: Colors.green untuk menciptakan nuansa hijau yang identik dengan tema olahraga dan energi, sekaligus memberi kesan segar dan profesional. Warna tersebut otomatis memengaruhi elemen-elemen seperti tombol, AppBar, dan highlight di seluruh halaman, sehingga tidak perlu diatur satu per satu. Dengan cara ini, aplikasi memiliki gaya visual yang seragam, mudah dikenali, dan mencerminkan karakter brand toko secara keseluruhan.
</details>

<details align="justify">
    <summary><b>Tugas 9</b></summary>

## 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Model Dart diperlukan untuk memastikan bahwa data dari backend memiliki struktur yang konsisten dan aman ketika diproses oleh Flutter. Dengan model, setiap atribut memiliki tipe yang jelas sehingga kesalahan tipe data bisa terdeteksi sejak proses kompilasi, bukan saat aplikasi berjalan. Null-safety juga lebih terjamin karena setiap field dapat ditandai sebagai wajib atau opsional. Selain itu, penggunaan model membuat kode lebih mudah dirawat karena perubahan dalam struktur JSON hanya perlu diperbarui di satu tempat. Jika hanya bergantung pada Map<String, dynamic>, aplikasi lebih rentan terhadap kesalahan penulisan key, error tipe yang terlambat terdeteksi, dan struktur data yang tidak jelas.

## 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Package http berfungsi sebagai klien HTTP dasar yang dipakai untuk melakukan request seperti GET atau POST. Namun package ini tidak menyimpan atau mengelola cookie session sehingga tidak bisa dipakai langsung untuk autentikasi berbasis session Django. CookieRequest adalah wrapper HTTP yang dirancang khusus untuk integrasi Django. CookieRequest otomatis menyimpan dan mengirim cookie session, menyediakan fungsi login dan logout, dan mempermudah pengiriman data JSON. Perannya adalah memastikan komunikasi antara Flutter dan Django dapat berlangsung dengan autentikasi session.

## 3.  Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest menyimpan status login pengguna, termasuk cookie session yang diberikan Django. Karena seluruh bagian aplikasi membutuhkan data ini untuk mengakses endpoint yang membutuhkan autentikasi, maka instance CookieRequest harus dibagikan ke setiap halaman. Jika tiap halaman membuat instance sendiri, session tidak akan konsisten dan pengguna selalu dianggap belum login. Dengan Provider, semua halaman menerima instance yang sama dan session berlangsung dengan benar.

## 4.  Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Flutter hanya bisa berkomunikasi dengan Django jika Django mengizinkan alamat Flutter dalam ALLOWED_HOSTS. Penambahan alamat 10.0.2.2 diperlukan karena emulator Android menggunakan alamat tersebut untuk mengakses localhost komputer. CORS harus diaktifkan agar Django mengizinkan request dari origin yang berbeda. Pengaturan SameSite, CSRF, dan cookie secure diperlukan supaya session Django dapat dikirim dan dikenali kembali oleh aplikasi Flutter, terutama pada browser atau emulator. Flutter juga perlu izin akses internet di Android supaya aplikasi dapat melakukan request jaringan. Jika konfigurasi ini tidak dilakukan, request dari Flutter akan diblokir, session tidak akan terkirim, login tidak akan bekerja, atau endpoint tidak bisa diakses sama sekali.

## 5.  Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Pengguna mengisi form di Flutter. Flutter kemudian mengirim data tersebut dalam bentuk POST ke Django melalui CookieRequest. Django menerima data tersebut, memvalidasinya, melakukan operasi yang diperlukan seperti menambah data ke database, lalu mengirim kembali respons dalam bentuk JSON. Flutter menerima JSON tersebut, mengonversinya menjadi objek model Dart, kemudian memanfaatkan objek tersebut untuk diperlihatkan pada UI. Seluruh alur berjalan dua arah antara input pengguna, server, dan tampilan akhir.

## 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Pada proses register, Flutter mengirim username dan password ke endpoint Django. Django melakukan validasi dan membuat akun baru. Setelah berhasil, Flutter mengarahkan pengguna ke login. Saat login, Flutter mengirim kredensial ke endpoint login Django melalui CookieRequest. Django memeriksa kecocokan username dan password. Jika valid, Django membuat session dan memberikan cookie session kepada Flutter. CookieRequest menyimpan cookie tersebut sehingga pada request berikutnya pengguna dianggap sudah login. Logout dilakukan dengan memanggil endpoint logout Django, Django menghapus session, CookieRequest menghapus cookie, dan Flutter kembali ke halaman login. Seluruh mekanisme ini memastikan bahwa session yang dikelola Django sinkron dengan state di Flutter.

## 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Langkah pertama yang saya lakukan adalah memastikan bahwa Django telah berhasil dideploy dan endpoint JSON dapat diakses oleh Flutter tanpa error. Setelah itu, saya membangun fitur registrasi di Flutter melalui form sederhana yang mengirim data ke Django menggunakan postJson. Selanjutnya, saya membuat halaman login yang terhubung dengan Django melalui CookieRequest sehingga session dapat disimpan setelah autentikasi berhasil. Untuk menjaga konsistensi session di seluruh aplikasi, instance CookieRequest dibagikan menggunakan Provider sehingga semua halaman dapat mengakses status login yang sama.

Setelah autentikasi berfungsi, saya membuat model Dart berdasarkan struktur JSON dari Django agar proses parsing data lebih aman dan terorganisir. Model ini kemudian digunakan dalam pembuatan halaman daftar item yang mengambil data dari endpoint JSON menggunakan FutureBuilder. Saya juga menambahkan halaman detail untuk menampilkan seluruh atribut dari item yang dipilih beserta tombol kembali untuk navigasi. Terakhir, saya mengimplementasikan filter item berdasarkan pengguna yang sedang login dengan memanfaatkan username yang disimpan dalam CookieRequest, sehingga hanya item milik pengguna tersebut yang muncul pada halaman My Products.
</details>