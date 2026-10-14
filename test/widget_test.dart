import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/screens/home_screen.dart';
import 'package:my_portfolio/theme/app_colors.dart';

void main() {
  testWidgets('home profile stays centered and stacks beneath its title', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    appDarkMode.value = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        home: HomeScreen(onEnterPortfolio: () {}),
      ),
    );
    await tester.pumpAndSettle();

    final photo = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              'assets/images/ika_hero.jpeg',
    );
    final name = find.text('IKA WAHYUNINGTYAS');

    expect(photo, findsOneWidget);
    expect(name, findsOneWidget);
    expect(
      tester.getCenter(photo).dx,
      closeTo(tester.view.physicalSize.width / 2, 1),
    );
    expect(
      tester.getTopLeft(name).dy,
      greaterThan(tester.getBottomRight(photo).dy),
    );
    expect(tester.takeException(), isNull);

    final gradientContainer = tester.widget<Container>(
      find
          .ancestor(
            of: photo,
            matching: find.byWidgetPredicate(
              (widget) =>
                  widget is Container &&
                  widget.decoration is BoxDecoration &&
                  (widget.decoration as BoxDecoration).gradient != null,
            ),
          )
          .first,
    );
    final lightGradient =
        (gradientContainer.decoration! as BoxDecoration).gradient!
            as LinearGradient;
    expect(lightGradient.colors.first, const Color(0xFF3B82C4));

    appDarkMode.value = true;
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: HomeScreen(onEnterPortfolio: () {}),
      ),
    );
    await tester.pumpAndSettle();

    final darkGradientContainer = tester.widget<Container>(
      find
          .ancestor(
            of: photo,
            matching: find.byWidgetPredicate(
              (widget) =>
                  widget is Container &&
                  widget.decoration is BoxDecoration &&
                  (widget.decoration as BoxDecoration).gradient != null,
            ),
          )
          .first,
    );
    final darkGradient =
        (darkGradientContainer.decoration! as BoxDecoration).gradient!
            as LinearGradient;
    expect(darkGradient.colors, const [
      Color(0xFF071426),
      Color(0xFF102A56),
      Color(0xFF251B46),
    ]);
    expect(tester.takeException(), isNull);
    appDarkMode.value = false;
  });
}
