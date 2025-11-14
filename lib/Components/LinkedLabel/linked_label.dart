import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'linked_label_view_model.dart';
import '../../shared/styles.dart';
import '../../shared/shimmer.dart';

class LinkedLabel extends StatelessWidget {
  final LinkedLabelViewModel viewModel;

  const LinkedLabel._({super.key, required this.viewModel});

  static Widget instantiate({Key? key, required LinkedLabelViewModel viewModel}) {
    return LinkedLabel._(key: key, viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoading) {
      return const ShimmerContainer(width: 200, height: 14, borderRadius: BorderRadius.all(Radius.circular(4)));
    }
    final int startIndex = viewModel.fullText.indexOf(viewModel.linkedText);
    final int endIndex = startIndex + viewModel.linkedText.length;

    if (startIndex == -1) {
      return Text(viewModel.fullText);
    }

    return RichText(
      text: TextSpan(
        text: viewModel.fullText.substring(0, startIndex),
        style: label2Semibold,
        children: [
          TextSpan(
            text: viewModel.linkedText,
            style: labelLinkSemibold,
            recognizer: TapGestureRecognizer()..onTap = viewModel.onLinkTap,
          ),
          TextSpan(
            text: viewModel.fullText.substring(endIndex),
            style: label2Semibold,
          ),
        ],
      ),
    );
  }
}
