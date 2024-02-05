import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main(List<String> args) {
    runApp(ChangeNotifierProvider(
      create:(context)=> MySetting(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp()),
    ));
}

class MySetting extends ChangeNotifier{
  String text = 'Done';
  Color color = Colors.red;

  void changeText()
  {
    if(text == 'Hello'){
      text = 'World';
    }else{
      text = 'Hello';
    }
    notifyListeners();
  }
  void changeColor(){
    if(color == Colors.red){
      color = Colors.blue;
    }else{
      color = Colors.red;
    }
    notifyListeners();
  }
  set newColor(Color newColor){
    color = newColor;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget{
   const MyApp({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context){
     return Consumer<MySetting>(
         builder: (context, mySettings, child){
           return Scaffold(
             appBar: AppBar(
                 title: Text('Provider Demo'),
                 backgroundColor: mySettings.color
             ),
             drawer: Drawer(
               child: Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ElevatedButton(onPressed: (){
                       mySettings.changeColor();
                       Navigator.pop(context);
                     }, child: Text('Change Color')),
                     ElevatedButton(onPressed: (){
                       mySettings.changeText();
                       Navigator.pop(context);
                     }, child: Text('Change Text')),
                     ElevatedButton(onPressed: (){
                       mySettings.newColor = Colors.green;
                       Navigator.pop(context);
                     }, child: Text('Change Color to Green')),
                   ],
                 ),
               ),
             ),
             body: Center(child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(onPressed: (){
                   mySettings.changeText();
                 }, child: Text('Change Text')),
                 Text('${mySettings.text}')
               ],
             ),
             ),
           );
         });
   }
}
