import 'package:flutter/material.dart';

class Konfirmasipage extends StatelessWidget {
  const Konfirmasipage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(199, 67, 3, 1),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 100,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pengajuan cuti telah terkirim',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
