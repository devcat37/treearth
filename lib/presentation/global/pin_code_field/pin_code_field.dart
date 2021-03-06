// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/pin_code_field/pin_code_number.dart';
import 'package:treearth/presentation/global/pin_controller/pin_controller.dart';

class PinCodeField extends StatefulWidget {
  const PinCodeField({
    Key? key,
    this.length = 4,
    this.controller,
    this.onComplete,
  }) : super(key: key);

  final int length;
  final PinController? controller;
  final Function(String)? onComplete;

  @override
  State<PinCodeField> createState() => _PinCodeFieldState();
}

class _PinCodeFieldState extends State<PinCodeField> {
  @override
  void initState() {
    widget.controller?.addListener(() {
      if (mounted) setState(() {});
      if (widget.controller?.pin?.length == widget.controller?.length && widget.onComplete != null)
        widget.onComplete!(widget.controller?.pin ?? '');
    });

    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(() {});

    super.dispose();
  }

  Widget _buildField(BuildContext context) {
    final padding = (4 / widget.length) * sidePadding;
    final width =
        (MediaQuery.of(context).size.width - sidePadding32 * 2 - padding * (widget.length - 1)) / widget.length;

    return Container(
      width: width,
      height: width * 4 / 3,
      decoration: BoxDecoration(
        color: surfaceGreyColor,
        borderRadius: borderRadius12,
      ),
    );
  }

  Widget _buildNumber(BuildContext context, String value) {
    return Center(
      child: PinCodeNumber(value, size: (4 / widget.length) * sidePadding48),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: sidePadding32),
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.length, (index) {
          final value = index >= (widget.controller?.pin ?? '').length
              ? ''
              : widget.controller?.pin?.split('').elementAt(index) ?? '';

          return Stack(
            alignment: Alignment.center,
            children: [
              _buildField(context),
              if (value.isNotEmpty) _buildNumber(context, value),
            ],
          );
        }),
      ),
    );
  }
}
