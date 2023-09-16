import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sajhasync/config/constants/app_color_theme.dart';

class AskPoster extends ConsumerStatefulWidget {
  const AskPoster({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AskPosterState();
}

class _AskPosterState extends ConsumerState<AskPoster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'What do you want to do?',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bodyColors,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              width: 350,
              child: Center(
                child: Text(
                  'Put your flat up for sharing?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.appbarColors,
                    fontFamily: 'Hind',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bodyColors,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              width: 350,
              child: Center(
                child: Text(
                  'Put your room/flat for rent?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.appbarColors,
                    fontFamily: 'Hind',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
