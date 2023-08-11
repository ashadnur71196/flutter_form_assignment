import 'package:flutter/material.dart';

class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final IconData? iconData;
  final TextInputType? inputType;

  const SimpleInputField(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText,
      this.iconData, this.inputType});

  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {
  static const Color containerColor = Color(0xFFf5f8fb);
  static const Color textBlack = Color(0xFF232323);
  static const Color textLightBlack = Color(0xFF717171);
  static const Color clearButtonColor = Color(0xFFFF7511);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: textBlack),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType ?? TextInputType.number,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: textLightBlack),
            suffixIcon: widget.iconData != null
                ? Icon(
                    widget.iconData,
                    color: textBlack,
                  )
                : Text(""),
            filled: true,
            fillColor: containerColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
            ),
          ),


          onFieldSubmitted: (value) {
            if (value.isEmpty) {
              widget.controller.text = "0.00";
            }
            widget.controller.text = value.toString();
            setState(() {});
          },


          onSaved: (value) {
            widget.controller.text = value.toString();
            setState(() {});
          },


          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a value";
            }
            return null;
          },
        ),
      ],
    );
  }
}
