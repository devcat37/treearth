// Flutter imports:
import 'package:flutter/material.dart';

class TreeTabBarController with ChangeNotifier {
  TreeTabBarController({
    this.initialPage = 0,
  }) : currentPage = initialPage;

  /// Начальная страница.
  final int initialPage;

  /// Индекс текущей страницы.
  int currentPage;

  /// Изменить страницу.
  void changePage(int page) {
    if (currentPage != page) {
      currentPage = page;

      notifyListeners();
    }
  }
}
