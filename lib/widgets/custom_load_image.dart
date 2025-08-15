import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/logic/addload_provider.dart';
import 'package:solar_app/widgets/dialogs/load_image_dialog.dart';

class Customloadimage extends StatefulWidget {
  const Customloadimage({super.key});
  @override
  State<Customloadimage> createState() => _CustomloadimageState();
}

class _CustomloadimageState extends State<Customloadimage> {
  String? loadImage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String text = await showLoadImageDialog(context);
        context.read<AddloadProvider>().image = text;
        setState(() {
          loadImage = text;
        });
      },
      child: loadImage != null
          ? CircleAvatar(
              radius: 60.r,
              backgroundColor: Colors.white,
              child: Image.asset(loadImage!, fit: BoxFit.fill),
            )
          : CircleAvatar(
              radius: 60.r,
              backgroundColor: Colors.blue,
              child: Icon(Icons.add, size: 40.sp, color: Colors.white),
            ),
    );
  }
}
