import 'package:flutter/material.dart';

import 'DropdownWidget.dart';

class CodeEditorScreen extends StatefulWidget {
  const CodeEditorScreen({super.key});

  @override
  State<CodeEditorScreen> createState() => _CodeEditorScreenState();
}

class _CodeEditorScreenState extends State<CodeEditorScreen> {
  final TextEditingController _codeController = TextEditingController(
    text: "print('Hello World');",
  );

  String _selectedLanguage = "Python";
  String _output = "";

  final Map<String, String> _languageTemplates = {
    "Python": "print('Hello World')",
    "Dart": "void main() {\n  print('Hello World');\n}",
    "JavaScript": "console.log('Hello World');",
  };

  void _runCode() {
    // Placeholder output
    setState(() {
      _output =
      "Running $_selectedLanguage...\n\n${_codeController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return  Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          /// ================= LANGUAGE SELECT =================
          /// LABEL
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select Language",
              style: theme.textTheme.titleSmall,
            ),
          ),

          const SizedBox(height: 6),

          /// ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.code, color: theme.primaryColor),
              const SizedBox(width: 8),

              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedLanguage,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconEnabledColor: theme.primaryColor,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor, // ✅ visible selected value
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    isDense: true, // ✅ alignment fix
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: theme.primaryColor),
                    ),
                  ),
                  items: _languageTemplates.keys
                      .map(
                        (lang) => DropdownMenuItem<String>(
                      value: lang,
                      child: Text(
                        lang,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedLanguage = value;
                      _codeController.text = _languageTemplates[value]!;
                    });
                  },
                ),
              ),

              const SizedBox(width: 12),

              SizedBox(
                height: 48, // ✅ force same height
                child: ElevatedButton.icon(
                  onPressed: _runCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon:  Icon(Icons.play_arrow,color: Colors.white,),
                  label: const Text("Run"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// ================= CODE EDITOR =================
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.disabledColor.withOpacity(0.3),
                ),
                color: theme.colorScheme.surface,
              ),
              child: TextField(
                controller: _codeController,
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write your code here...",
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// ================= OUTPUT CONSOLE =================
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: SingleChildScrollView(
                child: Text(
                  _output.isEmpty ? "Output will appear here..." : _output,
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontFamily: "monospace",
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
