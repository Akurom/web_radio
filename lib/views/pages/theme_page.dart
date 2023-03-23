import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_radio/theme/cubit/theme_cubit.dart';
import 'package:web_radio/views/pages/home_page.dart';


class ThemePage extends StatelessWidget {
  ThemePage({Key? key}) : super(key: key);

  final List themeList = [


    {
      'color': Colors.red,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.pink,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.orange,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.amber,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.green,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.teal,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.cyan,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.blue,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.lightBlue,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.indigo,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.deepPurple,
      'brightness': Brightness.light,
    },
    {
      'color': Colors.purple,
      'brightness': Brightness.light,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Preferences')),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: themeList.length,
        itemBuilder: (context, index) {
          return Card(
            color: themeList[index]['color'],
            child: InkWell(
              onTap: () => context.read<ThemeCubit>().changeTheme(
                  themeList[index]['color'], themeList[index]['brightness']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context
          );
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }
}