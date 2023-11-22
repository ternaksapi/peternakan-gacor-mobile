Nama    : Muhammad Yusuf Haikal 
<br>
NPM     : 2206081490 
<br>

<details>
<summary> 
Tugas 7
</summary>

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
</details>

<br>
<details>
<summary>
Tugas 8
</summary>
 
 ## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
 - Method `Navigator.push()` menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna. 
 - Sementara, Method `Navigator.pushReplacement()` menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.
 - Contoh untuk penggunaan `Navigator.push()` adalah ketika kita ingin menampilkan tampilan login dari landing page. Kita masih ingin ketika pengguna menekan tombol kembali, pengguna kembali ke layar beranda yang sebelumnya dibuka. Sementara itu, kita menggunakan `Navigator.pushReplacement()` ketika pengguna berhasil login, kita menggunakan `Navigator.pushReplacement` agar ketika pengguna berhasil login, menekan tombol kembali tidak akan mengarahkan pengguna ke halaman login, melainkan he halaman beranda awal.

## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
1. Layout Widget Dengan Child Tunggal:
- Align: Align digunakan untuk mengatur tempat peletakan suatu child dalam area yang dimiliki oleh parent dari child.
- AspectRatio: AspectRatio, sesuai dengan namanya mengatur aspek ratio atau ratio antara lebar dan tinggi dari suatu child.
- Baseline: Digunakan untuk mengatur dimana kita ingin meletakkan dasar dari suatu child terhadap bagian atas suatu parent, dalam satuan pixel.
- Center: Mengatur tempat peletekan suatu child ditengah dari area parentnya
- ConstrainedBox: Memberikan batasan ukuran panjang dan lebar yang dapat ditempati oleh suatu child.
- Container: Memberikan sebuah container kepada suatu child yang, container memberikan beberapa properti tambahan yang dapat dimodifikasi terhadap child seperti margin, padding, warna, dan banyak lagi.
- CustomSingleChildLayout: Memindahkan layout suatu child kepada suatu perwakilan lain.
- Expanded: Memperluas suatu child dari Row, Column, atau Flex sehingga child yang menggunakan expended itu mengisi tempat yang tersedia.
- FittedBox: Mengatur ukuran suatu child sehingga child tersebut muat dalam suatu parent.
- FracionallySizedBox: Mengatur ukuran suatu child menjadi pecahan bagian dari tempat yang tersedia.
- IntrinsicHeight: Mengatur ukuran tinggi child menjadi ukuran panjang intrinsiknya
- IntrinsicWidth: Mengatur ukuran lebar child menjadi ukuran lebar intrinsiknya
- LimitedBox: Memberikan batasan ukuran kepada suatu child yang parentnya tidak memiliki batasan. Apabila parent dari child memiliki batasan, maka LimitedBox tidak memiliki pengaruh.
- Offstage: Menyembunyikan suatu child dari tampilan, namun dchild masih bagaikan ada di dalam tree.
- OverflowBox: Memberikan batasan kepada suatu child yang berbeda dari parentnya, sehingga memungkinkan child overflow dari parentnya.
- Padding: Memberikan jarak batas antara element dari child dengan batas atau element yang ada disekitar child
- SizedBox: Memberikan sebuah kotak terhadap suatu child yang dapat memiliki suatu panjang dan lebar tertentu, namun tetap mengikuti batasan ukuran yang dimiliki oleh parent.
- SizedOverflowBox: Widget suatu ukuran spesifik namun menurunkan batasan awalnya ke childnya, yang kemudian mungkin overflow.
- TransformClass: Menerapkan transform sebelum menampilkan child.

2. Layout Widget Dengan Child Ganda:
- Column: Menampilkan children secara vertikal (kolom)
- Flow: Mengatur tata letak children menggunakan matrix transformasi.
- GridView: Menampilkan child dalam bentuk grid yang dapat discroll
- IndexedStack: Stack yang menampilkan suatu child dari sebuah list children. Child ditampilkan menggunakan index yand diberikan.
- LayoutBuilder: Membuat sebuah widget tree yang bergantung pada ukuran widget parentnya. 
- ListView: Sebuah list yang dapat discroll yang diatur secara linear.
- Row: Menampilkan children secara horizontal (baris)
- Stack: Menempatkan children relatif terhadap sisi pinggiran dari kotaknya. Digunakan ketika ingin menumpuk beberapa children
- Table: Menampilkan children dalam layout tabel
- Wrap: Menyesuaikan posisi suatu child sesuai dengan tempat yang tersedia dan sesuai dengan axis yang diberikan

##  Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
- key: Digunakan untuk mengecek apakah form valid atau tidak
- TextFormField: Menyediakan field agar user dapat mengisi form. Selain itu, terdapat validator yang mengecek apakah input sudah sesuai dengan keinginan untuk form.

## Bagaimana penerapan clean architecture pada aplikasi Flutter?
Penerapan clean architecture dapat dilakukan dengan menerapkan  seperation of concerns. Pada Flutter, kita dapat memisahkan beberapa bagian kode yang memudahkan scaling, testing, dan secara keseluruhan mempermudah mantain aplikasi flutter. Contohnya pada aplikasi pada tugas, kita memisahkan antara tampilan utama (tampilan menu utama, tampilan form) dengan widget (drawer, shop card).

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

## Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:

1. Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
2. Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
 Setiap elemen input tidak boleh kosong.
 Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
- Pertama, kita membuat sebuah file baru untuk menyimpan modul form kita yang dinamakan `item_form.dart`.  Kita membuat class `ItemFormPage`, yang kemudian kita membuat `_ItemFormPageState` yang extend dari `State<ItemFormPage>`. Kita membuat variabel `formKey` dan variabel yang seusai dengan data input.
```
class _ItemFormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  ...
}
```
Selanjutnya, kita akan membuat sebuah Scaffold yang bodynya merupakan sebuah form. Form ini nanti akan diisi dengan 3 child TextFormField yang akan mengambil input dari user. Masing - masing input akan dinamakan sesuai dengan data yang diinginkan, yaitu nama, jumlah, dan deskripsi. Setiap terjadi perubahan pada isi `TextFormField`, `onChanged` akan mengubah variabel diawal sesuai dengan isi dari form field. Kemudian, kita menggunakan validator yang mengecek isi form apakah sudah sesuai dengan ketentuan data atau masih kosong.
``` 
child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
```
```
child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah",
                    labelText: "Jumlah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah harus berupa angka!";
                    }
                    return null;
                  },
                ),
```
```
child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
```

3. Memiliki sebuah tombol Save.
4. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
- Dalam Child dari `Form` yang mengatur tata letak yaitu `Column`, tambahkan child baru selain 3 `TextFormField` berupa `ElevatedButton`. Button ini akan kita masukkan kedalam `Padding` dan `Align`. Untuk memunculkan data, kita akan memodifikasi `onPressed` sehingga memunculkan sebuah dialog yang memunculkan data yang telah diisi menggunakan function `showDialog()`, dan kemudian mereturn `AlertDialog()`
```
...
Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade400),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Jumlah: $_amount'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                      _formKey.currentState!.reset();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ...
```

5. Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
 Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
 Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
 Ketika memiih opsi Tambah Item, maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

- Buat sebuah file baru yang untuk mengisi widget kita. File ini akan dinamakan `left_drawer.dart`. Drawer ini nantinya akan kita letakkan di `appBar` pada `Scaffold` kita di halaman utama. Karena kita ingin mengarahkan pengguna ke halaman utama dan halaman tambah item, kita akan mengimport kedua halaman tersebut terlebih dahulu.
```
import 'package:flutter/material.dart';
import 'package:peternakan_gacor/screens/menu.dart';
import 'package:peternakan_gacor/screens/item_form.dart';
```
- Kemudian, kita baru akan membangun drawer. Kita akan menggunakan widget `ListView`. Dalam `ListView` kita akan memiliki dua bagian, yaitu `DrawerHeader` dan routing yang akan menggunakan `ListTile`. Dalam `ListTile` ini nanti kita akan menampilkan masing - masing opsi yang akan kita tampilkan.
- Untuk header, kita akan menampilkan sebuah text dengan  menggunakan `Column` dan `Padding`. 
```
const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 66, 165, 245),
            ),
            child: Column(
              children: [
                Text(
                  'Peternakan Gacor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Mau barang hasil ternak? Peternakan Gacor Solusinya!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
```
- Untuk routing dan tombol, kita menggunakan `Icon` dan `Text` untuk menampilkan tombol. Selanjutnya, kita akan menggunakan `onTap()` sehingga ketika tombol ditekan, maka stack halaman akan kita ubah menggunakan `Navigation.pushReplacement()` Push replacement nanti kita akan sesuaikan dengan tombol yang ditekan.
```
ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
```
```
ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemFormPage(),
                  ));
            },
          ),
```

<details>
<summary>
Tugas 9
</summary>

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

- Bisa, kita dapat 