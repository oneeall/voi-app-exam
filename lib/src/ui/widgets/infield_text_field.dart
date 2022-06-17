import 'package:flutter/material.dart';

import '../../utils/infield_input_border.dart';

class InfieldTextField extends StatelessWidget {
  const InfieldTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: SizedBox.shrink(),
        prefixIconConstraints: BoxConstraints(minWidth: 12),
        labelText: 'nama penerima',
        helperText: 'Isi nama penerima',
        errorText: null,
        contentPadding: EdgeInsets.fromLTRB(0, 8, 12, 8),
        border: InfieldInputBorder(),
      ),
    );
  }
}
