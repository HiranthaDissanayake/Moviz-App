import 'package:flutter/material.dart';

class BackBotton extends StatelessWidget {
  const BackBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(top: 16,left: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 101, 101),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,)),
    );
  }
}