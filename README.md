Berikut adalah langkah-langkah instalasi aplikasi menggunakan bahasa pemrograman Dart dan Flutter untuk Siakad
Persiapan
    - Persiapan
Install Dart SDK dan Flutter SDK
Dart SDK: Dart SDK bisa diunduh dari dart.dev. Pilih versi yang sesuai dengan sistem operasi Anda (Windows, macOS, atau Linux).  versi Dart SDK yang diperlukan untuk menjalankan proyek Siakad yang telah kami buat  adalah  '>=3.1.3 <4.0.0'

-sedangkan untuk versi gradle   yang diperlukan untuk  proyek Siakad  adalah https://gradle.org/distributions/gradle-7.5-all.zip

    -Tambahkan Flutter ke Path
Ekstrak file Flutter SDK yang diunduh ke dalam direktori yang diinginkan.
Tambahkan lokasi Flutter SDK ke dalam path sistem:
 •Windows: Buka Command Prompt dan jalankan flutter/bin dari direktori Flutter.
 •macOS/Linux: Tambahkan export PATH="$PATH:pwd/flutter/bin" ke dalam file .bashrc, .bash_profile, atau .zshrc sesuai shell yang digunakan.

-Verifikasi Instalasi Flutter
Buka terminal atau command prompt, jalankan perintah berikut untuk memastikan Flutter terinstal dengan benar: flutter doctor Perintah ini akan menampilkan status instalasi Flutter dan memberitahu apakah ada komponen yang perlu diselesaikan.

    - Buka file pubspec.yaml.
 Navigasikan ke proyek Flutter Anda, dan buka file pubspec.yaml menggunakan text editor atau IDE seperti Visual Studio Code atau Android Studio.
-Tambahkan Dependensi yang Diperlukan
Di dalam file pubspec.yaml, tambahkan semua dependensi yang dibutuhkan oleh aplikasi Anda di bagian dependencies
    - Setelah menambahkan dependensi yang diperlukan, simpan file pubspec.yaml dan tekan Ctrl + S untuk menginstall semua paket yang tercantum. Atau Anda bisa menjalankan perintah berikut di terminal: flutter pub get
    
Menjalankan Aplikasi 
    - Buka File main.dart
Di dalam folder proyek Anda, navigasikan ke lib dan buka file main.dart. File ini biasanya berisi titik awal aplikasi Flutter Anda.
- Run dan Debug Aplikasi
Jalankan aplikasi dengan menggunakan perintah berikut di terminal: flutter run
Atau, jika menggunakan IDE, Anda bisa menggunakan fitur run dan debug langsung dari IDE (misalnya, tekan tombol Run atau Debug di Visual Studio Code atau Android Studio).

-Tunggu Hingga Aplikasi Terinstal
Proses ini mungkin memakan waktu beberapa menit tergantung pada spesifikasi sistem Anda dan apakah emulator atau perangkat fisik yang Anda gunakan.

-Mengatasi Masalah
Jika muncul masalah atau error, periksa pesan error yang muncul di terminal atau log debug. Pastikan semua dependensi terinstal dengan benar dan tidak ada konflik versi.

-Verifikasi dan Uji Aplikasi
Setelah aplikasi berjalan di emulator atau perangkat fisik, verifikasi semua fitur dan pastikan aplikasi berfungsi sesuai yang diharapkan.

Dengan langkah-langkah di atas, Anda akan dapat menginstal dan menjalankan aplikasi Flutter untuk Sistem Informasi Akademik (Siakad)Semoga  tutorial ini membantu dalam menginstal aplikasi menggunakan Dart dan Flutter untuk Siakad! 


(https://github.com/wawaikhlisa24/SIAKAD-SMA-MOBILE/assets/136337734/fde258d4-1fe8-4862-8370-a9bb05487012)
