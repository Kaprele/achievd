import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//todo: denk dir smarte sachen aus
class PhonenumberTextfield extends StatefulWidget {
  PhonenumberTextfield({super.key,
    required this.checkNumber,
    required this.enabled,
    required this.country,
    required this.number,
    this.error,
  });


  final bool enabled;
  String? error;
  String country;
  String number;



  final void Function(String) checkNumber;

  @override
  State<PhonenumberTextfield> createState() => _PhonenumberTextfieldState();
}

class _PhonenumberTextfieldState extends State<PhonenumberTextfield> {
  late FocusNode phonefocus;

  // submit ? onChanged = handleNumber : onchanged = value => widget.country = value



  @override
  void initState() {
    super.initState();
    phonefocus = FocusNode();
  }

  @override
  void dispose() {
    phonefocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 66, //todo make this dynamic
          child: TextField(
            enabled: widget.enabled,
            onChanged: (value) => widget.country = value,
            onSubmitted: (value) => {widget.country = value, phonefocus.requestFocus()},
            controller: TextEditingController(text: widget.country),
            inputFormatters: [
              FilteringTextInputFormatter(RegExp(r'\+?\d*'), allow: true),
              LengthLimitingTextInputFormatter(3),
            ],

            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
            autofocus: true,
            decoration: InputDecoration(
              helperMaxLines: 1,
              errorText: widget.error != null ? ' ' : null,
              border: const OutlineInputBorder(),
              labelText: 'Country',
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width -
              32 -
              72 -
              16, //todo make this dynamic
          child: TextField(
            enabled: widget.enabled,
            onChanged: (value) => widget.number = value,
            onSubmitted:(value) => widget.checkNumber(value),
            controller: TextEditingController(text: widget.number),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            focusNode: phonefocus,
            decoration:  InputDecoration(
              errorText: widget.error,
              border: const OutlineInputBorder(),
              labelText: 'Your phone number',
            ),
          ),
        ),
      ],
    );
  }
}
