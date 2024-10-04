import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarBuilder extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blueGrey.shade900,
      flexibleSpace: Center(
        child: SvgPicture.asset(
          'assets/heethings_logo_dark.svg',
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
