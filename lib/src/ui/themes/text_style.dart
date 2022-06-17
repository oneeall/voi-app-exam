import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/src/ui/themes/colors.dart';

class TextThemeVoila {
  late BuildContext localContext;

  static TextThemeVoila? _current;

  TextThemeVoila(BuildContext context) {
    localContext = context;
  }

  static TextThemeVoila get current => _current!;

  static TextThemeVoila init(BuildContext context) {
    return _current ??= TextThemeVoila(context);
  }

  TextStyle get headline1 {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .headline1!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 48,
        color: kNeutral3,
        height: 0.96,
        fontWeight: FontWeight.bold,
        letterSpacing: 0);
  }

  TextStyle get headline2 {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .headline2!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 40,
        color: kNeutral3,
        height: 0.99,
        fontWeight: FontWeight.bold,
    letterSpacing: 0);
  }

  TextStyle get headline3 {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .headline3!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 32,
        color: kNeutral3,
        fontWeight: FontWeight.bold,
        height: 1.03,
        letterSpacing: 0);
  }

  TextStyle get headline4 {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .headline4!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 24,
        color: kNeutral3,
        fontWeight: FontWeight.bold,
        height: 1.10,
        letterSpacing: 0);
  }

  TextStyle get headline5 {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .headline5!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 16,
        color: kNeutral3,
        fontWeight: FontWeight.bold,
        height: 1.24,
        letterSpacing: 0);
  }

  TextStyle get body1Regular {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .bodyText1!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 16,
        color: kNeutral3,
        fontWeight: FontWeight.normal,
        height: 1.24,
        letterSpacing: 0);
  }

  TextStyle get body1Medium {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .bodyText2!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 16,
        color: kNeutral3,
        fontWeight: FontWeight.w500,
        height: 1.24,
        letterSpacing: 0);
  }

  TextStyle get body1Bold {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .bodyText2!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 16,
        color: kNeutral3,
        fontWeight: FontWeight.bold,
        height: 1.24,
        letterSpacing: 0);
  }

  TextStyle get body2Regular {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .bodyText1!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 14,
        color: kNeutral3,
        fontWeight: FontWeight.normal,
        height: 1.24,
        letterSpacing: 0);
  }

  TextStyle get body2Medium {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .bodyText2!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 14,
        color: kNeutral3,
        fontWeight: FontWeight.w500,
        height: 1.24,
        letterSpacing: 0);
  }

  TextStyle get body2Bold {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .bodyText2!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 14,
        color: kNeutral3,
        fontWeight: FontWeight.bold,
        height: 1.24,
        letterSpacing: 0);
  }

  TextStyle get caption {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .caption!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 12,
        color: kNeutral3,
        fontWeight: FontWeight.normal,
        height: 1.10,
        letterSpacing: 0);
  }

  TextStyle get captionLineThrough {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .caption!
            .copyWith(
            leadingDistribution: TextLeadingDistribution.even,
            decoration: TextDecoration.lineThrough),
        fontSize: 12,
        color: kNeutral3,
        fontWeight: FontWeight.w500,
        height: 1.10,
        letterSpacing: 0);
  }

  TextStyle get captionBold {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .caption!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 12,
        color: kNeutral3,
        fontWeight: FontWeight.bold,
        height: 1.10,
        letterSpacing: 0);
  }

  TextStyle get footer {
    return GoogleFonts.inter(
        textStyle: Theme
            .of(localContext)
            .textTheme
            .overline!
            .copyWith(leadingDistribution: TextLeadingDistribution.even),
        fontSize: 10,
        color: kNeutral3,
        fontWeight: FontWeight.normal,
        height: 0.94,
        letterSpacing: 0.5);
  }
}
