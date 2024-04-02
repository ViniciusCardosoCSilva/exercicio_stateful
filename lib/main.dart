
import 'package:flutter/material.dart';
void main() {
 runApp(const MyApp());
}
class MyApp extends StatelessWidget {
 const MyApp({super.key});
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
     home: const MyHomePage(),
   );
 }
}
class MyHomePage extends StatefulWidget {
 const MyHomePage({super.key});
 @override
 State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

 double iconSize = 300;
 Color iconColor = Colors.black;
 
 void decrementa() {
   setState(() {
     iconSize -= 50;
     if (iconSize < 50) iconSize = 50;
   });
 }
 void incrementa() {
   setState(() {
     iconSize += 50;
     if (iconSize > 500) iconSize = 500;
   });
 }
 void tamanhoS() {
   setState(() {
     iconSize = 50;
   });
 }
 void tamanhoM() {
   setState(() {
     iconSize = 250;
   });
 }
 void tamanhoL() {
   setState(() {
     iconSize = 500;
   });
 }
 void alteraCorIcone(Color newColor) {
   setState(() {
     iconColor = newColor;
   });
 }
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Flutter State'),
       actions: [
         IconButton(
           icon: const Icon(Icons.remove),
           onPressed: decrementa,
         ),
         IconButton(
           icon: const Text('S'),
           onPressed: tamanhoS,
         ),
         IconButton(
           icon: const Text('M'),
           onPressed: tamanhoM,
         ),
         IconButton(
           icon: const Text('L'),
           onPressed: tamanhoL,
         ),
         IconButton(
           icon: const Icon(Icons.add),
           onPressed: incrementa,
         ),
       ],
     ),
     body: Column(
       children: [
         Expanded(
           child: Center(
             child: Icon(
               Icons.lock_clock,
               size: iconSize,
               color: iconColor,
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
           child: Row(
             children: [
               Expanded(
                 child: Slider(
                   activeColor: Colors.red,
                   value: iconColor.red.toDouble(),
                   min: 0,
                   max: 255,
                   onChanged: (value) => alteraCorIcone(Color.fromARGB(
                     255,
                     value.toInt(),
                     iconColor.green.toInt(),
                     iconColor.blue.toInt(),
                   )),
                 ),
               ),
               Text(
                 iconColor.red.toInt().toString(),
                 style: TextStyle(
                   color: Colors.red,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                 ),
               ),
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
           child: Row(
             children: [
               Expanded(
                 child: Slider(
                   activeColor: Colors.green,
                   value: iconColor.green.toDouble(),
                   min: 0,
                   max: 255,
                   onChanged: (value) => alteraCorIcone(Color.fromARGB(
                     255,
                     iconColor.red.toInt(),
                     value.toInt(),
                     iconColor.blue.toInt(),
                   )),
                 ),
               ),
               Text(
                 iconColor.green.toInt().toString(),
                 style: TextStyle(
                   color: Colors.green,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                 ),
               ),
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
           child: Row(
             children: [
               Expanded(
                 child: Slider(
                   activeColor: Colors.blue,
                   value: iconColor.blue.toDouble(),
                   min: 0,
                   max: 255,
                   onChanged: (value) => alteraCorIcone(Color.fromARGB(
                     255,
                     iconColor.red.toInt(),
                     iconColor.green.toInt(),
                     value.toInt(),
                   )),
                 ),
               ),
               Text(
                 iconColor.blue.toInt().toString(),
                 style: TextStyle(
                   color: Colors.blue,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                 ),
               ),
             ],
           ),
         ),
       ],
     ),
   );
 }
}