import 'package:influxui/influxui.dart';

class PreferenceListTile extends StatelessWidget {
  const PreferenceListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.additionalInfo,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? additionalInfo;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  _onTap() {
    onTap?.call();
  }

  Widget buildAdditionalInfo(BuildContext context) {
    if (additionalInfo != null) {
      return DefaultTextStyle(
        style: const TextStyle(
          color: Color(0xff999999),
          fontSize: 13,
        ),
        child: additionalInfo!,
      );
    } else {
      return Container();
    }
  }

  Widget buildTrailing(BuildContext context) {
    if (trailing != null) {
      return trailing!;
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              minHeight: 48,
            ),
            padding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              children: [
                if (leading != null)
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: leading,
                  ),
                if (title != null || subtitle != null)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (title != null)
                          DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                            child: title!,
                          ),
                        if (subtitle != null)
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.bodySmall!,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: subtitle,
                            ),
                          ),
                      ],
                    ),
                  ),
                buildAdditionalInfo(context),
                buildTrailing(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RadioPreferenceListTile<T> extends PreferenceListTile {
  const RadioPreferenceListTile({
    super.key,
    super.leading,
    super.title,
    super.subtitle,
    super.additionalInfo,
    super.trailing,
    super.onTap,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
  });

  final T? value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;

  @override
  void _onTap() {
    onChanged?.call(value as T);
    super._onTap();
  }

  @override
  Widget buildTrailing(BuildContext context) {
    if (value != null && value == groupValue) {
      return Icon(
        ExtendedIcons.square,
        size: 22,
        color: Theme.of(context).primaryColor,
      );
    }
    return Container();
  }
}

class SwitchPreferenceListTile extends PreferenceListTile {
  const SwitchPreferenceListTile({
    super.key,
    super.leading,
    super.title,
    super.subtitle,
    super.additionalInfo,
    super.trailing,
    super.onTap,
    @required this.value,
    @required this.onChanged,
  });

  final bool? value;
  final ValueChanged<bool>? onChanged;

  @override
  void _onTap() {
    onChanged!(!value!);
    super._onTap();
  }

  @override
  Widget buildAdditionalInfo(BuildContext context) {
    return SizedBox(
      height: 22,
      width: 34,
      child: Transform.scale(
        scale: 0.8,
        child: Switch(
          value: value!,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class TextFieldPreferenceListTile extends PreferenceListTile {
  const TextFieldPreferenceListTile({
    super.key,
    super.leading,
    super.title,
    super.subtitle,
    super.trailing,
    super.onTap,
    this.placeholder,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  });

  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget buildAdditionalInfo(BuildContext context) {
    return Expanded(
      child: TextField(
        // padding: EdgeInsets.zero,
        // decoration: const BoxDecoration(),
        // placeholder: placeholder,
        style: const TextStyle(
          fontSize: 14,
        ),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
      ),
    );
  }
}

class PreferenceListTileChevron extends StatelessWidget {
  const PreferenceListTileChevron({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      ExtendedIcons.chevron_right,
      size: 18,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }
}
