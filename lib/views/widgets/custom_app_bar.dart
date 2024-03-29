import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_radio/blocs/player/player_bloc.dart';
import 'package:web_radio/consts/size_constants.dart';
import 'package:web_radio/utils/utils.dart';
import 'package:web_radio/views/pages/home_page.dart';
import 'package:web_radio/views/pages/theme_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return AppBar(
          title: Text(state.radio.name.length > 0 ? state.radio.name : "Choose a radio!"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {
                Navigator.of(context, rootNavigator: true,).push(
                  MaterialPageRoute(builder: (context) => ThemePage()),
                );
              },
            ), //IconButton
          ], //<Widget>[]
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
          //systemOverlayStyle: SystemUiOverlayStyle.light,
        );
         /*Container(
             width: screenWidth(context),
          height: screenHeight(context) * SizeConstants.customAppBarRatio,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(
                  screenHeight(context) * SizeConstants.defaultPaddingRatio,
                ),
                child: Icon(
                  Icons.star,
                  size: screenHeight(context) * SizeConstants.customAppIconRatio,
                  color: Colors.white,
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(state.radio.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  screenHeight(context) * SizeConstants.defaultPaddingRatio,
                ),
                child: InkWell(
                  child: Icon(
                    Icons.settings,
                    size: screenHeight(context) * SizeConstants.customAppIconRatio,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThemePage()),
                    );
                  },
                ),
              ),
            ],
          ),
        );*/
      },
    );
  }
}
