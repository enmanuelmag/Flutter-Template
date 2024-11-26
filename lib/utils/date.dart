import 'package:easy_localization/easy_localization.dart';

enum DateFormatType {
  ddMMyyyy,
  ddMMyyyyHHmmss,
  HHmmss,
  HHmm,
}

String formatDateTime({
  required DateTime? dateTime,
  DateFormatType formatType = DateFormatType.ddMMyyyy,
}) {
  String formattedDate = '';

  if (dateTime == null) {
    return formattedDate;
  }

  switch (formatType) {
    case DateFormatType.ddMMyyyy:
      formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
      break;
    case DateFormatType.ddMMyyyyHHmmss:
      formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
      break;
    case DateFormatType.HHmmss:
      formattedDate = DateFormat('HH:mm:ss').format(dateTime);
      break;
    case DateFormatType.HHmm:
      formattedDate = DateFormat('HH:mm').format(dateTime);
      break;
  }

  return DateFormat(formattedDate).format(dateTime);
}
