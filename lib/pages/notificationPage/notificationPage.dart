import 'package:flutter/material.dart';
import '../navbar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'description': 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Duis mattis molestie tristique. Ut euismod diam non lorem facilisis. Vestibulum et egesta urna. Mauris sed augue luctus, interdum nisl in, lobortis',
        'date': '22 Juli 2025',
        'isRead': false,
      },
      {
        'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'description': 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Duis mattis molestie tristique. Ut euismod diam non lorem facilisis. Vestibulum et egesta urna. Mauris sed augue luctus, interdum nisl in, lobortis',
        'date': '22 Juli 2025',
        'isRead': true,
      },
    ];

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
                    child: const Text(
                      'Pemberitahuan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(24),
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          final notification = notifications[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: _buildNotificationCard(
                              title: notification['title'],
                              description: notification['description'],
                              date: notification['date'],
                              isRead: notification['isRead'],
                              onTap: () {
                                // Handle notification tap
                                _showNotificationDetail(context, notification);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String description,
    required String date,
    required bool isRead,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isRead ? FontWeight.w500 : FontWeight.w600,
                      color: isRead ? const Color(0xFF6B6B6B) : const Color(0xFF2D2D2D),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (!isRead)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD2691E),
                      shape: BoxShape.circle,
                    ),
                  ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF9E9E9E),
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B6B6B),
                height: 1.4,
                fontFamily: 'Poppins',
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF9E9E9E),
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNotificationDetail(BuildContext context, Map<String, dynamic> notification) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        notification['title'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D2D2D),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notification['date'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9E9E9E),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        notification['description'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6B6B6B),
                          height: 1.5,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}