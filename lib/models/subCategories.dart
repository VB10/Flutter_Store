import 'package:meta/meta.dart';

class SubCategoires {
  final String name;
  final int colorType;

  const SubCategoires({
    @required this.name,
    @required this.colorType,
  });
}

List<SubCategoires> fillSubs() {
  List<SubCategoires> sub = List<SubCategoires>();
  sub.add(SubCategoires(name: "Gorengen", colorType: 1));
  sub.add(SubCategoires(name: "Makanan Ringan", colorType: 2));
  sub.add(SubCategoires(name: "Makanan ", colorType: 3));
  sub.add(SubCategoires(name: " Ringan", colorType: 4));
  return sub;
}
