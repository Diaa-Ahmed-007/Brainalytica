import 'package:flutter/material.dart';

class ChatBotAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatBotAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor:
          theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
      elevation: 2,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.chat,
            color: theme.colorScheme.onPrimary,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            "Shopping assistant",
            style: theme.textTheme.titleMedium
                ?.copyWith(color: theme.colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
