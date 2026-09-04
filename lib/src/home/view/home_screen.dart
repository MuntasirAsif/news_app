import 'package:flutter/material.dart';
import '../controller/top_news_controller.dart';
import 'widget/top_news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TopNewsController topNewsController = TopNewsController();
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await topNewsController.getTopNews();
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
            Text("Top News", style: textTheme.titleMedium),
            SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: topNewsController.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          topNewsController.topNews?.articles?.length ?? 0,
                      itemBuilder: (context, index) {
                        final news =
                            topNewsController.topNews!.articles![index];
                        return TopNewsCard(news: news, textTheme: textTheme);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

