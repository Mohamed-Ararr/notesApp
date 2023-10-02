// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:noteapp/view/widgets/appSlogan.dart';

import '../notesView.dart';
import 'logoAndTitle.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 1500),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NotesView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            LogoAndTitle(),
            Spacer(),
            AppSlogan(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
