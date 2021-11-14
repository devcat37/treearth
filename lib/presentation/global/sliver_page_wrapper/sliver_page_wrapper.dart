// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/mocks/mock_uuid.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/app_bar_back.dart';

class SliverPageWrapper extends StatefulWidget {
  const SliverPageWrapper({
    Key? key,
    required this.headerImage,
    required this.title,
    required this.content,
  }) : super(key: key);

  static const defaultExpandedHeight = 250.0;
  static const defaultLipHeight = sidePadding32;

  final String title;
  final String headerImage;
  final Widget content;

  @override
  _SliverPageWrapperState createState() => _SliverPageWrapperState();
}

class _SliverPageWrapperState extends State<SliverPageWrapper> {
  final ScrollController _scrollController = ScrollController();
  double _lipOpacity = 1.0;
  bool _showLip = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _lipOpacity = ((SliverPageWrapper.defaultExpandedHeight - kToolbarHeight - _scrollController.offset) /
                SliverPageWrapper.defaultLipHeight)
            .clamp(0, 1.0);
      });

      if (_scrollController.offset >= SliverPageWrapper.defaultExpandedHeight - kToolbarHeight) {
        setState(() {
          _showLip = false;
        });
      } else {
        setState(() {
          _showLip = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    if (mounted) _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: SliverPageWrapper.defaultExpandedHeight,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: sidePadding16),
              child: AppBarBack(color: _showLip ? whiteColor : blackColor),
            ),
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: blackColor.withOpacity(1 - _lipOpacity),
                  ),
            ),
            flexibleSpace: Stack(
              children: [
                AnimatedContainer(
                  duration: defaultAnimationDuration * 0.2,
                  decoration: BoxDecoration(
                    image: _showLip
                        ? DecorationImage(
                            image: AssetImage(widget.headerImage),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                AnimatedContainer(
                  duration: defaultAnimationDuration * 0.2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [blackColor, Colors.transparent],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: defaultAnimationDuration * 0.2,
                  decoration: BoxDecoration(
                    color: whiteColor.withOpacity(((1 - _lipOpacity) * 1.5).clamp(0, 1.0)),
                  ),
                ),
                if (_showLip)
                  Positioned(
                    child: AnimatedContainer(
                      duration: defaultAnimationDuration * 0.2,
                      height: SliverPageWrapper.defaultLipHeight,
                      decoration: BoxDecoration(
                        color: whiteColor.withOpacity(_lipOpacity),
                        borderRadius: BorderRadius.vertical(
                          top: radiusCircular32,
                        ),
                      ),
                    ),
                    bottom: -1,
                    left: 0,
                    right: 0,
                  ),
                Positioned(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline3!.copyWith(color: whiteColor),
                  ),
                  bottom: SliverPageWrapper.defaultLipHeight + sidePadding,
                  left: sidePadding,
                  right: sidePadding,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [widget.content],
            ),
          ),
        ],
      ),
    );
  }
}
