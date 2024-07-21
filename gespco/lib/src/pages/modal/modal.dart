import 'package:flutter/material.dart';

class ShowModalApp extends StatelessWidget {
  const ShowModalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ScaffoldState Sample')),
        body: const Modal(),
      ),
    );
  }
}

class Modal extends StatelessWidget {
  const Modal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showBottomSheet'),
        onPressed: () {
          Scaffold.of(context).showBottomSheet<void>(
            (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Hello from Persistent Bottom Sheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
