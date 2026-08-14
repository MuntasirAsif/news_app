import 'package:flutter/material.dart';

import '../../core/theme/core/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/app_logo.jpg', height: 25, width: 25),
            SizedBox(width: 10),
            Text('New Today'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),
            Text("Top News", style: textTheme.titleMedium),
            SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 10),
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
                          "https://template.canva.com/EAGxpxyYkyc/1/0/1280w-CWL5w-WE-NU.jpg",
                          height: 100,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Article asjdfbakjsd asdfh asdfsdfas Title",
                          style: textTheme.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Article asjdfbakjsd asdfh dfgasd asd fghfgh asd as ads asd asda sdassdfg df asdfsdfas Description",
                          style: textTheme.bodySmall,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
