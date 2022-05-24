import 'package:flutter/material.dart';

class ColumnData extends StatelessWidget {
  const ColumnData({
    Key? key,
    required this.heading,
    required this.text,
  }) : super(key: key);

  final String heading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.black54, fontWeight: FontWeight.w600)),
        Text(text,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
        const SizedBox(height: 5),
      ],
    );
  }
}
