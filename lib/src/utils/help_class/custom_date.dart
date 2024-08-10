abstract class CustomDate {
  final int year;
  final int month;

  const CustomDate(this.year, this.month);
}

class JalaliDate extends CustomDate {
  const JalaliDate(super.year, super.month);
}

class GregorianDate extends CustomDate {
  const GregorianDate(super.year, super.month);
}
