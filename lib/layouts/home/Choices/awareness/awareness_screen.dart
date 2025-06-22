import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AwarenessScreen extends StatelessWidget {
  const AwarenessScreen({super.key});

  // List of book filenames and titles (add your files here)
  final List<Map<String, String>> books = const [
    {
      'title': 'Brain Stroke Awareness book',
      'file': 'assets/files/Brain_Stroke.pdf',
    },
    {
      'title': 'First Aid for a Stroke Patient',
      'file': 'assets/files/first_aid_for_a_stroke_patient.pdf',
    },
    {
      'title': 'Global Stroke Guidelines and Action Plan (Arabic Translation)',
      'file': 'assets/files/Global_Stroke_Guidelines_and_Action_Plan_Arabic_Translation.pdf',
    },
    {
      'title': 'The Effectiveness of Treating Stroke Patients',
      'file': 'assets/files/The_effectiveness_of_treating_stroke_patients.pdf',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awareness Books'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: books.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: const Icon(Icons.menu_book_rounded, size: 32, color: Colors.blueAccent),
              title: Text(
                book['title'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PdfViewScreen(
                      title: book['title']!,
                      assetPath: book['file']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// PDF Viewer Screen
class PdfViewScreen extends StatelessWidget {
  final String title;
  final String assetPath;

  const PdfViewScreen({super.key, required this.title, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontSize: 20)),
      ),
      body: SfPdfViewer.asset(assetPath),
    );
  }
}
