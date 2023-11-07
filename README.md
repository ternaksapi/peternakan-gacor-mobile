# Tugas 7

Nama    : Muhammad Yusuf Haikal <br>
NPM     : 2206081490

## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

- Stateless widget, sepertinya namanya bersifat stateless. Artinya, widget tidadk memiliki properti yang dapat berubah. Ketika sebuah stateless widget dibuat, widget tersebt tidak akan berubah dan akan tetap seperti bentuk awalnya sampai kapanpun. Stateful widget digunakan untuk menampilkan informasi yang bersifat statik atau tidak berubah, seperti text, icon, dan sebagainya.
<br>
<br>

- Stateful widget digunakan ketika state widget dapat berubah dalam  penggunaannya. Widget dapat berubah atau mengalami rebuild sesuai dengan perubahan yang dialami. 

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

- `MyHomePage` : Halaman utama aplikasi.
- `Scaffold` : Struktur dasar halaman utama yang terdiri dari `appBar` dan `body`
- `Text` : Menampilkan text pada aplikasi
- `SingleChildScrollView` : Widget yang bersifat scrollable ketika konten yang terdapat dalam halaman melebihi layar
- `Container` : Menampung widget umum lainnya seperti padding, column, margin, dst.
- `Padding` : Menyediakan padding sekitar widget
- `Column` : Mengatur konten secara vertikal (kolom)
- `GridView.count` : Layout grid dengan jumlah kolom yang telah ditentukan
- `ShopItem` : Menyediakan item pada aplikasi yang memiliki atribut nama dan icon.
- `ShopCard` : Menyediakan card dengan nama dari item dan iconnya.
- `InkWell` : Area yang merespon terhadap event sentuhan
- `Icon` : Menampilkan icon
- `SnackBar` : Menampilkan pesan di bawah layar yang tampil sesuai dengan aksi pengguna
- `MyApp` : Aplikasi utama dari proyek

##  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

### Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
- Buat directori untuk proyek. Dalam direktori ini, buka command prompt lalu jalankan `flutter create peternakan_gacor` lalu masuk ke direktori dengan `cd peternakan_gacor`

### Membuat tiga tombol sederhana dengan ikon dan teks untuk
- Melihat daftar item (Lihat Item); 
- Menambah item (Tambah Item); 
- Logout (Logout)
<br> 

Sebelumnya, kita ingin menerapkan clean architecture dalam proyek ini. Buat file `menu.dart` dalam `peternakan_gacor/lib`. Disini akan menjadi tempat untuk kita mengembangkan halaman utama aplikasi. Untuk membuat tombol ini, kita akan membuat widget ShopCard. ShopCard ini akan mengambil item `ShopItem` yang memiliki atribut nama dan icon
```
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
``` 
dan membentuk card yang menampilkan keduanya. 
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue.shade200,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
``````

Selanjutnya, kita membuat 3 instance `ShopItem`, yaitu masing - masing untuk lihat item, menambah item, dan logout. Kemudian 
kita masukkan instance kedalam list 
```
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist),
        ShopItem("Tambah Item", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];
```
Terakhir, dalam widget utama kita `MyHomePage`, kita akan membuat Grid Layout didalam body Scaffold untuk menampilkan card yang telah kita buat.
```
GridView.count(
                // `Container` pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
```

### Memunculkan Snackbar dengan tulisan:
- "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
- "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
- "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

Dalam `ShopCard`, kita tambahkan baigan `Inkwell`pada `Material`. `Inkwell` ini yang akan merespon kepada respon sentuhan user. Buat agar ketika tombol ditekan, makan muncul pesan "Kamu telah menekan tombol {nama item}!" 
```
...``
Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        ...
```