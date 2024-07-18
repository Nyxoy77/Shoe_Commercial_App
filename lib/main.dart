import 'package:flutter/material.dart';
import 'package:flutter_application_1/change_notfier.dart';
import 'package:provider/provider.dart';
import 'Homepage.dart';

void main() {
  runApp(const Myapp());
}

//PROVIDER USE KARKE WE CAN DEFINE VARIABLES AND FUNCTIONS WHICH CAN BE USED 
//GLOBALLY


// PROVIDER ARE  TYPES :
//PROVIDER
//ChangeNOtfier PROVIDER
//FUTURE PROVIDER
//STREAM PROVIDER 


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      // IT requires a change notifier we can use another class inheriting change notifier and use it 
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(187, 254, 208, 1),
              primary: const Color.fromARGB(187, 254, 208, 1)),
          inputDecorationTheme: const InputDecorationTheme(
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          textTheme:const  TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
               fontWeight: FontWeight.bold,
            )
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20,color: Colors.black),
          ),
        ),
        home:  const Homepage(),
      ),
    );
  }
}
