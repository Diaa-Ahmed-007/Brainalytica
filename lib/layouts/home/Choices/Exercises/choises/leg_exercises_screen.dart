import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LegExercisesScreen extends StatefulWidget {
  const LegExercisesScreen({super.key});

  @override
  State<LegExercisesScreen> createState() => _LegExercisesScreenState();
}

class _LegExercisesScreenState extends State<LegExercisesScreen> {
  final List<Map<String, String>> videos = [
    {
      'title': 'Sit to Stand',
      'url': 'https://youtu.be/Nm7NeF-5kJg?si=nBc41REKTdtaDRpC',
    },
    {
      'title': 'Leg Lift',
      'url': 'https://www.youtube.com/watch?v=mISJxGsDaVY',
    },
    {
      'title': 'Knee Rolling',
      'url': 'https://www.youtube.com/watch?v=YvRNdohSwTI',
    }
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
        title: const Text('Leg Exercises'),
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
