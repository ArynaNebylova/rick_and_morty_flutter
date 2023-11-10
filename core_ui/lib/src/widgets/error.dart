part of widgets;

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback onTap;

  const CustomErrorWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('error, try again'),
          MaterialButton(
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
