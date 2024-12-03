import 'package:flutter/material.dart';
import 'homepage.dart'; // Pastikan ini adalah import halaman HomePage

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false; // Status checkbox (true or false)
  bool _obscurePassword =
      true; // Status untuk menyembunyikan/menampilkan password

  @override
  void dispose() {
    // Pastikan untuk membersihkan controller saat widget dibuang
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlue, // Biru di atas
                Colors.white, // Putih di bawah
              ],
            ),
          ),
          alignment: Alignment.center, // Menempatkan gambar di tengah
          child: Image.asset(
            'assets/l.png',
            fit: BoxFit.cover,
          ), // Tidak perlu widget tambahan di sini
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar dengan Gradien

              const SizedBox(height: 20),
              // Judul halaman
              const Text(
                'Hai Moviegoers!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sudah siap merasakan pengalaman menonton yang tidak terlupakan?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              // Label Email
              const Text(
                'Email or WhatsApp Number',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              // Input Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Masukkan Email Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Label Password
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              // Input Password dengan ikon mata
              TextField(
                controller: passwordController,
                obscureText:
                    _obscurePassword, // Kontrol untuk menyembunyikan/menampilkan password
                decoration: InputDecoration(
                  labelText: 'Masukkan Password Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword =
                            !_obscurePassword; // Mengubah status password
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Checkbox untuk syarat dan ketentuan
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Ya, saya menerima syarat dan ketentuan yang berlaku.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Forgot Password dan Tombol Login
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(), // Spacer untuk rata kiri
                  GestureDetector(
                    onTap: () {
                      // Tambahkan aksi untuk forgot password
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isChecked
                      ? () {
                          // Menambahkan aksi login dan navigasi ke halaman HomePage jika checkbox tercentang
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      : null, // Tombol dinonaktifkan jika checkbox belum dicentang
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor:
                        const Color.fromRGBO(24, 30, 115, 1), // Warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Warna teks tombol
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Teks "Belum punya akun? Daftar di sini"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum punya akun?',
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Tambahkan aksi untuk navigasi ke halaman pendaftaran
                    },
                    child: const Text(
                      ' Daftar di sini',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
