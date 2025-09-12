// This example expands 01.minimal.dart by using CodeField
// instead of an ordinary TextField.
// This automatically adds the gutter, code folding, and basic autocompletion.

import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/java.dart';

import '../common/snippets.dart';

void main() {
  runApp(const CodeEditor());
}

final controller = CodeController(
  text: javaFactorialSnippet,
  language: java,
);

class CodeEditor extends StatefulWidget {
  const CodeEditor({super.key});

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  Map<String, TextStyle> theme = monokaiSublimeTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  theme = theme == monokaiSublimeTheme
                      ? a11yLightTheme
                      : monokaiSublimeTheme;
                });
              },
              child: const Text('Change theme'),
            ),
            CodeTheme(
              data: CodeThemeData(styles: theme),
              child: SingleChildScrollView(
                child: CodeField(
                  controller: controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
