import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'mixin/selectable_tag_mixin.dart';

/// [SelectableTag] is a [StatelessWidget] that represents a selectable tag.
/// for example this will be used in the adding product logics
final class SelectableTag extends StatefulWidget {
  const SelectableTag({
    super.key,
    required this.source,
    this.onChanged,
    this.value = 1,
  });

  /// [value] is the current selected tag
  final int value;

  /// [source] is a list of strings that will be used as tags
  final List<String> source;

  /// [onChanged] is a function that will be called when the tag is changed
  final void Function(int)? onChanged;

  @override
  State<SelectableTag> createState() => _SelectableTagState();
}

class _SelectableTagState extends State<SelectableTag> with SelectableTagMixin {
  @override
  Widget build(BuildContext context) {
    return ChipsChoice<int>.single(
      value: tagValue,
      onChanged: (value) {
        setState(() {
          tagValue = value;
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        });
      },
      choiceItems: C2Choice.listFrom<int, String>(
        source: widget.source,
        value: (index, item) => index,
        label: (index, item) => item,
      ),
      choiceStyle: C2ChipStyle(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
