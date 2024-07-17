import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final double size;
  const LoadingWidget({
    super.key,
    this.size = 40,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child:
            //Platform.isIOS
            //?
            const CircularProgressIndicator(
          color: Colors.blue,
        ),
        // : const CupertinoActivityIndicator(
        //     color: Colors.blue,
      ),
    );
  }
}
