// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hong_kong_app/app/core/ui/styles/colors_app.dart';
import 'package:hong_kong_app/app/core/ui/styles/text_styles.dart';

class EcommerceIncrementButton extends StatelessWidget {
  final int amout;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;
  final bool _compact;

  const EcommerceIncrementButton({
    super.key,
    required this.amout,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = false;

  const EcommerceIncrementButton.compact({
    super.key,
    required this.amout,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? EdgeInsets.all(7) : null,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
          onTap: decrementTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '-',
              style: context.textStyles.textMedium
                  .copyWith(fontSize: _compact ? 10 : 22, color: Colors.grey),
            ),
          ),
        ),
        Text(
          amout.toString(),
          style: context.textStyles.textRegular.copyWith(
            fontSize: _compact ? 10 : 17,
            color: context.colors.secondary,
          ),
        ),
        InkWell(
          onTap: incrementTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '+',
              style: context.textStyles.textMedium
                  .copyWith(fontSize: _compact ? 10 : 22, color: Colors.grey),
            ),
          ),
        ),
      ]),
    );
  }
}
