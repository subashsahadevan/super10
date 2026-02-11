import 'package:flutter/material.dart';

class LeaderboardPreview extends StatelessWidget {
  const LeaderboardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    const entries = [
      ('Ava', 980),
      ('Noah', 940),
      ('You', 910),
    ];

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Leaderboard Preview',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            for (var i = 0; i < entries.length; i++)
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(child: Text('#${i + 1}')),
                title: Text(entries[i].$1),
                trailing: Text('${entries[i].$2} pts'),
              ),
          ],
        ),
      ),
    );
  }
}
