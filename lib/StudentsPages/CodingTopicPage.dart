import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shuleoneparents/Models/CodingSubtopicModel.dart';

import '../Models/CodingTopicModel.dart';
import '../StudentControllers/StudentsCodingController.dart';
import 'HTmlPreviewPage.dart';

class TopicPage extends StatefulWidget {
  final int languageId;

  const TopicPage({super.key, required this.languageId,});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  List<Codingtopicmodel> topics = [];

  void _studentcodingtopics() async {
    final controller = Get.find<Studentscodingcontroller>();
    final response = await controller.getstudentcoding(widget.languageId);

    if (response.isSuccess) {
      final List data =response.message; // parse JSON
      setState(() {
        dummyTopicsJson = data;
        topics = loadDummyTopics();

      });


    } else {
      setState(() {
        dummyTopicsJson = [];
      });
    }
  }

  List<dynamic> dummyTopicsJson = [];
   List<Codingtopicmodel> loadDummyTopics() {
     return dummyTopicsJson
         .map((e) => Codingtopicmodel.fromJson(e))
         .toList();
   }
   int currentSubtopicIndex = 0;
   Set<int> completedSubtopics = {};
   void next() {
     setState(() {
       completedSubtopics.add(currentSubtopicIndex);

       if (currentSubtopicIndex < currentTopic.subtopics.length - 1) {
         currentSubtopicIndex++;
       } else if (currentIndex < topics.length - 1) {
         // move to next topic
         currentIndex++;
         currentSubtopicIndex = 0;
         completedSubtopics.clear();
       }
     });
   }

   void previous() {
     setState(() {
       if (currentSubtopicIndex > 0) {
         currentSubtopicIndex--;
       } else if (currentIndex > 0) {
         currentIndex--;
         currentSubtopicIndex =
             topics[currentIndex].subtopics.length - 1;
         completedSubtopics.clear();
       }
     });
   }

   int currentIndex = 0;
   Codingtopicmodel get currentTopic => topics[currentIndex];
   @override
  void initState() {
     _studentcodingtopics();

    super.initState();
  }
   bool showOutput = false;
   bool showExplanation = false;
   bool showExamples = false;

   String? htmlToRun;

   @override
   Widget build(BuildContext context) {
     if (topics.isEmpty) {
       return const Scaffold(
         body: Center(child: CircularProgressIndicator()),
       );
     }
     final topic = currentTopic;
     final subtopic = topic.subtopics[currentSubtopicIndex];

     return Scaffold(
       appBar: AppBar(
         title: Text("Topic ${currentIndex + 1}: ${topic.title}"),
       ),
       body: ListView(
         padding: const EdgeInsets.all(16),
         children: [
           if (topic.description != null)
             Text(
               topic.description!,
               style: Theme.of(context).textTheme.bodyLarge,
             ),

           const SizedBox(height: 24),

           // 🔹 ALL SUBTOPICS
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 subtopic.title,
                 style: Theme.of(context).textTheme.titleLarge?.copyWith(
                   color: Theme.of(context).primaryColor
                 ),
               ),
               const SizedBox(height: 8),
               Text(subtopic.description),

               const SizedBox(height: 16),

               // Code example
               if (subtopic.example != null)
                 codeBlock(subtopic.example!.content, subtopic),

               const SizedBox(height: 16),
               // Subtitles
               ...subtopic.subtitles.map((st) => Padding(
                 padding: const EdgeInsets.only(bottom: 12),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       "• ${st.subtitle}",
                         style: Theme.of(context).textTheme.titleMedium?.copyWith(
                             color: Theme.of(context).primaryColor
                         )                     ),
                     Text(st.subtitleDescription),
                   ],
                 ),
               )),
             ],
           ),

           // 🔹 Navigation buttons
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               ElevatedButton(
                 onPressed: previous,
                 child: const Text("Previous"),
               ),
               ElevatedButton(
                 onPressed: next,
                 child: const Text("Mark Complete & Next"),
               ),
             ],
           )
         ],
       ),
     );
   }
   Widget codeBlock(String code, Codingsubtopicmodel subtopic) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         // Code container
         Container(
           width: double.infinity,
           padding: const EdgeInsets.all(12),
           decoration: BoxDecoration(
             color: Colors.black,
             borderRadius: BorderRadius.circular(8),
           ),
           child: SelectableText(
             code,
             style: const TextStyle(
               fontFamily: 'monospace',
               color: Colors.greenAccent,
             ),
           ),
         ),

         const SizedBox(height: 8),

         // 🔹 ACTION BUTTONS ROW
         Row(
           children: [
             TextButton.icon(
               icon: const Icon(Icons.play_arrow),
               label: const Text("Run"),
               onPressed: () {
                 setState(() {
                   htmlToRun = code;
                   showOutput = true;
                 });
               },
             ),
             TextButton.icon(
               icon: const Icon(Icons.menu_book),
               label: const Text("Explanation"),
               onPressed: () {
                 setState(() {
                   showExplanation = !showExplanation;
                 });
               },
             ),
             TextButton.icon(
               icon: const Icon(Icons.science),
               label: const Text("Examples"),
               onPressed: () {
                 setState(() {
                   showExamples = !showExamples;
                 });
               },
             ),
           ],
         ),

         // 🔹 EXPLANATION SECTION
         if (showExplanation) ...[
           const SizedBox(height: 8),
           const Text(
             "Explanation",
             style: TextStyle(fontWeight: FontWeight.bold),
           ),
           const SizedBox(height: 4),
           Text(subtopic.description),
         ],

         // 🔹 EXAMPLES SECTION
         if (showExamples && subtopic.subtitles.isNotEmpty) ...[
           const SizedBox(height: 8),
           const Text(
             "Examples",
             style: TextStyle(fontWeight: FontWeight.bold),
           ),
           ...subtopic.subtitles.map((st) => Padding(
             padding: const EdgeInsets.only(top: 6),
             child: Text("• ${st.subtitle}"),
           )),
         ],

         // 🔹 OUTPUT SECTION
         if (showOutput && htmlToRun != null)
           htmlOutput(htmlToRun!),
       ],
     );
   }
   Widget htmlOutput(String html) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         const SizedBox(height: 16),
         const Text(
           "Output",
           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
         ),
         const SizedBox(height: 8),
         Container(
           height: 250,
           decoration: BoxDecoration(
             border: Border.all(color: Colors.grey),
             borderRadius: BorderRadius.circular(8),
           ),
           child: HtmlPreviewPage(html: html), // reuse your WebView widget
         ),
       ],
     );
   }

}
