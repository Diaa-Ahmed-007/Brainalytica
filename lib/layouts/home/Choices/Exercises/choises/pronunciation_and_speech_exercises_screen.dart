import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PronunciationAndSpeechExercisesScreen extends StatefulWidget {
  const PronunciationAndSpeechExercisesScreen({super.key});

  @override
  State<PronunciationAndSpeechExercisesScreen> createState() =>
      _PronunciationAndSpeechExercisesScreenState();
}

class _PronunciationAndSpeechExercisesScreenState
    extends State<PronunciationAndSpeechExercisesScreen> {
  final List<Map<String, String>> videos = [
    {
      'title': 'Pronunciation and Speech Exercises',
      'url': 'https://youtu.be/0EYK_csISdk?si=PE_wNlcWETo9O8OV',
    },
  ];

  final List<YoutubePlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (var video in videos) {
      final videoId = YoutubePlayer.convertUrlToId(video['url']!);
      _controllers.add(
        YoutubePlayerController(
          initialVideoId: videoId!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronunciation and Speech Exercises'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video['title']!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  YoutubePlayer(
                    controller: _controllers[index],
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.red,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.red,
                      handleColor: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
