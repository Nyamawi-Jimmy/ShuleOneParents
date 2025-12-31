import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../Authentication/AuthControllers/ParentControler.dart';
import '../../Models/ChildrenModel.dart';
import '../../Routes/routes.dart';


class Studentprofiles extends StatefulWidget {
  const Studentprofiles({super.key});

  @override
  State<Studentprofiles> createState() => _StudentprofilesState();
}

class _StudentprofilesState extends State<Studentprofiles> {
  final ParentController parentController = Get.find<ParentController>();

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
            padding: EdgeInsets.fromLTRB(8, screenHeight * 0.05, 16, 10),
            color: theme.primaryColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Your Learners",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Icon(
                          FontAwesomeIcons.computer,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Good Afternoon!",
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        GetBuilder<ParentController>(
                          builder: (controller) {
                            return Text(
                              "${controller.fullName} 👋",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    GetBuilder<ParentController>(
                      builder: (controller) {
                        return ClipOval(
                          child: Image.network(
                            controller.image,
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        );
                      },
                    ),


                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<ParentController>(
              builder: (controller) {
                if (controller.children.isEmpty) {
                  return const Center(child: Text("No learners found"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: controller.children.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: learnerCard(context, controller.children[index]),
                    );
                  },
                );
              },
            ),
          ),        ],
      ),
    );
  }
  Widget learnerCard(BuildContext context, ChildModel learner) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: (){
        parentController.selectChild(learner);
        Navigator.pushNamed(context, RouteHelper.parenthomepage);
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(learner.image) ,
              ),

              const SizedBox(width: 12),

              // Name & grade
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${learner.firstName} ${learner.secondName}",
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      learner.grade,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Status chip
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: learner.status =="Active"
                      ? Colors.green.withOpacity(0.15)
                      : Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  learner.status ,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: learner.status  == "Active"? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class Learner {
  final String name;
  final String grade;
  final String avatar;
  final bool isActive;

  Learner({
    required this.name,
    required this.grade,
    required this.avatar,
    required this.isActive,
  });
}
