import 'package:flutter/material.dart';
import 'package:simpeg_mascitra_mobile/pages/kegiatanPage/konfirmasiPage.dart';
import 'package:simpeg_mascitra_mobile/widgets/appbar.dart';
import 'package:simpeg_mascitra_mobile/widgets/formfield.dart';
import 'package:simpeg_mascitra_mobile/widgets/primarybutton.dart';

class Kegiatanpage extends StatefulWidget {
  const Kegiatanpage({Key? key}) : super(key: key);

  @override
  State<Kegiatanpage> createState() =>
      _DailiesActivitiesScreenState();
}

class _DailiesActivitiesScreenState extends State<Kegiatanpage> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFF0742E), // Warna utama kalender
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFF0742E),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String datePlaceholder = _selectedDate != null
        ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
        : "Pilih Tanggal";

    return Scaffold(
      appBar: const customAppBar(title: 'Dailies Activities', showBackButton: false),
      backgroundColor: const Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kegiatan Harian',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormfieldWidget(
                    label: 'Tanggal Kegiatan',
                    placeholder: datePlaceholder,
                    isDatePicker: true,
                    onTap: () => _selectDate(context),
                  ),
                  const SizedBox(height: 16),
                  const FormfieldWidget(
                    label: 'Deskripsi Kegiatan',
                    placeholder: 'Write Here',
                  ),
                  const SizedBox(height: 16),
                  const FormfieldWidget(
                    label: 'Target Kegiatan',
                    placeholder: 'Write Here',
                  ),
                  const SizedBox(height: 16),
                  const FormfieldWidget(
                    label: 'Realisasi Kegiatan',
                    placeholder: 'Write Here',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'Send',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Konfirmasipage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
