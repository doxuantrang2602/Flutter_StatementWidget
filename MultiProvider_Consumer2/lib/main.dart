import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/info.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GioiTinh()),
      ChangeNotifierProvider(create: (_) => BangCap())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
        home: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Radio Demo'),
        ),
        body: Consumer2<GioiTinh, BangCap>(
          builder: (context, infoGioiTinh, infoBangCap, child){
            return Column(
              children: [
                Text('Giới tính'),

                RadioListTile<gioi_tinh?>(
                    value: gioi_tinh.nam,
                    title: Text('Nam'),
                    secondary: Icon(Icons.male),
                    groupValue: infoGioiTinh.gioiTinh,
                    onChanged: (value){
                      infoGioiTinh.gioiTinh = value;
                    }
                ),
                RadioListTile<gioi_tinh?>(
                    value: gioi_tinh.nu,
                    title: Text('Nữ'),
                    secondary: Icon(Icons.female),
                    groupValue: infoGioiTinh.gioiTinh,
                    onChanged: (value){
                      infoGioiTinh.gioiTinh = value;
                    }
                ),
                // To do: Thêm nút Radio chọn giới tính
                Text('Bằng cấp'),
                RadioListTile<bang_cap?>(
                    value: bang_cap.CaoDang,
                    title: Text('Cao Đẳng'),
                    groupValue: infoBangCap.bangCap,
                    onChanged: (value){
                      infoBangCap.bangCap = value;
                    }
                ),
                RadioListTile<bang_cap?>(
                    value: bang_cap.DaiHoc,
                    title: Text('Đại học'),
                    groupValue: infoBangCap.bangCap,
                    onChanged: (value){
                      infoBangCap.bangCap = value;
                    }
                ),
                RadioListTile<bang_cap?>(
                    value: bang_cap.ThacSi,
                    title: Text('Thạc sĩ'),
                    groupValue: infoBangCap.bangCap,
                    onChanged: (value){
                      infoBangCap.bangCap = value;
                    }
                ),
                RadioListTile<bang_cap?>(
                    value: bang_cap.TienSi,
                    title: Text('Tiến sĩ'),
                    groupValue: infoBangCap.bangCap,
                    onChanged: (value){
                      infoBangCap.bangCap = value;
                    }
                ),
                Divider(
                  height: 100
                ),
                Center(
                  child: Text('Thông tin cá nhân: ${infoGioiTinh.gioiTinh}, ${infoBangCap.bangCap}',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            );
          },
        ));
  }
}