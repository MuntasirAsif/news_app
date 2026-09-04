import 'package:flutter/material.dart';

import '../../../../core/theme/core/app_colors.dart';
import '../../model/top_news.dart';
import '../full_news_screen.dart';

class TopNewsCard extends StatelessWidget {
  const TopNewsCard({super.key, required this.news, required this.textTheme});

  final Articles news;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullNewsScreen(article: news),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.textPrimary.withValues(alpha: 0.5),
          ),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Image.network(
              news.urlToImage ?? '',
              height: 100,
              width: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  height: 100,
                  width: 200,
                  child: Center(child: Icon(Icons.broken_image)),
                );
              },
            ),
            SizedBox(height: 5),
            Text(
              news.title ?? '',
              style: textTheme.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Text(
              news.description ?? '',
              style: textTheme.bodySmall,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
