import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback onTap;

  const CustomErrorWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () => onTap(),
        child: const Text('error, try again'),
      ),
    );
  }
}
