import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

// class LogInPage extends StatelessWidget {
//   LogInPage({super.key});
//   TextEditingController userName = TextEditingController();
//   TextEditingController password = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           spacing: 20,
//           children: [
//             SizedBox(height: 20),
//             TextField(
//               controller: userName,
//               decoration: InputDecoration(hintText: "userName"),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: password,
//               decoration: InputDecoration(hintText: "password"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 print("User: ${userName.text}");
//                 print("Pass: ${password.text}");
//               },
//               child: const Text("Log In"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
