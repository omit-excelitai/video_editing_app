import 'package:flutter/material.dart';

import '../../widgets/custom_edit_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B4461),
      body: CustomEditButton(),
    );
  }
}
