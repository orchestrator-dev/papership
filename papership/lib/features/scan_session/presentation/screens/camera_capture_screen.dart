import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/camera_capture_cubit.dart';
import '../bloc/camera_capture_state.dart';

class CameraCaptureScreen extends StatelessWidget {
  const CameraCaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CameraCaptureCubit>()..captureWithEdgeDetection(),
      child: const _CameraCaptureView(),
    );
  }
}

class _CameraCaptureView extends StatelessWidget {
  const _CameraCaptureView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Capture Page'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: BlocConsumer<CameraCaptureCubit, CameraCaptureState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(failure.message)),
              );
              Navigator.of(context).pop();
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            idle: () => const Center(child: CircularProgressIndicator()),
            capturing: () => const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Processing image...', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            success: (page) => Column(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.memory(
                        page.imageBytes,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.black87,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          context.read<CameraCaptureCubit>().captureWithEdgeDetection();
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retake'),
                        style: TextButton.styleFrom(foregroundColor: Colors.white),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop(page);
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Use this page'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            error: (_) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
