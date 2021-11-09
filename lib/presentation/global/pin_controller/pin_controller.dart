class PinController {
  PinController({
    this.onChanged,
    this.length = 4,
  }) : pin = List.generate(length, (index) => ' ').join();

  final Function()? onChanged;

  /// Длина пин-кода.
  final int length;

  /// Введенный пользователем пин-код.
  String? pin;
}
