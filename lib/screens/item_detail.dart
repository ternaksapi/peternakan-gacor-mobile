import 'package:flutter/material.dart';
import 'package:peternakan_gacor/models/items.dart';

class ItemsDetailPage extends StatelessWidget {
  final Items items;

  const ItemsDetailPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.fields.name),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${items.fields.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Amount: ${items.fields.amount}'),
            SizedBox(height: 10),
            Text('Description: ${items.fields.description}'),
          ],
        ),
      ),
    );
  }
}
