import 'package:ecommerce/core/constants/enum/snackbar_type.dart';
import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/extensions/snackbar/helper.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

void showDesktopSnackbar({required String text, required SnackbarType type,}) {
  OverlayEntry? overlayEntry;
  overlayEntry = OverlayEntry(
    maintainState: true,
    builder: (cntxt) {
      return CustomSnakbarWidget(
        text: text,
        type: type,
        onClose: () {
          if (overlayEntry != null && overlayEntry.mounted) {
            overlayEntry.remove();
          }
        },
      );
    },
  );

  knNavGlobalKey.currentState!.overlay!.insert(overlayEntry);
}

class CustomSnakbarWidget extends StatefulWidget {
  const CustomSnakbarWidget(
      {required this.text,
      required this.onClose,
      required this.type,
      super.key});
  final String text;

  final VoidCallback onClose;
  final SnackbarType type;

  @override
  State<CustomSnakbarWidget> createState() => _CustomSnakbarWidgetState();
}

class _CustomSnakbarWidgetState extends State<CustomSnakbarWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController colorController;
  late Offset local;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    colorController = AnimationController(
        lowerBound: 0,
        upperBound: 1,
        animationBehavior: AnimationBehavior.normal,
        value: 1,
        vsync: this,
        duration: const Duration(milliseconds: 1200));
    colorController.forward();
    Future.delayed(const Duration(seconds: 3), () {
      onClose();
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onClose() {
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    // var keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    animationController.forward();
    colorController.reverse();
    return Stack(
      children: [
        Align(
          alignment: const Alignment(0, 0.95),
          child: FadeTransition(
              opacity: animationController,
              child: SizedBox(
                width: 354,
                child: Card(
                  color: widget.type.getBgColor(context),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 20),
                    child: SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(widget.type == SnackbarType.success
                              ? Assets.images.svg.checkCircle
                              : widget.type == SnackbarType.error
                                  ? Assets.images.svg.xCircle
                                  : Assets.images.svg.alertCircle),
                          const Gap(20),
                          Expanded(
                            child: Text(
                              widget.text,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              style: const TextStyle(color: Colors.white),
                              // style: AppTextStyles.snackbarButtonText.copyWith(
                              //     color: widget.type.getTextColor(context)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
