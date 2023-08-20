// WAP that creates List with following value:Delhi, Mumbai, Bangalore, Hyderabad and
// Ahmedabad Replace Ahmedabad with Surat in above List.

void main(List<String> args) {
  List citys = ['Delhi', 'Mumbai', 'Bangalore', 'Hyderabad', 'Ahmedabad'];

  for (int i = 0; i < citys.length; i++) {
    if (citys[i].toString() == 'Ahmedabad') {
      citys[i] = 'Surat';
    }
  }

  print(citys);
}
