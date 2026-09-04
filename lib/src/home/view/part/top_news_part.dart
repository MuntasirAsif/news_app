part of '../home_screen.dart';

class TopNewsPart extends StatelessWidget {
  const TopNewsPart({
    super.key,
    required this.textTheme,
    required this.topNewsController,
  });

  final TextTheme textTheme;
  final TopNewsController topNewsController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SizedBox(height: 10),
          Text("Top News", style: textTheme.titleMedium),
          SizedBox(height: 10),
    
          Expanded(
            child: SizedBox(
              child: topNewsController.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      itemCount:
                          topNewsController.topNews?.articles?.length ??
                          0,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3.6 / 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      itemBuilder: (context, index) {
                        final news =
                            topNewsController.topNews!.articles![index];
                        return TopNewsCard(
                          news: news,
                          textTheme: textTheme,
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
