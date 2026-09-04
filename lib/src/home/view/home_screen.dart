import 'package:flutter/material.dart';
import 'package:news_app/core/theme/core/app_colors.dart';
import 'package:news_app/src/home/controller/source_controller.dart';
import '../controller/top_news_controller.dart';
import 'widget/top_news_card.dart';

part 'part/top_news_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TopNewsController topNewsController = TopNewsController();
  SourceController sourceController = SourceController();
  Map<String, String> params = {'country': 'us'};
  String? selectedSource;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await topNewsController.getTopNews(params);
    setState(() {});
    await sourceController.getSource();
    setState(() {});
  }

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
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: .horizontal,
                itemCount: sourceController.sourceModel?.sources?.length ?? 0,
                itemBuilder: (context, index) {
                  final source = sourceController.sourceModel?.sources?[index];
                  return GestureDetector(
                    onTap: () {
                      selectedSource = source?.id;
                      params = {'sources': source?.id ?? ""};
                      getData();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: selectedSource == source?.id
                            ? AppColors.primary
                            : AppColors.textSecondary.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          source?.name ?? "",
                          style: TextStyle(
                            color: selectedSource == source?.id
                                ? AppColors.surface
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            TopNewsPart(
              textTheme: textTheme,
              topNewsController: topNewsController,
            ),
          ],
        ),
      ),
    );
  }
}
