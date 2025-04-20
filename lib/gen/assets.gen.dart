/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/company
  $AssetsImagesCompanyGen get company => const $AssetsImagesCompanyGen();

  /// File path: assets/images/defaultimage.png
  AssetGenImage get defaultimage =>
      const AssetGenImage('assets/images/defaultimage.png');

  /// Directory path: assets/images/svg
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();

  /// List of all assets
  List<AssetGenImage> get values => [defaultimage];
}

class $AssetsImagesCompanyGen {
  const $AssetsImagesCompanyGen();

  /// File path: assets/images/company/company_logo.png
  AssetGenImage get companyLogo =>
      const AssetGenImage('assets/images/company/company_logo.png');

  /// File path: assets/images/company/image 1 8.png
  AssetGenImage get image18 =>
      const AssetGenImage('assets/images/company/image 1 8.png');

  /// List of all assets
  List<AssetGenImage> get values => [companyLogo, image18];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/Arrow left.svg
  String get arrowLeft => 'assets/images/svg/Arrow left.svg';

  /// File path: assets/images/svg/Arrow right.svg
  String get arrowRight => 'assets/images/svg/Arrow right.svg';

  /// File path: assets/images/svg/Edit 8.svg
  String get edit8 => 'assets/images/svg/Edit 8.svg';

  /// File path: assets/images/svg/Grid.svg
  String get grid => 'assets/images/svg/Grid.svg';

  /// File path: assets/images/svg/List.svg
  String get list => 'assets/images/svg/List.svg';

  /// File path: assets/images/svg/Minus square.svg
  String get minusSquare => 'assets/images/svg/Minus square.svg';

  /// File path: assets/images/svg/User.svg
  String get user => 'assets/images/svg/User.svg';

  /// File path: assets/images/svg/add.svg
  String get add => 'assets/images/svg/add.svg';

  /// File path: assets/images/svg/alert-circle.svg
  String get alertCircle => 'assets/images/svg/alert-circle.svg';

  /// File path: assets/images/svg/cart.svg
  String get cart => 'assets/images/svg/cart.svg';

  /// File path: assets/images/svg/check-circle.svg
  String get checkCircle => 'assets/images/svg/check-circle.svg';

  /// File path: assets/images/svg/delete.svg
  String get delete => 'assets/images/svg/delete.svg';

  /// File path: assets/images/svg/favorite.svg
  String get favorite => 'assets/images/svg/favorite.svg';

  /// File path: assets/images/svg/filter.svg
  String get filter => 'assets/images/svg/filter.svg';

  /// File path: assets/images/svg/home.svg
  String get home => 'assets/images/svg/home.svg';

  /// File path: assets/images/svg/image 1 8.svg
  String get image18 => 'assets/images/svg/image 1 8.svg';

  /// File path: assets/images/svg/log-out.svg
  String get logOut => 'assets/images/svg/log-out.svg';

  /// File path: assets/images/svg/shopping-bag.svg
  String get shoppingBag => 'assets/images/svg/shopping-bag.svg';

  /// File path: assets/images/svg/sort.svg
  String get sort => 'assets/images/svg/sort.svg';

  /// File path: assets/images/svg/warning.svg
  String get warning => 'assets/images/svg/warning.svg';

  /// File path: assets/images/svg/x-circle.svg
  String get xCircle => 'assets/images/svg/x-circle.svg';

  /// List of all assets
  List<String> get values => [
        arrowLeft,
        arrowRight,
        edit8,
        grid,
        list,
        minusSquare,
        user,
        add,
        alertCircle,
        cart,
        checkCircle,
        delete,
        favorite,
        filter,
        home,
        image18,
        logOut,
        shoppingBag,
        sort,
        warning,
        xCircle
      ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
