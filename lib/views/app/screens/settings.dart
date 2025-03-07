import 'package:flutter/material.dart';
import 'package:riwaya/utils/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
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
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Account',
            [
              _buildSettingTile(
                icon: Icons.person_outline,
                title: 'Profile',
                subtitle: 'Manage your account information',
              ),
              _buildSettingTile(
                icon: Icons.location_on_outlined,
                title: 'Delivery Address',
                subtitle: 'Manage your delivery locations',
              ),
              _buildSettingTile(
                icon: Icons.payment_outlined,
                title: 'Payment Methods',
                subtitle: 'Manage your payment options',
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            'Preferences',
            [
              _buildSettingTile(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                subtitle: 'Manage your notification preferences',
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: firstColor,
                ),
              ),
              _buildSettingTile(
                icon: Icons.language_outlined,
                title: 'Language',
                subtitle: 'English (US)',
              ),
              _buildSettingTile(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                subtitle: 'Toggle app theme',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                  activeColor: firstColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            'About',
            [
              _buildSettingTile(
                icon: Icons.info_outline,
                title: 'About Riwaya',
                subtitle: 'Learn more about us',
              ),
              _buildSettingTile(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                subtitle: 'Read our privacy policy',
              ),
              _buildSettingTile(
                icon: Icons.description_outlined,
                title: 'Terms of Service',
                subtitle: 'Read our terms of service',
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              padding: const EdgeInsets.all(16),
            ),
            child: const Text(
              'Sign Out',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
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
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: firstColor),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 12,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
