import 'package:flutter/material.dart';
import 'package:wooyoungsoo/utils/constants.dart';

class AllPolicyAgreeWidget extends StatelessWidget {
  const AllPolicyAgreeWidget({
    super.key,
    required this.screenWidth,
    required this.isAgreeTerms,
    required this.isAgreePrivacy,
    required this.handleAllAgree,
  });
  final bool isAgreeTerms, isAgreePrivacy;
  final double screenWidth;
  final VoidCallback handleAllAgree;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.9,
      margin: const EdgeInsets.only(top: 20),
      height: 50,
      decoration: BoxDecoration(
        color: isAgreeTerms && isAgreePrivacy ? lightBlueColor : lightGreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
            ),
            child: SizedBox(
              width: 26,
              height: 26,
              child: ElevatedButton(
                onPressed: handleAllAgree,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAgreeTerms && isAgreePrivacy
                      ? mainColor
                      : mediumGreyColor,
                  fixedSize: const Size(30, 30),
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                  shadowColor: Colors.transparent,
                ),
                child: const Icon(
                  Icons.check,
                  color: whiteColor,
                  size: 18,
                ),
              ),
            ),
          ),
          Baseline(
            baselineType: TextBaseline.alphabetic,
            baseline: 21,
            child: Text(
              "전체 동의",
              style: TextStyle(
                  color: isAgreeTerms && isAgreePrivacy
                      ? mainColor
                      : mediumGreyColor,
                  fontSize: 16,
                  fontWeight: fontWeightBold,
                  height: 2.0,
                  leadingDistribution: TextLeadingDistribution.even),
            ),
          ),
        ],
      ),
    );
  }
}
