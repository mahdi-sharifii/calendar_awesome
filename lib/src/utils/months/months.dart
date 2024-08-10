abstract class Month {
  final String name;
  final int id;
  final int days;
  const Month(this.name, this.id, this.days);
}

/// jalali
class PersianMonth extends Month {
  PersianMonth(super.name, super.id, super.days);
}

/// Gregoryan
class GregorianMonth extends Month {
  GregorianMonth(super.name, super.id, super.days);
}

class MonthCreator {
  /// get month at id "jalali"&"Gregorian"
  static  getMonAtID(int id, bool isLeapYear, bool isJalali) {
    if (isJalali) {
      switch (id) {
        case 1:
          return PersianMons.getFarvardin();

        case 2:
          return PersianMons.getOrdibehehesht();

        case 3:
          return PersianMons.getKhordad();

        case 4:
          return PersianMons.getTir();
        case 5:
          return PersianMons.getMordad();
        case 6:
          return PersianMons.getShahrivar();
        case 7:
          return PersianMons.getMehr();
        case 8:
          return PersianMons.getAban();
        case 9:
          return PersianMons.getAzar();
        case 10:
          return PersianMons.getDei();
        case 11:
          return PersianMons.getBahman();
        case 12:
          return PersianMons.getEsfand(isLeapYear);
      }
    }

    switch (id) {
      case 1:
        return GregorianMons.january();
      case 2:
        return GregorianMons.february(isLeapYear);
      case 3:
        return GregorianMons.march();
      case 4:
        return GregorianMons.april();
      case 5:
        return GregorianMons.may();
      case 6:
        return GregorianMons.june();
      case 7:
        return GregorianMons.july();
      case 8:
        return GregorianMons.august();
      case 9:
        return GregorianMons.september();
      case 10:
        return GregorianMons.october();
      case 11:
        return GregorianMons.november();
      case 12:
        return GregorianMons.december();
    }
  }
}

class PersianMons {
  static PersianMonth getFarvardin() {
    return PersianMonth("فروردین", 1, 31);
  }

  static PersianMonth getOrdibehehesht() {
    return PersianMonth("اردیبهشت", 2, 31);
  }

  static PersianMonth getKhordad() {
    return PersianMonth("خرداد", 3, 31);
  }

  static PersianMonth getTir() {
    return PersianMonth("تیر", 4, 31);
  }

  static PersianMonth getMordad() {
    return PersianMonth("مرداد", 5, 31);
  }

  static PersianMonth getShahrivar() {
    return PersianMonth("شهریور", 6, 31);
  }

  static PersianMonth getMehr() {
    return PersianMonth("مهر", 7, 30);
  }

  static PersianMonth getAban() {
    return PersianMonth("ابان", 8, 30);
  }

  static PersianMonth getAzar() {
    return PersianMonth("اذر", 9, 30);
  }

  static PersianMonth getDei() {
    return PersianMonth("دی", 10, 30);
  }

  static PersianMonth getBahman() {
    return PersianMonth("بهمن", 11, 30);
  }

  static PersianMonth getEsfand(bool isLeapYear) {
    return PersianMonth("اسفند", 12, isLeapYear ? 30 : 29);
  }
}

class GregorianMons {
  static january() {
    return GregorianMonth("January", 1, 31);
  }

  static february(bool isLeapYear) {
    return GregorianMonth("February", 2, isLeapYear ? 29 : 28);
  }

  static march() {
    return GregorianMonth("March", 3, 31);
  }

  static april() {
    return GregorianMonth("April", 4, 30);
  }

  static may() {
    return GregorianMonth("May", 5, 31);
  }

  static june() {
    return GregorianMonth("June", 6, 30);
  }

  static july() {
    return GregorianMonth("July", 7, 31);
  }

  static august() {
    return GregorianMonth("August", 8, 31);
  }

  static september() {
    return GregorianMonth("September", 9, 30);
  }

  static october() {
    return GregorianMonth("October", 10, 31);
  }

  static november() {
    return GregorianMonth("November", 11, 30);
  }

  static december() {
    return GregorianMonth("December", 12, 31);
  }
}
