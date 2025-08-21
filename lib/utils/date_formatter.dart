import 'package:intl/intl.dart';

String dateFormatter(DateTime createdAt) {
  final formatted = DateFormat('d MMMM y', 'id_ID').format(createdAt);
  return formatted;
}
