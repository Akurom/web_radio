import 'package:flutter/material.dart';
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
        return Container(
          width: screenWidth(context),
          height: screenHeight(context) * SizeConstants.customAppBarRatio,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.star,
                size: screenHeight(context) * SizeConstants.customAppIconRatio,
                color: Colors.white,
              ),
              Flexible(
                child: Align(alignment: Alignment.center, child: Text(state.radio.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white)),
                ),
              ),
              InkWell(
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
              )
            ],
          ),
        );
      },
    );
  }
}
