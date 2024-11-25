import 'package:app/common/widgets/widget.icon_button.dart';
import 'package:app/core/core.colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Widget icon;
  final void Function(String) setInput;
  final String placeholder;
  final EdgeInsets margin;
  final bool isPassword;
  final Function? togglePasswordVisibility;
  final bool isPasswordShown;

  const InputField({
    super.key,
    required this.setInput,
    required this.placeholder,
    required this.icon,
    this.isPasswordShown = false,
    this.margin = EdgeInsets.zero,
    this.isPassword = false,
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
