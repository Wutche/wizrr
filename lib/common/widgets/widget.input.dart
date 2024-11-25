import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/core/core.colors.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget icon;
  final void Function(String) setInput;
  final String placeholder;
  final EdgeInsets margin;
  final bool isPassword;
  final Function? togglePasswordVisibility;
  final bool isPasswordShown;
  final bool readOnly;

  const TextInputField({
    super.key,
    required this.setInput,
    this.controller,
    required this.placeholder,
    required this.icon,
    this.isPasswordShown = false,
    this.margin = EdgeInsets.zero,
    this.isPassword = false,
    this.readOnly = false,
    this.togglePasswordVisibility
  });

  List<Widget> getChildWidgets(){
    if(isPassword){
      return [
        AppIconButton(
          tapHandler: (){
            if(togglePasswordVisibility == null) return;
            togglePasswordVisibility!();
          },
          child: Icon(
              isPasswordShown?Icons.visibility_off:Icons.visibility
          ),
        )

      ];
    }
    return [];
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: margin,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.darkShade[50],
          borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          Expanded(child: Row(
            children: [
              icon,
              const SizedBox(width: 4),
              Expanded(child: TextField(
                onChanged: setInput,
                readOnly: readOnly,
                controller: controller,
                obscureText: !isPasswordShown && isPassword,
                obscuringCharacter: "•",
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: placeholder,
                    hintStyle: TextStyle(
                        color: AppColor.darkShade[400]
                    )
                ),
              )),
              ...getChildWidgets()
            ],
          ))
        ],
      ),
    );
  }
}
