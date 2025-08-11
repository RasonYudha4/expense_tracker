import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/enums/navbar_items.dart';
import 'evaluation/blocs/bloc/selected_bloc.dart';
import 'evaluation/views/evaluation.dart';
import 'evaluation/views/evaluation_page.dart';
import 'history/views/history_page.dart';
import 'home/view/dummy.dart';
import 'home/view/home_page.dart';
import '../cubit/navigation_cubit.dart';
import '../widgets/navigation_bar.dart';
import 'insert/widgets/image_picker.dart';
import 'profile/views/profile_page.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<CameraDescription> _cameras = [];
  bool _camerasInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    try {
      _cameras = await availableCameras();
      setState(() {
        _camerasInitialized = true;
      });
    } catch (e) {
      print('Error initializing cameras: $e');
      setState(() {
        _camerasInitialized =
            true; // Set to true even on error to avoid infinite loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return Dummy();
          } else if (state.navbarItem == NavbarItem.evaluation) {
            return EvaluationPage();
          } else if (state.navbarItem == NavbarItem.insert) {
            return _buildCameraScreen();
          } else if (state.navbarItem == NavbarItem.history) {
            return HistoryPage();
          } else if (state.navbarItem == NavbarItem.profile) {
            return ProfilePage();
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildCameraScreen() {
    if (!_camerasInitialized) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Initializing camera...'),
            ],
          ),
        ),
      );
    }

    if (_cameras.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Camera')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt_outlined, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No camera available',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Please check camera permissions',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    // Use the first available camera (usually back camera)
    return TakePictureScreen(camera: _cameras.first);
  }
}
