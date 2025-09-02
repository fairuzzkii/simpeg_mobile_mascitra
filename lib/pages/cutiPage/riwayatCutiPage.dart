import 'package:flutter/material.dart';
import 'package:simpeg_mascitra_mobile/pages/cutiPage/pengajuanCutiPage.dart';

class RiwayatCutiPage extends StatefulWidget {
  const RiwayatCutiPage({super.key});

  @override
  State<RiwayatCutiPage> createState() => _RiwayatCutiPageState();
}

class _RiwayatCutiPageState extends State<RiwayatCutiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top + 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Grey.png',
                ), // Background orange dengan lorek putih
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Riwayat Cuti',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.calendar_today,
                          color: Color(0xFFC64304),
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Filter Absensi',
                                  style: TextStyle(
                                    color: Color(0xFFC64304),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 8),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Pilih Tanggal',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Tidak Ada Data',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey[400],
                        size: 20,
                      ),
                    ],
                  ),
                ),

                // Scrollable Content Area
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        // Card Riwayat Cuti
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header tanggal
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color(0xFFC64304),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  '23 July 2025-24 July 2025',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              // Detail content
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildDetailRow(
                                      'Status Pengajuan',
                                      'Menunggu',
                                    ),
                                    _buildDetailRow(
                                      'Jenis Cuti',
                                      'Lorem ipsum dolor sit amet',
                                    ),
                                    _buildDetailRow(
                                      'Alasan Cuti',
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod felis vel sapien tristique, vel venenatis sapien lacinia. Vestibulum et egestas urna. Mauris sed augue luctus, interdum nisl in, lobortis nulla.',
                                    ),
                                    _buildDetailRow(
                                      'Catatan Cuti (Opsional)',
                                      'Lorem ipsum dolor sit amet',
                                    ),
                                    _buildDetailRow(
                                      'Alamat Selama Menjalankan Cuti',
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod felis vel sapien tristique, vel venenatis sapien lacinia. Vestibulum et egestas urna. Mauris sed augue luctus, interdum nisl in, lobortis nulla.',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Tambahan items untuk testing scroll
                        ...List.generate(
                          5,
                          (index) => Container(
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC64304),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    '${25 + index} July 2025-${26 + index} July 2025',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildDetailRow(
                                        'Status Pengajuan',
                                        'Menunggu',
                                      ),
                                      _buildDetailRow(
                                        'Jenis Cuti',
                                        'Lorem ipsum dolor sit amet',
                                      ),
                                      _buildDetailRow(
                                        'Alasan Cuti',
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod felis vel sapien tristique, vel venenatis sapien lacinia. Vestibulum et egestas urna. Mauris sed augue luctus, interdum nisl in, lobortis nulla.',
                                      ),
                                      _buildDetailRow(
                                        'Catatan Cuti (Opsional)',
                                        'Lorem ipsum dolor sit amet',
                                      ),
                                      _buildDetailRow(
                                        'Alamat Selama Menjalankan Cuti',
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod felis vel sapien tristique, vel venenatis sapien lacinia. Vestibulum et egestas urna. Mauris sed augue luctus, interdum nisl in, lobortis nulla.',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Spacing untuk bottom button
                        SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Button Fixed
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PengajuanCutiPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFC64304),
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              'Tambah Pengajuan Cuti',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        SizedBox(height: 4),
        Text(value, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    ),
  );
}
