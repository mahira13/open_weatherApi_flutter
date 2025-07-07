import 'package:flutter/material.dart';
import 'package:weather_app/utils/extensions/widget_extensions.dart';

import 'constants/app_colors.dart';

Text getText14HeadingWidget(String text, {required BuildContext context}) {
  return Text(
    // textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.headlineSmall,
  );
}

Text getText16HeadingWidget(String text, {required BuildContext context}) {
  return Text(
    // textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.headlineMedium,
  );
}

Text getText16Body(String text, {required BuildContext context}) {
  return Text(
    // textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodyMedium,
  );
}

Text getText18HeadingWidget(String text, {required BuildContext context}) {
  return Text(
    // textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.headlineLarge,
  );
}

Text getText20HeadingWidget(String text, {required BuildContext context}) {
  return Text(
    // textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.displayMedium,
  );
}

Text getText24HeadingWidget(String text, {required BuildContext context}) {
  return Text(
    // textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.displayLarge,
  );
}

Text getTextRegularHeadingWidget(String text,
    {TextAlign textAlign = TextAlign.start, required BuildContext context}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.headlineSmall,
    textAlign: textAlign,
  );
}

Widget loading({String? content}) {
  return Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: primaryColor,
          ),
          Text(content ?? "").paddingTop(16)
        ]),
  ).paddingTop(200);
}

Widget widgetWithPadding(
  var widget, {
  double top = 16,
  double bottom = 16,
  double left = 16,
  double right = 16,
}) {
  return Padding(
    padding:
        EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
    child: widget,
  );
}

Widget getElevatedButton(String text,
    {required VoidCallback onPressed, required BuildContext context}) {
  return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: onPressed,
      child: Text(text));
}

Widget getTextButton(String text,
    {required VoidCallback onPressed, required BuildContext context}) {
  return TextButton(
      style: Theme.of(context).textButtonTheme.style,
      onPressed: onPressed,
      child: Text(text));
}
