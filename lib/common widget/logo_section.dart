import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          "Cinema Bono",
          style: TextStyle(
              color: Colors.purple, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
