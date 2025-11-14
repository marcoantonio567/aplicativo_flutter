class LinkedLabelViewModel {
  final String fullText;
  final String linkedText;
  final Function()? onLinkTap;
  final bool isLoading;

  LinkedLabelViewModel({
    required this.fullText,
    required this.linkedText,
    required this.onLinkTap,
    this.isLoading = false,
  });
}