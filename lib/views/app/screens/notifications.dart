import 'package:flutter/material.dart';
import 'package:riwaya/utils/constants/colors.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark all as read',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationGroup('Today', [
            _buildNotification(
              icon: Icons.local_shipping_outlined,
              title: 'Your order is on the way!',
              message: 'Order #1234 is being delivered. Track your order here.',
              time: '2 hours ago',
              isUnread: true,
            ),
            _buildNotification(
              icon: Icons.check_circle_outline,
              title: 'Order Confirmed',
              message:
                  'Your order #1234 has been confirmed and is being prepared.',
              time: '5 hours ago',
              isUnread: true,
            ),
          ]),
          const SizedBox(height: 24),
          _buildNotificationGroup('Yesterday', [
            _buildNotification(
              icon: Icons.coffee_outlined,
              title: 'Special Offer!',
              message: 'Get 20% off on all hot beverages today!',
              time: '1 day ago',
            ),
            _buildNotification(
              icon: Icons.star_outline,
              title: 'Rate your experience',
              message: 'How was your Cappuccino? Share your feedback!',
              time: '1 day ago',
            ),
          ]),
          const SizedBox(height: 24),
          _buildNotificationGroup('This Week', [
            _buildNotification(
              icon: Icons.card_giftcard_outlined,
              title: 'Birthday Reward!',
              message:
                  'Claim your free birthday drink at any of our locations.',
              time: '3 days ago',
            ),
            _buildNotification(
              icon: Icons.loyalty_outlined,
              title: 'Loyalty Points Update',
              message: 'You\'ve earned 50 points from your last purchase!',
              time: '5 days ago',
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildNotificationGroup(String title, List<Widget> notifications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(children: notifications),
        ),
      ],
    );
  }

  Widget _buildNotification({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    bool isUnread = false,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isUnread ? firstColor : Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isUnread ? Colors.white : Colors.grey.shade600,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 11,
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
