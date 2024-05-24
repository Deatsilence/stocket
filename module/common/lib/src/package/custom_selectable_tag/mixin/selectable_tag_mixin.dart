import 'dart:developer';

import 'package:common/src/package/custom_selectable_tag/selectable_tag.dart';
import 'package:flutter/material.dart';

mixin SelectableTagMixin on State<SelectableTag> {
  /// [_tag] is the current selected tag
  late int _tag;

  /// [tagValue] is the current selected tag
  int get tagValue => _tag;

  set tagValue(int value) => _tag = value;

  @override
  void initState() {
    super.initState();
    _tag = widget.value;
    log('TAGINIT $tagValue');
  }
}
