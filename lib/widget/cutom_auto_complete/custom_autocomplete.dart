import 'dart:async';

import 'package:flutter/material.dart';

// class AutocompleteWidget<T extends Object> extends StatefulWidget {
//   AutocompleteWidget({
//     required this.optionsBuilder,
//     required this.maxWidth,
//     required this.autoCompleteTileBuilder,
//     required this.selectedBuilder,
//     required this.displayStringForOption,
//     this.initialvalue,
//     this.focusNode,
//     super.key,
//     this.controller,
//     this.hintText,
//     this.textInputAction,
//     this.selectedData,
//     this.onSelect,
//     this.validator,
//     this.labelText,
//     this.hintStyle,
//     this.labelStyle,
//     this.isRequired = false,
//     this.isEditable = true,
//     this.isUnderLineStyle = false,
//     this.isheader = false,
//     this.isDividerneed = false,
//     this.headerWidth = 0.0,
//     this.regx,
//     this.validationtext,
//     this.validationEmptytext,
//     this.autofocus = false,
//     this.isDebounced = true,
//   });
//   final bool isDebounced;
//   final List<T>? selectedData;
//   final Widget Function(T value) selectedBuilder;
//   final FutureOr<Iterable<T>> Function(String value) optionsBuilder;
//   final FocusNode? focusNode;
//   final TextEditingController? controller;
//   final Widget Function(T option) autoCompleteTileBuilder;
//   // final FormFieldValidator<String>? validator;

//   final String? Function(String?)? validator;
//   final Function(T)? onSelect;
//   final String? labelText;
//   final String? initialvalue;
//   final String Function(T option) displayStringForOption;
//   final String? hintText;
//   final TextStyle? hintStyle;
//   final TextStyle? labelStyle;
//   final double maxWidth;
//   final TextInputAction? textInputAction;

//   final bool isEditable;
//   final bool isRequired;
//   bool isUnderLineStyle;
//   bool isheader;
//   bool isDividerneed;

//   final double? headerWidth;

//   final String? regx;
//   final String? validationtext;
//   final String? validationEmptytext;
//   final bool autofocus;

//   @override
//   State<AutocompleteWidget<T>> createState() => _AutocompleteWidgetState<T>();
// }

// class _AutocompleteWidgetState<T extends Object>
//     extends State<AutocompleteWidget<T>> {
//   TextEditingController textController = TextEditingController();
//   List<T> options = [];

//   Timer? timer;
//   FocusNode focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();

//     // Initialize textController with initial value if provided
//     textController = widget.controller ?? TextEditingController();
//     if (widget.initialvalue != null) {
//       textController.text = widget.initialvalue!;
//     }
//   }

//   @override
//   void didUpdateWidget(covariant AutocompleteWidget<T> oldWidget) {
//     if (widget.controller != null) {
//       textController = widget.controller!;
//     }
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     textController.dispose();
//     timer?.cancel();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return RawAutocomplete<T>(
//       textEditingController: textController,
//       focusNode: widget.focusNode ?? focusNode,
//       optionsViewBuilder: (context, onSelected, options) {
//         return Align(
//           alignment: Alignment.topLeft,
//           child: Material(
//             elevation: 1.0,
//             child: ConstrainedBox(
//               constraints: BoxConstraints(maxWidth: widget.maxWidth),
//               child: widget.isheader
//                   ? ConstrainedBox(
//                       constraints: BoxConstraints(
//                           maxWidth: widget.maxWidth,
//                           maxHeight: 400,
//                           minWidth: widget.maxWidth),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 2, bottom: 7),
//                             child: Row(
//                               children: [
//                                 const Gap(5),
//                                 ContainerText(
//                                   maxwidth: widget.headerWidth!,
//                                   value: 'ITEMcODE',
//                                 ),
//                                 ContainerText(
//                                   // minWidth: 150,
//                                   maxwidth: widget.headerWidth!,
//                                   value: 'ITEMnAME',
//                                 ),
//                                 ContainerText(
//                                   maxwidth: widget.headerWidth!,
//                                   value: 'unit',
//                                 ),
//                                 ContainerText(
//                                   maxwidth: widget.headerWidth!,
//                                   value: 'rate',
//                                 ),
//                                 ContainerText(
//                                   maxwidth: widget.headerWidth!,
//                                   value: 'category',
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Divider(
//                             thickness: 0.5,
//                           ),
//                           Expanded(
//                             child: ListView.separated(
//                               separatorBuilder: (context, index) =>
//                                   widget.isDividerneed
//                                       ? const Divider(
//                                           thickness: 0.5,
//                                         )
//                                       : const SizedBox.shrink(),
//                               shrinkWrap: true,
//                               itemCount: options.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 final option = options.elementAt(index);
//                                 final bool highlight =
//                                     AutocompleteHighlightedOption.of(context) ==
//                                         index;

//                                 return InkWell(
//                                   onTap: () {
//                                     onSelected(option);
//                                   },
//                                   child: SizedBox(
//                                     child: DecoratedBox(
//                                       decoration: BoxDecoration(
//                                         // color: highlight ? fnGetThemeColorScheme().onTertiary : Colors.transparent,
//                                         color: highlight
//                                             ? Theme.of(context)
//                                                 .focusColor
//                                                 .withOpacity(0.1)
//                                             : Colors.transparent,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8),
//                                         child: widget
//                                             .autoCompleteTileBuilder(option),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   : SizedBox(
//                       width: widget.maxWidth,
//                       height: 200,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: options.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           final option = options.elementAt(index);
//                           final bool highlight =
//                               AutocompleteHighlightedOption.of(context) ==
//                                   index;

//                           return InkWell(
//                             onTap: () {
//                               onSelected(option);
//                             },
//                             child: SizedBox(
//                               child: DecoratedBox(
//                                 decoration: BoxDecoration(
//                                   // color: highlight ? fnGetThemeColorScheme().onTertiary : Colors.transparent,
//                                   color: highlight
//                                       ? Theme.of(context)
//                                           .focusColor
//                                           .withOpacity(0.1)
//                                       : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8),
//                                   child: widget.autoCompleteTileBuilder(option),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//             ),
//           ),
//         );
//       },
//       optionsBuilder: (TextEditingValue textEditingValue) async {
//         if (widget.isDebounced) {
//           final Completer<Iterable<T>> completer = Completer();
//           if (timer != null && timer!.isActive) {
//             timer?.cancel();
//           }
//           timer = Timer(
//             kLongPressTimeout,
//             () {
//               completer
//                   .complete(widget.optionsBuilder.call(textEditingValue.text));
//             },
//           );
//           var data = await completer.future;
//           return data;
//         } else {
//           return widget.optionsBuilder.call(textEditingValue.text);
//         }
//       },
//       fieldViewBuilder:
//           (context, textEditingController, focusNode, onFieldSubmitted) {
//         return TextFormField(
//           enabled: widget.isEditable,
//           autofocus: widget.autofocus,
//           validator: (value) {
//           },
//           // widget.validator,
//           decoration: InputDecoration(
//             hintText: widget.hintText,
//             hintStyle: widget.hintStyle ?? AppTextStyle().br16w600,
//             labelText: widget.labelText,
//             labelStyle: widget.labelStyle ?? AppTextStyle().br16w600,
//             border: widget.isUnderLineStyle
//                 ? textEditingController.text.isEmpty
//                     ? const UnderlineInputBorder()
//                     : InputBorder.none
//                 : OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       width: 1,
//                     ),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//           ),
//           controller: textEditingController,
//           focusNode: focusNode,
//           onFieldSubmitted: (value) {
//             onFieldSubmitted();
//           },
//           textInputAction: widget.textInputAction,
//         );
//       },
//       onSelected: (option) {
//         textController.text = widget.displayStringForOption(option);
//         textController.selection = TextSelection.fromPosition(
//           TextPosition(offset: textController.text.length),
//         );
//         if (widget.onSelect != null) {
//           widget.onSelect!(option);
//         }
//       },
//     );
//   }
// }

// class ContainerText extends StatelessWidget {
//   const ContainerText({
//     required this.value,
//     required this.maxwidth,
//     this.minWidth,
//     super.key,
//   });
//   final String? value;
//   final double maxwidth;
//   final double? minWidth;

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//           minWidth: minWidth ?? 100,
//           minHeight: 45,
//           maxHeight: 60,
//           maxWidth: ((minWidth ?? 100) + maxwidth)),
//       child: Padding(
//         padding: const EdgeInsets.all(7),
//         child: Text(
//           value ?? '',
//           style: AppTextStyle().br16w600,
//         ),
//       ),
//     );
//   }
// }


class AutocompleteWidget<T extends Object> extends StatefulWidget {
  AutocompleteWidget({
    required this.optionsBuilder,
    required this.autoCompleteTileBuilder,
    required this.selectedBuilder,
    required this.displayStringForOption,
    this.initialvalue,
    this.focusNode,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.selectedData,
    this.onSelect,
    this.validator,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.isRequired = false,
    this.isEditable = true,
    this.isUnderLineStyle = false,
    this.isheader = false,
    this.isDividerneed = false,
    this.headerWidth = 0.0,
    this.regx,
    this.validationtext,
    this.validationEmptytext,
    this.autofocus = false,
    this.isDebounced = true,
    super.key,
  });

  final bool isDebounced;
  final List<T>? selectedData;
  final Widget Function(T value) selectedBuilder;
  final FutureOr<Iterable<T>> Function(String value) optionsBuilder;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Widget Function(T option) autoCompleteTileBuilder;

  final String? Function(String?)? validator;
  final Function(T)? onSelect;
  final String? labelText;
  final String? initialvalue;
  final String Function(T option) displayStringForOption;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextInputAction? textInputAction;

  final bool isEditable;
  final bool isRequired;
  bool isUnderLineStyle;
  bool isheader;
  bool isDividerneed;

  final double? headerWidth;

  final String? regx;
  final String? validationtext;
  final String? validationEmptytext;
  final bool autofocus;

  @override
  State<AutocompleteWidget<T>> createState() => _AutocompleteWidgetState<T>();
}

class _AutocompleteWidgetState<T extends Object>
    extends State<AutocompleteWidget<T>> {
  late TextEditingController textController;
  List<T> options = [];
  Timer? timer;
  FocusNode focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    textController = widget.controller ?? TextEditingController();
    if (widget.initialvalue != null) {
      textController.text = widget.initialvalue!;
    }
  }

  @override
  void didUpdateWidget(covariant AutocompleteWidget<T> oldWidget) {
    if (widget.controller != null) {
      textController = widget.controller!;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    textController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<T>(
      textEditingController: textController,
      focusNode: widget.focusNode ?? focusNode,
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (widget.isDebounced) {
          final completer = Completer<Iterable<T>>();
          timer?.cancel();
          timer = Timer(const Duration(milliseconds: 300), () {
            completer.complete(widget.optionsBuilder(textEditingValue.text));
          });
          return await completer.future;
        } else {
          return widget.optionsBuilder(textEditingValue.text);
        }
      },
      optionsViewBuilder: (context, onSelected, options) {
        final renderBox =
            _fieldKey.currentContext?.findRenderObject() as RenderBox?;
        final fieldWidth =
            renderBox?.size.width ?? MediaQuery.of(context).size.width;

        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 1.0,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: fieldWidth,
                minWidth: fieldWidth,
                maxHeight: 400,
              ),
              child: widget.isheader
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2, bottom: 7),
                          child: Row(
                            children: [
                              const SizedBox(width: 5),
                              ContainerText(
                                  maxwidth: widget.headerWidth!,
                                  value: 'ITEMcODE'),
                              ContainerText(
                                  maxwidth: widget.headerWidth!,
                                  value: 'ITEMnAME'),
                              ContainerText(
                                  maxwidth: widget.headerWidth!, value: 'unit'),
                              ContainerText(
                                  maxwidth: widget.headerWidth!, value: 'rate'),
                              ContainerText(
                                  maxwidth: widget.headerWidth!,
                                  value: 'category'),
                            ],
                          ),
                        ),
                        const Divider(thickness: 0.5),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                widget.isDividerneed
                                    ? const Divider(thickness: 0.5)
                                    : const SizedBox.shrink(),
                            itemCount: options.length,
                            itemBuilder: (context, index) {
                              final option = options.elementAt(index);
                              final highlight =
                                  AutocompleteHighlightedOption.of(context) ==
                                      index;
                              return InkWell(
                                onTap: () => onSelected(option),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: highlight
                                        ? Theme.of(context)
                                            .focusColor
                                            .withOpacity(0.1)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child:
                                        widget.autoCompleteTileBuilder(option),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        final option = options.elementAt(index);
                        final highlight =
                            AutocompleteHighlightedOption.of(context) == index;
                        return InkWell(
                          onTap: () => onSelected(option),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: highlight
                                  ? Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: widget.autoCompleteTileBuilder(option),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        );
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return Container(
          key: _fieldKey,
          child: TextFormField(
            enabled: widget.isEditable,
            autofocus: widget.autofocus,
            validator: widget.validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ?? const TextStyle(fontSize: 16),
              labelText: widget.labelText,
              labelStyle: widget.labelStyle ?? const TextStyle(fontSize: 16),
              border: widget.isUnderLineStyle
                  ? textEditingController.text.isEmpty
                      ? const UnderlineInputBorder()
                      : InputBorder.none
                  : OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
            ),
            controller: textEditingController,
            focusNode: focusNode,
            onFieldSubmitted: (_) => onFieldSubmitted(),
            textInputAction: widget.textInputAction,
          ),
        );
      },
      onSelected: (option) {
        textController.text = widget.displayStringForOption(option);
        textController.selection = TextSelection.fromPosition(
          TextPosition(offset: textController.text.length),
        );
        widget.onSelect?.call(option);
      },
    );
  }
}

class ContainerText extends StatelessWidget {
  const ContainerText({
    required this.value,
    required this.maxwidth,
    this.minWidth,
    super.key,
  });

  final String? value;
  final double maxwidth;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 100,
        minHeight: 45,
        maxHeight: 60,
        maxWidth: ((minWidth ?? 100) + maxwidth),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Text(
          value ?? '',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
