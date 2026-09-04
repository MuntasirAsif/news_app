import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/date_format.dart';
import '../model/top_news.dart';

class FullNewsScreen extends StatelessWidget {
  final Articles article;

  const FullNewsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Full News')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News Image
            if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
              Image.network(
                article.urlToImage!,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported, size: 60),
                  );
                },
              ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Source
                  if (article.source?.name != null)
                    Text(
                      article.source!.name!,
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  const SizedBox(height: 10),

                  // Title
                  Text(
                    article.title ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Author and Date
                  Row(
                    children: [
                      if (article.author != null && article.author!.isNotEmpty)
                        Expanded(
                          child: Text(
                            'By ${article.author}',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
                          ),
                        ),

                      if (article.publishedAt != null)
                        Text(
                          formatDate(article.publishedAt!),
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Description
                  if (article.description != null &&
                      article.description!.isNotEmpty)
                    Text(
                      article.description!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),

                  const SizedBox(height: 20),

                  // Content
                  if (article.content != null && article.content!.isNotEmpty)
                    Text(
                      article.content!,
                      style: const TextStyle(fontSize: 16, height: 1.7),
                    ),

                  const SizedBox(height: 30),

                  // Read Original Article
                  if (article.url != null && article.url!.isNotEmpty)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final url = Uri.parse(article.url ?? '');
                          if (await canLaunchUrl(url)) {
                            log("print successfully ");
                            await launchUrl(url);
                          } else {
                            log("print not successfully");
                          }
                        },
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Read Original Article'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
