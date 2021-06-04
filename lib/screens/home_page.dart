import 'package:flutter/material.dart';

import 'widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar( subtitle: "Developer", 
                title: "Ajmal VA", 
                color: Color(0xff0b3d2e)),
                const SizedBox(height: 10),
                Text('Photography' ,
                 style: TextStyle(fontSize: 22, color: Color(0xff0b3d2e)),)

          
              ],
            )
                )
                );
  }
}

