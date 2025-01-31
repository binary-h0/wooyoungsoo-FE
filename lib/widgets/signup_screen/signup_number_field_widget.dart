import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wooyoungsoo/utils/constants.dart';

class SignupNumberField extends StatelessWidget {
  const SignupNumberField({
    super.key,
    required String label,
    required String hintText,
    required Function onChanged,
  })  : _label = label,
        _hintText = hintText,
        _onChanged = onChanged;

  final String _label, _hintText;
  final Function _onChanged;

  @override
  Widget build(BuildContext context) {
    // 화면 너비
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _label,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: TextField(
              minLines: null,
              maxLines: null,
              expands: true,
              textInputAction: TextInputAction.done,
              onChanged: (value) => _onChanged(value),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                hintText: _hintText,
                hintStyle: TextStyle(color: Colors.grey.shade400),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(width: 1, color: blackColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
