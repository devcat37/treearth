// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/pages/workspace/workspace.dart';

bool canPop(BuildContext context) => Navigator.of(context).canPop();

void pop(BuildContext context) => Navigator.of(context).pop();

void goToMainPage(BuildContext context) => Navigator.of(context).pushReplacementNamed(Workspace.routeName);
