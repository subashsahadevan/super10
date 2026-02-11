import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.questionNumber,
    required this.totalQuestions,
    required this.secondsRemaining,
    required this.questionText,
    required this.options,
    super.key,
  });

  final int questionNumber;
  final int totalQuestions;
  final int secondsRemaining;
  final String questionText;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Question $questionNumber / $totalQuestions',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Chip(
                  avatar: const Icon(Icons.timer_outlined, size: 18),
                  label: Text('${secondsRemaining}s'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              questionText,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            for (final option in options)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    alignment: Alignment.centerLeft,
                  ),
                  child: Text(option),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
