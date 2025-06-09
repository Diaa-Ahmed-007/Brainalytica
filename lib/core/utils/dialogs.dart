import 'package:doctors/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomDialogs {
  /// **Show Error Dialog**
  static void showErrorDialog(BuildContext context, String message) {
    _showDialog(
      context,
      icon: Icons.error_outline,
      iconColor: Colors.red,
      title: 'Error',
      content: message,
      actions: [
        _buildDialogButton(
          label: 'Try Again',
          onPressed: () => Navigator.pop(context),
          color: Colors.redAccent,
        ),
      ],
    );
  }

  /// **Show Success Dialog**
  static void showSuccessDialog(BuildContext context, String message,
      {Function()? onPressed}) {
    _showDialog(
      context,
      icon: Icons.check_circle_outline,
      iconColor: Colors.green,
      title: 'Success',
      content: message,
      actions: [
        _buildDialogButton(
          label: 'OK',
          onPressed: onPressed ?? () => Navigator.pop(context),
          color: Colors.green,
        ),
      ],
    );
  }

  /// **Show Loading Dialog**
  static void showLoadingDialog(BuildContext context) {
    _showDialog(
      context,
      icon: Icons.hourglass_empty,
      iconColor: AppColors.primaryColor,
      title: 'Please Wait...',
      customContent: LoadingAnimationWidget.fourRotatingDots(
        color: AppColors.primaryColor.withOpacity(0.7),
        size: MediaQuery.of(context).size.width * 0.12,
      ),
      barrierDismissible: false, // Prevents closing while loading
    );
  }

  /// **Show Confirmation Dialog**
  static void showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
    required IconData icon,
    required Color iconColor,
    required String cancelLabel,
    required String confirmationLabel,
    required Color confirmationColor,
  }) {
    _showDialog(
      context,
      icon: icon,
      iconColor: iconColor,
      title: title,
      content: content,
      actions: [
        _buildDialogButton(
          label: cancelLabel,
          onPressed: () => Navigator.pop(context),
          color: Colors.grey,
          isOutlined: true,
        ),
        const SizedBox(width: 16),
        _buildDialogButton(
          label: confirmationLabel,
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          color: confirmationColor,
        ),
      ],
    );
  }

  /// **Close Any Open Dialog**
  static void closeDialogs(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  /// **Private Dialog Builder**
  static void _showDialog(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    String? content,
    Widget? customContent,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            width: screenWidth * 0.8,
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: iconColor, size: screenWidth * 0.14),
                SizedBox(height: screenHeight * 0.02),
                Text(title,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87)),
                if (content != null) ...[
                  SizedBox(height: screenHeight * 0.01),
                  Text(content,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black54)),
                ],
                if (customContent != null) ...[
                  SizedBox(height: screenHeight * 0.02),
                  customContent,
                ],
                if (actions != null) ...[
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: actions),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  /// **Custom Button Builder**
  static Widget _buildDialogButton({
    required String label,
    required VoidCallback onPressed,
    required Color color,
    bool isOutlined = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                side: BorderSide(color: color),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: color)),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
    );
  }
}
