import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset("../assets/diamond.png"),
                const SizedBox(height: 16.0),
                const Text("SHRINE",style: TextStyle(fontSize: 24),),
              ],
            ),
            const SizedBox(height: 120.0,),
            username,
            const SizedBox(height: 12.0,),
            password,
            const SizedBox(height: 20.0,),
            overflowBar
          ],
        ),
      )
    );
  }
}

// 新增 CANCEL 按鈕清空 TextField 的 Controller 功能
final _usernameController = TextEditingController();
final _passwordController = TextEditingController();

// username text area
var username = TextField(
  controller: _usernameController,
  decoration: const InputDecoration(
    filled: true,
    labelText: "Username"
  )
);

// password text area
var password = TextField(
  controller: _passwordController,
  decoration: const InputDecoration(
    filled: true,
    labelText: "Password"
  ),
  obscureText: true,
);

// 製作 overflowBar - 兩個 button layout 的 bar
// 兩個 button 是由 textButton 和 elevatedButton 組成
// 這邊官方說會用兩種不同方式製作 button 是因為以用戶體驗來說，我們希望用戶不要退出登陸動作，進而用 button 不同的呈現方式來告訴用戶哪個 button 更重要，而哪個 button 不重要
var overflowBar = OverflowBar(
  alignment: MainAxisAlignment.end,
  children: [
    TextButton(
      onPressed: () {
        _usernameController.clear();
        _passwordController.clear();
      } ,
      child: const Text("CANCEL")
    ),
    ElevatedButton(
      onPressed: () => {}, 
      child: const Text("NEXT")
    )
  ],
);