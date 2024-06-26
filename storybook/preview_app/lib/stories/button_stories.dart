import 'package:influxui/influxui.dart';
import 'package:preview_app/utils/constants.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'button_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Button',
  argTypes: [
    storybook.ArgType<String>(
      'label',
      defaultValue: 'Button',
    ),
  ],
)
class ButtonMeta extends Meta with _$ButtonMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return Button(
      label: 'Button',
      variant: ButtonVariant.filled,
      onPressed: () {},
    );
  }
}

@storybook.Story('Default')
class ButtonDefaultStory extends StoryObj<ButtonMeta>
    with _$ButtonDefaultStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: Button(
          label: 'Button',
          variant: ButtonVariant.filled,
          onPressed: () {},
        ),
      ),
    );
  }
}

@storybook.Story(
  'With Variant',
)
class ButtonWithVariantStory extends StoryObj<ButtonMeta>
    with _$ButtonWithVariantStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in ButtonVariant.values)
          Button(
            variant: variant,
            label: 'Button',
            onPressed: () {},
          ),
      ],
    );
  }
}

@storybook.Story(
  'With Size',
  args: [
    storybook.Arg<String>('size'),
  ],
)
class ButtonWithSizeStory extends StoryObj<ButtonMeta>
    with _$ButtonWithSizeStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in ButtonVariant.values)
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              for (final size in kExtendedSizes)
                Button(
                  label: 'Button',
                  variant: variant,
                  size: size,
                  onPressed: () {},
                ),
            ],
          ),
      ],
    );
  }
}

@storybook.Story(
  'With Color',
)
class ButtonWithColorStory extends StoryObj<ButtonMeta>
    with _$ButtonWithColorStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final color in kExtendedColors)
          Wrap(
            spacing: 10,
            children: [
              for (final variant in ButtonVariant.values)
                Button(
                  label: 'Button',
                  variant: variant,
                  color: color,
                  onPressed: () {},
                ),
            ],
          ),
      ],
    );
  }
}
