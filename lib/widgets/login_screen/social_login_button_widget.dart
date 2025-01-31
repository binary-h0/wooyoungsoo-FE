import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wooyoungsoo/utils/constants.dart';

/// 소셜 로그인 버튼 위젯
///
/// [assetName] 소셜 로고 이미지 경로
/// [buttonText] 버튼에 표시할 텍스트
/// [buttonColor] 버튼 배경색 (각 소셜미디어에서 권장하는 가이드라인을 참고함)
/// [textColor] 버튼 텍스트 색상 (각 소셜미디어에서 권장하는 가이드라인을 참고함)
class SosialLoginButton extends StatelessWidget {
  const SosialLoginButton({
    super.key,
    required this.assetName,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
  });

  final String assetName, buttonText;
  final Color buttonColor, textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // 화면 너비
    final double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(screenWidth * 0.8, 45),
          backgroundColor: buttonColor,
          foregroundColor: textColor,
          shadowColor: transparentColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 65,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SvgPicture.asset(
            assetName,
            width: 18,
          ),
          Text(
            buttonText,
            style: const TextStyle(
              fontWeight: fontWeightRegular,
            ),
          ),
        ],
      ),
    );
  }
}
