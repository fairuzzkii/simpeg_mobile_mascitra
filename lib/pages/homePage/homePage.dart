import 'package:flutter/material.dart';
import '../navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDate = 'MON\n4';
  bool isAbsent = false;

  final List<Map<String, dynamic>> features = [
    {
      'title': 'Jam Masuk',
      'icon': Icons.login,
      'color': Color(0xFFD2691E),
    },
    {
      'title': 'Jam Pulang',
      'icon': Icons.schedule,
      'color': Color(0xFFD2691E),
    },
    {
      'title': 'Cuti',
      'icon': Icons.event_note,
      'color': Color(0xFFD2691E),
    },
    {
      'title': 'Kegiatan Harian',
      'icon': Icons.assignment,
      'color': Color(0xFFD2691E),
    },
    {
      'title': 'Riwayat Absensi',
      'icon': Icons.history,
      'color': Color(0xFFD2691E),
    },
    {
      'title': 'Penilaian',
      'icon': Icons.star,
      'color': Color(0xFFD2691E),
    },
  ];

  final List<Map<String, String>> weekDays = [
    {'day': 'MON', 'date': '4'},
    {'day': 'Tue', 'date': '5'},
    {'day': 'Wed', 'date': '6'},
    {'day': 'Thu', 'date': '7'},
    {'day': 'Fri', 'date': '8'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF8C42),
              Color(0xFFD2691E),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Topographic pattern background
            Positioned.fill(
              child: Image.asset(
                'assets/images/topographic_pattern.png',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.1),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Selamat Pagi',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              'Doraemon',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Feature grid
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1,
                              ),
                              itemCount: features.length,
                              itemBuilder: (context, index) {
                                final feature = features[index];
                                return GestureDetector(
                                  onTap: () {
                                    // Handle feature tap
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('${feature['title']} dipilih'),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: feature['color'].withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Icon(
                                            feature['icon'],
                                            color: feature['color'],
                                            size: 24,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          feature['title'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF2D2D2D),
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 32),
                            // Attendance section
                            const Text(
                              'Tanggal Absensi',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2D2D2D),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Week calendar
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: weekDays.map((day) {
                                final isSelected = selectedDate == '${day['day']}\n${day['date']}';
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDate = '${day['day']}\n${day['date']}';
                                    });
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: isSelected 
                                          ? const Color(0xFFD2691E) 
                                          : Colors.grey[100],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          day['day']!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: isSelected 
                                                ? Colors.white 
                                                : const Color(0xFF6B6B6B),
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          day['date']!,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: isSelected 
                                                ? Colors.white 
                                                : const Color(0xFF2D2D2D),
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 24),
                            // Attendance status
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF3E0),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: const Color(0xFFFFE0B2),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Status',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF6B6B6B),
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          isAbsent ? 'Sudah Absen' : 'Belum Absen',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF2D2D2D),
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isAbsent = !isAbsent;
                                      });
                                    },
                                    child: Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD2691E),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.fingerprint,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            // Notifications section
                            const Text(
                              'Pemberitahuan',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2D2D2D),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Notification card
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD2691E),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFD2691E).withOpacity(0.3),
                                    blurRadius: 15,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Lorem ipsum dolor sit amet',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Lorem ipsum dolor sit amet consectetur adipiscing elit. Duis mattis molestie tristique. Ut euismod diam non lorem facilisis.',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white70,
                                            height: 1.4,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 100), // Space for bottom navigation
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}