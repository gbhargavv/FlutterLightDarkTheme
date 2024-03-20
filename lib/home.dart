import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  late AppTheme _appTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appTheme = Provider.of<AppTheme>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _appTheme.appTheme.primaryColor,
        appBar: AppBar(
          backgroundColor: _appTheme.appTheme.appBarTheme.backgroundColor,
          title: Text(
            'Flutter Light Dark Theme',
            style: _appTheme.appTheme.appBarTheme.titleTextStyle,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                _appTheme.changeTheme();
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                    _appTheme.isDardMode ? Icons.light_mode : Icons.dark_mode,
                    color: _appTheme.appTheme.appBarTheme.iconTheme!.color),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: _appTheme.appTheme.textTheme.titleLarge,
              ),
              SizedBox(height: 20),
              TextField(
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  style: _appTheme.appTheme.textTheme.titleMedium,
                  decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "User name",
                      contentPadding: EdgeInsets.all(8.0),
                      hintStyle: _appTheme.appTheme.textTheme.titleMedium)),
              Container(height: 0.5, color: _appTheme.appTheme.dividerColor),
              SizedBox(height: 20),
              TextField(
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  style: _appTheme.appTheme.textTheme.titleMedium,
                  decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Password",
                      contentPadding: EdgeInsets.all(8.0),
                      hintStyle: _appTheme.appTheme.textTheme.titleMedium)),
              Container(height: 0.5, color: _appTheme.appTheme.dividerColor),
              SizedBox(height: 40),
              Material(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                elevation: 5,
                color: _appTheme.appTheme.appBarTheme.backgroundColor,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text('LOGIN',
                        style: _appTheme.appTheme.appBarTheme.titleTextStyle!
                            .copyWith(fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
