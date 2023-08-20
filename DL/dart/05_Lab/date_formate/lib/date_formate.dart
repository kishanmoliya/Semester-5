import 'package:intl/intl.dart';

void dateFormate() {
  var currentDate = DateTime.now();

  print(currentDate);

  print(DateFormat('yyyy-MM-dd').format(currentDate));
  print(DateFormat('dd/MM/yyyy').format(currentDate)); // dd/MM/yyyy
  print(DateFormat('dd-MM-yyyy').format(currentDate)); // dd-MM-yyyy
  print(DateFormat('dd-MMM-yyyy').format(currentDate)); // dd-MMM-yyyy
  print(DateFormat('dd-MM-yy').format(currentDate)); // dd-MM-yy
  print(DateFormat('dd MMM yyyy').format(currentDate)); // dd MMM yyyy
}
