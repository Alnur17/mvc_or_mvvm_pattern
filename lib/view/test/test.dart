import 'package:flutter/material.dart';

class FadedButton extends StatefulWidget {
  const FadedButton({super.key});

  @override
  State<FadedButton> createState() => _FadedButtonState();
}

class _FadedButtonState extends State<FadedButton> {
  final ScrollController _scrollController = ScrollController();
  double _fabOpacity = 1.0;
  double _fabBottomPosition = 16.0; // Initial position of the button

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Calculate current scroll position
    double scrollPosition = _scrollController.position.pixels;

    // Start of the icons section
    double iconStartPosition = _scrollController.position.maxScrollExtent - 200;

    // End of the icons section (adjust based on your content)
    double iconEndPosition = _scrollController.position.maxScrollExtent;

    // Calculate visibility percentage of the icons section
    double iconVisibilityPercentage = 0.0;
    if (scrollPosition >= iconStartPosition) {
      iconVisibilityPercentage = (scrollPosition - iconStartPosition) /
          (iconEndPosition - iconStartPosition);
      iconVisibilityPercentage = iconVisibilityPercentage.clamp(0.0, 1.0);
    }

    // Update button opacity and position based on icon visibility percentage
    setState(() {
      _fabOpacity = 1.0 - iconVisibilityPercentage;
      _fabBottomPosition = 16.0 + (64.0 * iconVisibilityPercentage); // Moves up as it fades
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percentage-based Fading Button')),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.list),
                      title: Text('Item $index'),
                    );
                  },
                ),
                // Icons to show at the end of the list
                const Icon(Icons.stadium, size: 50),
                const Icon(Icons.stadium, size: 50),
                const Icon(Icons.stadium, size: 50),
                const Icon(Icons.stadium, size: 50),
              ],
            ),
          ),
          // Positioned button with simultaneous movement and fading
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            right: 16,
            bottom: _fabBottomPosition, // Dynamic position based on scroll percentage
            child: AnimatedOpacity(
              opacity: _fabOpacity,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
