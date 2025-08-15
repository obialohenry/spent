import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spent/src/config.dart';

class SpentTextField extends StatefulWidget {
  ///Creates a widget displaying a customised textfield.
  const SpentTextField({
      super.key,
    this.height,
    this.width,
    this.hint,
    this.controller,
    this.spacing,
    this.keyboardType,
    this.initialValue,
    this.readOnly = false,
    this.padding,
    this.inputFormatter,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.maxLines,
    this.borderColor,
    this.onChanged,
    this.fontSize,
    this.borderRadius = 8,
    this.textInputAction,
    this.maxlength,
    this.enabled = true,
    this.borderWidth = 1,
    this.focusNode,
    this.showError = false,
    this.errorText,
    this.validator,
    this.minLines,
  });

  final String? hint;
  final double? spacing;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color? textColor;
  final int? maxLines;
  final int? minLines;
  final double? borderWidth;
  final Color? borderColor;
  final double? fontSize;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String?)? onChanged;
  final double borderRadius;
  final int? maxlength;
  final bool enabled;
  final double? width;
  final double? height;
  final FocusNode? focusNode;
  final bool? showError;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  
  @override
  State<SpentTextField> createState() => _SpentTextFieldState();
}

class _SpentTextFieldState extends State<SpentTextField> {
  // myFocusNode = focusNode;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        onChanged: widget.onChanged,
        maxLength: widget.maxlength,
        inputFormatters: widget.inputFormatter,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: SpentColors.kTextBlack,
          fontWeight: FontWeight.w400,
          fontFamily: SpentStrings.inter,
          fontSize: widget.fontSize ?? 14,
        ),
        keyboardType: widget.keyboardType,
        initialValue: widget.initialValue,
        textCapitalization: widget.textCapitalization,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        textAlign: widget.textAlign,
        maxLines: widget.maxLines ?? 1,
        minLines: widget.minLines,
        validator: widget.validator,
        decoration: InputDecoration(
        border: widget.readOnly ? InputBorder.none : null,
                              hintText: widget.hint,
        hintStyle: theme.textTheme.bodyMedium!.copyWith(
            color: SpentColors.kFrostedSteel,
            fontFamily: SpentStrings.inter,
            fontSize: 14,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                       enabledBorder:
             
                   OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                      color: widget.borderColor ?? SpentColors.kCloudWhisper,
                    ),
                  )
              ,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: SpentColors.kCloudWhisper,
              width: widget.borderWidth!,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(color: SpentColors.kBrightRed,),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: SpentColors.kBrightRed,),
          ),
          errorStyle: const TextStyle(color:SpentColors.kBrightRed,),
          errorMaxLines: 4,
        ),
      ),
    );
  }

}