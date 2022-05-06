import 'package:flutter/material.dart';
import 'package:try_catch_em_all/utils/themes/app_colors.dart';

class CustomItemSelect extends StatefulWidget {
  final List<String> values;
  final TextEditingController controller;
  const CustomItemSelect({
    Key? key,
    required this.values,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomItemSelect> createState() => _CustomItemSelectState();
}

class _CustomItemSelectState extends State<CustomItemSelect> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.controller.value.text,
      dropdownColor: AppColors.darkGrey,
      iconEnabledColor: Colors.white,
      onChanged: (value) {
        widget.controller.text = value!;
        setState(() {});
      },
      items: <DropdownMenuItem<String>>[
        for (var i = 0; i < widget.values.length; i++)
          DropdownMenuItem(
            value: widget.values[i],
            child: Text(
              widget.values[i],
              style: const TextStyle(color: Colors.white),
            ),
          ),
      ],
    );
  }
}
