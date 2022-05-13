import 'package:crnr/providers/corona_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Corona'),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final coronaData = ref.watch(coronaprovider);

          return coronaData.when(
            data: (data) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Image.network(data[index].ids!);
                  });
            },
            error: (err, stack) => Text('$err'),
            loading: () => Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }
}
