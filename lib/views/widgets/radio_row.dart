import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_radio/blocs/player/player_bloc.dart';
import 'package:web_radio/consts/size_constants.dart';
import 'package:web_radio/models/radio_model.dart';
import 'package:web_radio/utils/utils.dart';

class RadioRow extends StatelessWidget {
  final RadioModel radio;

  const RadioRow({Key? key, required this.radio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
      height: screenHeight(context) * SizeConstants.radioRowRatio,
      decoration: BoxDecoration(
          // todo set color if playing (PlayerBloc)
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          SizedBox(
            width: screenHeight(context) * SizeConstants.radioRowRatio,
            child: CachedNetworkImage(
              imageUrl: radio.faviconUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitWidth,
                    //colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                  ),
                ),
              ),
              //placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.music_note),
            ),
          ),

          Flexible(
              child: Text(
            radio.name,
            overflow: TextOverflow.ellipsis,
          )),

          Icon(Icons.star_border_sharp),
        ],
      ),
    ),
      onTap: () async {
        BlocProvider.of<PlayerBloc>(context).add(SetRadioAndPlayEvent(radio: radio));
      },
    );
  }
}
