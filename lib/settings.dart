import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true; // Default value for the switch
  bool updatesEnabled = true; // Default value for the switch
  bool darkMode = false; // Dark mode off by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      appBar: AppBar(
        backgroundColor: Colors.white, // Match the white background
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back.png', // Back arrow image
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings', style: TextStyle(color: Colors.black, fontSize: 20)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            // Accounts Section
            ListTile(
              leading: Image.asset(
                'assets/images/account.png', // Image for Accounts
                width: 30,
                height: 30,
              ),
              title: Text('Accounts', style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            _buildSettingItem('Edit profile'),
            _buildSettingItem('Change password'),
            _buildSettingItem('Privacy'),

            const SizedBox(height: 30),

            // Notifications Section
            ListTile(
              leading: Image.asset(
                'assets/images/bell.png', // Image for Notifications
                width: 30,
                height: 30,
              ),
              title: Text('Notifications', style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            _buildSwitchTile('Notifications', notificationsEnabled, (value) {
              setState(() {
                notificationsEnabled = value;
              });
            }),
            _buildSwitchTile('Updates', updatesEnabled, (value) {
              setState(() {
                updatesEnabled = value;
              });
            }),

            const SizedBox(height: 30),

            // Others Section
            ListTile(
              leading: Image.asset(
                'assets/images/other.png', // Image for Others
                width: 30,
                height: 30,
              ),
              title: Text('Others', style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dark mode'),
                  Text(darkMode ? 'on' : 'off', style: TextStyle(color: darkMode ? Colors.green : Colors.red, fontSize: 16)),
                ],
              ),
              onTap: () {
                setState(() {
                  darkMode = !darkMode; // Toggle dark mode
                });
              },
            ),
            _buildSettingItem('Language'),
            _buildSettingItem('Region'),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: () {
        // Add tap logic here if needed
      },
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.green, // Green switch when enabled
      ),
    );
  }
}
