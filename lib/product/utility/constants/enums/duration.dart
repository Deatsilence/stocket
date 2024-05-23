enum DurationSeconds {
  veryShort,
  short,
  medium,
  long,
  veryLong;

  int get value {
    switch (this) {
      case DurationSeconds.veryShort:
        return 1;
      case DurationSeconds.short:
        return 2;
      case DurationSeconds.medium:
        return 5;
      case DurationSeconds.long:
        return 7;
      default:
        return 1;
    }
  }
}
