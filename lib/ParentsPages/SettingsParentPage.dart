import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Routes/routes.dart';
import '../Widgets/BalanceCardWidget.dart';
import '../Widgets/InviteFriends.dart';
import '../Widgets/ProfileRowItems.dart';

class Settingsparentpage extends StatefulWidget {
  const Settingsparentpage({super.key});

  @override
  State<Settingsparentpage> createState() => _SettingsparentpageState();
}

class _SettingsparentpageState extends State<Settingsparentpage> {
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: theme.primaryColor),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.06),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                GestureDetector(
                  onTap:(){
                    Navigator.of(context).pop();
      },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20,
                  ),
                ),

                SizedBox(width: screenWidth * 0.03), // 👈 horizontal spacing

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center, // 👈 vertical centering
                  children: [
                    Text(
                      "NYAMAWI JIMMY GAMBO",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "ShuleOne Academy",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  BalanceCardWidget(),
                  SizedBox(height: screenHeight * 0.02),
                  InviteFriends(),
                  SizedBox(height: screenHeight * 0.02),
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
                          "Account",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Profilerowitems(
                    title: "Setting",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.settings,
                    onTap: () {
                      Navigator.pushNamed(context,RouteHelper.miniparentsettings);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Profilerowitems(
                    title: "Education Information",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.people_outline,
                    onTap: () {
                      // Navigator.pushNamed(context, RouteHelper.nextofkin);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Profilerowitems(
                    title: "Personal Details",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.person_pin,
                    onTap: () {},
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Profilerowitems(
                    title: "Parents/Guardians Details",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.person_pin,
                    onTap: () {},
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Profilerowitems(
                    title: "Other Student Details",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.person_pin,
                    onTap: () {},
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Profilerowitems(
                    title: "Additional Information",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.person_pin,
                    onTap: () {},
                  ),

                  SizedBox(height: screenHeight * 0.02),
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
                          "Payments",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Profilerowitems(
                    title: "Payments ",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.credit_card,
                    onTap: () {},
                  ),
                  SizedBox(height: screenHeight * 0.02),

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
                          "Other",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Profilerowitems(
                    title: "Logout",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.logout,
                    onTap: () {},
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Profilerowitems(
                    title: "Delete Account ",
                    leadingIcon: Icons.arrow_forward_ios,
                    trailingIcon: Icons.delete,
                    onTap: () {},
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Profilerowitems(
                    title: "Version 1.0 ",
                    trailingIcon: Icons.verified_sharp,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
