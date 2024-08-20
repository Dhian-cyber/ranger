import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scaffold_with_drawer.dart'; // Add this line to import the package

class MenuBaruScreen extends StatelessWidget {
  const MenuBaruScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return ScaffoldWithDrawer(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xFFB1D697), Color(0xFF8DB670)],
            stops: <double>[0, 1],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 106, 15, 148),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 70),
                child: Text(
                  'Welcome',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: const Color(0xFFFFE485),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0x33FFFCC0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(17, 32, 17, 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(9, 0, 0, 17),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Login!',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: const Color(0xFFFFE485),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Login dengan akun Google',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 1, 17),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x26FFFFFF),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const SizedBox(
                            width: 295,
                            height: 30,
                            child: Center(
                              child: Text('Google Sign-In Button Placeholder'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 1, 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 10, 3, 7),
                                child: const Divider(color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 2.7, 0),
                              child: Text(
                                'Atau',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 7),
                                child: const Divider(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(1, 0, 1, 1),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Email',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 1, 9),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x26FFFFFF),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: SizedBox(
                            width: 295,
                            height: 30,
                            child: TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Password',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 1, 22),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x26FFFFFF),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: SizedBox(
                            width: 295,
                            height: 30,
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(1, 0, 0, 6),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MenuBaruScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF698B51),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            textStyle: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 5.3, 0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Jika anda belum memiliki akun silahkan ',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(6.5, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Handle navigation to Register screen
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 2.3, 0),
                                        child: Text(
                                          'Register',
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: const Color(0xFF698B51),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'terlebih dahulu!',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Menu Baru'),
      ),
      activeRoute: '/menu-baru',
    );
  }
}
