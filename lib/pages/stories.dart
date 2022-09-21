import 'package:flutter/material.dart';
import 'package:handling_json_data/models.dart/news_data.dart';
import 'package:handling_json_data/models.dart/shower_card.dart';
import 'package:provider/provider.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Practice'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NewsData>().initialValues();
              context.read<NewsData>().fetchData;
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<NewsData>().fetchData;
        },
        child: Center(
          child: Consumer<NewsData>(
            builder: (context, value, child) {
              return value.map.length == 0 && !value.error
                  ? CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Oops something went wrong/n ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          itemCount: value.map['person'].length,
                          itemBuilder: (context, index) {
                            return ShowerCard(
                              map: value.map['person'][index],
                            );
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
