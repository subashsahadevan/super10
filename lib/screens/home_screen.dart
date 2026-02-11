import 'package:flutter/material.dart';

import '../widgets/leaderboard_preview.dart';
import '../widgets/question_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super10'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _CompetitionBanner(),
            SizedBox(height: 16),
            QuestionCard(
              questionNumber: 1,
              totalQuestions: 10,
              secondsRemaining: 10,
              questionText: 'Which planet is known as the Red Planet?',
              options: [
                'Earth',
                'Venus',
                'Mars',
                'Jupiter',
              ],
            ),
            SizedBox(height: 16),
            LeaderboardPreview(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: FilledButton.icon(
          onPressed: null,
          icon: const Icon(Icons.schedule),
          label: const Text('Next competition starts in 00:42:18'),
        ),
      ),
    );
  }
}

class _CompetitionBanner extends StatelessWidget {
  const _CompetitionBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hourly Trivia Battle',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Answer 10 questions in 10 seconds each and climb the leaderboard.'),
        ],
      ),
    );
  }
}
