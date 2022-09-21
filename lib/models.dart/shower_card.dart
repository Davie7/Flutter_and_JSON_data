import 'package:flutter/material.dart';

class ShowerCard extends StatelessWidget {
  final Map<String, dynamic> map;
  const ShowerCard({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${map['first']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  
                  Text(
                    '${map['last']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
