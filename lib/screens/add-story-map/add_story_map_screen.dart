import 'package:belajar_aplikasi_flutter_intermediate/shared/widgets/maps/app_map.dart';
import 'package:flutter/material.dart';

class AddStoryMapScreen extends StatefulWidget {
  const AddStoryMapScreen({super.key});

  @override
  State<AddStoryMapScreen> createState() => _AddStoryMapScreenState();
}

class _AddStoryMapScreenState extends State<AddStoryMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppMap(initialLat: -6.170166, initialLon: 106.831375),
      ),
    );
  }
}
