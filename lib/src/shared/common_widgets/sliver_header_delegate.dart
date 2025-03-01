import 'package:flutter/material.dart';

class CBSliverHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final bool rebuild;
  final double minExt, maxExt;

  CBSliverHeader({
    required this.child,
    required this.maxExt,
    required this.minExt,
    required this.rebuild
  });

  @override
  double get minExtent => minExt;

  @override
  double get maxExtent => maxExt;

  @override
  Widget build(_, __, ___) => child;

  @override
  bool shouldRebuild(_) => rebuild;
}
