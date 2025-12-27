import 'package:flutter/material.dart';

import '../Widgets/AppColorOptions.dart';
import '../Widgets/Autolock.dart';
import '../Widgets/ProfileRowItems.dart';
import '../Widgets/ReminderWidget.dart';
import '../Widgets/SettingsWrapper.dart' hide appColorOptions;

class Miniparentsettings extends StatefulWidget {
  const Miniparentsettings({super.key});

  @override
  State<Miniparentsettings> createState() => _MiniparentsettingsState();
}

class _MiniparentsettingsState extends State<Miniparentsettings> {
  bool goalreminder = false;
  bool savespend = false;
  bool rounddown = false;
  bool darklighttheme = false;
  bool fingerprint = false;



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, screenHeight * 0.06, 16, 16),
            color: theme.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Settings",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight *0.02),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: screenHeight*0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                            "Themes",
                            style: Theme.of(context).textTheme.titleSmall

                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: screenHeight*0.02),
                  ReminderWidget(
                    title: "Themes",
                    value: SettingsPageWrapper.of(context)?.themeMode == ThemeMode.dark,
                    onChanged: (val) {
                      SettingsPageWrapper.of(context)?.toggleTheme(val);
                    },
                    trailingIcon: Icons.color_lens,

                  ),
                  SizedBox(height: screenHeight*0.02),

                  Profilerowitems(
                    title: "App Color",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.invert_colors,
                    onTap: () {
                      final wrapper = SettingsPageWrapper.of(context);
                      _showColorPicker(context, wrapper);
                    },
                  ),

                  SizedBox(height: screenHeight*0.02),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                            "Privacy and Security",
                            style: Theme.of(context).textTheme.titleSmall

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight*0.02),
                  ReminderWidget(
                    title: "Enable Fingerprint",
                    value:fingerprint ,
                    onChanged: (val) {
                      setState(() {
                        fingerprint = val;
                      });
                    },
                    trailingIcon: Icons.fingerprint,

                  ),
                  SizedBox(height: screenHeight*0.02),
                  AutoLockRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showColorPicker(BuildContext context, SettingsPageWrapper wrapper) {
    final wrapper = SettingsPageWrapper.of(context);

    final selectedColor = wrapper.appColor;

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
        builder: (_) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6, // limit height
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // HEADER...

                      // COLOR LIST
                      ...appColorOptions.map((option) {
                        final isSelected = option.color == selectedColor;
                        return InkWell(
                          onTap: () {
                            wrapper.changeAppColor(option.color, scheme: option.scheme);
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                CircleAvatar(radius: 16, backgroundColor: option.color),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    option.name,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  Icon(Icons.check_circle,
                                      color: Theme.of(context).colorScheme.primary, size: 20),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

}