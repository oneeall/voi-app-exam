import 'package:logger/logger.dart';

var logger = Logger(
  filter: DevelopmentFilter(),
  printer: PrettyPrinter(methodCount: 5),
);
