import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home: Home()
    )
);

class Counter extends GetxController{
  var count = 0.obs;
  void add(){
    count++;
  }
}
class Home extends StatelessWidget {
  final counter = Get.put(Counter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        backgroundColor: Colors.lime,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              '${counter.count}',
              style: TextStyle(fontSize: 50, color: Colors.red),
            )),
            ElevatedButton(onPressed: (){
              Get.to(OtherScreen());
            }, child: Text('Go to Other Screen')),
            ElevatedButton(onPressed: (){
              Get.to(ThirstScreen());
            }, child: Text('Go to Thirst Screen'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counter.add();
      },
        child: Icon(Icons.add),
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  final Counter otherCounter = Get.find();
  final counter = Get.put(Counter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(
          ()=>Text(
            '${otherCounter.count}',
            style: TextStyle(fontSize: 50, color: Colors.red),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        otherCounter.add();
      },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ThirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(child: Text('Show SnackBar'),
            onPressed: (){
              Get.snackbar('Hi', 'Đỗ Xuân Tráng',
                  colorText: Colors.amber
              );
            },
          ),
          ElevatedButton(child: Text('Back'),
            onPressed: (){
              Get.back();
            },
          ),
        ],
      )
    );
  }
}

