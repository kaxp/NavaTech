import 'package:flutter/material.dart';

mixin AppImages {
  static const String _IMAGES_FOLDER_PATH = 'assets/images/';
  static const _errorPlaceholder = _IMAGES_FOLDER_PATH + 'error.png';

  static Image icErrorPlaceholder(
          {required double height, required double widget}) =>
      Image(
        height: height,
        width: widget,
        fit: BoxFit.cover,
        image: const AssetImage(
          _errorPlaceholder,
        ),
      );
}
