import 'package:blc_st_mgmt_clean_archit/config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.cloud_off_rounded,
            color: AppColors.redColor,
            size: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'We\'re unable to show result.\nPlease check Internet \nconnection.',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          ElevatedButton(
              onPressed: onPress,
              child: Text(
                'Retry',
                style: Theme.of(context).textTheme.bodySmall,
              ))
        ],
      ),
    );
  }
}
