import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'alert_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Alert',
  argTypes: [
    storybook.ArgType<String>(
      'title',
      defaultValue: 'Alert title',
    ),
  ],
)
class AlertMeta extends Meta with _$AlertMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return Alert();
  }
}

@storybook.Story('Default')
class AlertDefaultStory extends StoryObj<AlertMeta>
    with _$AlertDefaultStory {}