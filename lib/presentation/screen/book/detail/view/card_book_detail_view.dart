import 'package:flutter/material.dart';

class CardBookDetailView extends StatelessWidget {
  final String pText;
  final String pValue;

  const CardBookDetailView(
      {super.key, required this.pText, required this.pValue});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                fit: FlexFit.tight,
                child: Text(
                  pText,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                )),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Text(pValue, overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}
