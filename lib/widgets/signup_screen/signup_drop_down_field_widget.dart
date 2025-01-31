import 'package:flutter/material.dart';

/// 회원가입 시 사용되는 드롭다운 버튼 위젯
///
/// [_label] 드롭다운 버튼 위젯의 라벨
/// [_items] 드롭다운 버튼 위젯의 아이템 리스트
/// [_onChanged] 드롭다운 버튼 위젯의 아이템 선택 시 실행될 콜백 함수
/// [_width] 드롭다운 버튼 위젯의 너비
class SignupDropDownField extends StatefulWidget {
  const SignupDropDownField({
    super.key,
    required String label,
    required List<String> items,
    required Function onChanged,
    required double width,
  })  : _label = label,
        _items = items,
        _onChanged = onChanged,
        _width = width;

  final String _label;
  final List<String> _items;
  final Function _onChanged;
  final double _width;

  @override
  State<SignupDropDownField> createState() => _SignupDropDownFieldState();
}

class _SignupDropDownFieldState extends State<SignupDropDownField> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget._width,
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget._label,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 0,
            ),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                width: 1,
                color: Colors.grey.shade400,
              ),
            ),
            child: DropdownButton(
              hint: Text(
                "선택 안함",
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
              iconEnabledColor: Colors.grey.shade400,
              underline: Container(
                height: 0,
              ),
              isExpanded: true,
              borderRadius: BorderRadius.circular(14),
              value: _selectedItem,
              items: widget._items.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value!;
                  widget._onChanged(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
