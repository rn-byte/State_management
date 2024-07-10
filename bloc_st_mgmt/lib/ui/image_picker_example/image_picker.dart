import 'dart:io';
import 'package:bloc_st_mgmt/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_st_mgmt/bloc/image_picker/image_picker_events.dart';
import 'package:bloc_st_mgmt/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc ImagePicker Example'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                if (state.file == null) {
                  return const Icon(
                    Icons.image_outlined,
                    size: 100,
                  );
                } else {
                  return Image.file(File(state.file!.path.toString()));
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                context.read<ImagePickerBloc>().add(GalleryImageCapture());
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue[200])),
              child: const Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}
