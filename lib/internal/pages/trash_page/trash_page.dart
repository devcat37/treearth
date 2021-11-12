// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/presentation/pages/trash_page/trash_page_view.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({
    Key? key,
    required this.trash,
  }) : super(key: key);

  static const routeName = '/trash-page';

  final TrashSpot trash;

  @override
  Widget build(BuildContext context) {
    return TrashPageView(trash: trash);
  }
}
