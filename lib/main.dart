import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

double get size => MediaQuery.of(context).size.width / 4.5;
String inputvalue = '';
String calculatedvalue = '';
String operator = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home:Scaffold( 
        backgroundColor: Colors.indigo.shade900,
        appBar: AppBar(
          backgroundColor:Colors.indigo.shade900,
          title: Text('Calculator App', style: TextStyle(fontSize: 35, color: Colors.white),),),
      body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              height: 300,
              child: Text(inputvalue,style: TextStyle(color: Colors.white,fontSize: 100)),

            ),
            Column(
              children: [
                Row(
                  children: [
                   calbutton('7',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('8',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('9',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('/',Colors.green),
                  ],
                ),
                Row(
                  children: [
                   calbutton('4',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('5',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('6',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('*',Colors.green),
                  ],
                ),
                Row(
                  children: [
                   calbutton('1',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('2',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('3',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('-',Colors.green),
                  ],
                ),
                Row(
                  children: [
                   calbutton('0',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('.',const Color.fromARGB(255, 236, 73, 127)),
                   calbutton('=',Colors.green),
                   calbutton('+',Colors.green),
                  ],
                ),
                clearbutton('Clear'),
              ],
            )
          ],
        ),
      )
    );
  }

  Widget calbutton(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text== '+' || text== '-' || text== '*' || text== '/'  ) {
          setState(() {
             calculatedvalue = inputvalue;
             inputvalue = '';
             operator = text;
          });
        }
        else if (text == '=') {
          double calc = double.parse(calculatedvalue);
          double inpt = double.parse(inputvalue);
          setState(() {
            if (operator == '+') {
              inputvalue = (calc + inpt).toString();
            }
            else if (operator == '-') {
              inputvalue = (calc - inpt).toString();
            }
            else if (operator == '*') {
              inputvalue = (calc * inpt).toString();
            }
            else if (operator == '/') {
              inputvalue = (calc / inpt).toString();
            }
          });
        }
        else {
          setState(() {
          inputvalue=inputvalue + text ;
        });
        }
      },
      child: Container (
                        margin: EdgeInsets.all(5),
                        height: size,
                        width: size,
                        alignment: Alignment.center,
                        decoration: 
                        BoxDecoration(color: bgcolor,
                          borderRadius: BorderRadius.circular(100),),
                        child: Text(text,style: TextStyle(color: Colors.white,fontSize: 40)),
                      ),
    );
  }
  Widget clearbutton (String text2) {
    return InkWell(
      onTap: () {
        setState(() {
          if (text2=='Clear') {
            inputvalue = '';
          }
        });
      },
      child: Container (
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: 
                        BoxDecoration(color: const Color.fromARGB(255, 27, 140, 197),
                          borderRadius: BorderRadius.circular(100),),
                        child: Text(text2,style: TextStyle(color: Colors.white,fontSize: 40)),
                      ),
    );
  }

}
