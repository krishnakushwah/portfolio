import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.outlined = false,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[Icon(icon, size: 18), const SizedBox(width: 10)],
        Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      ],
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );
    if (outlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.primary.withValues(alpha: .65)),
          shape: shape,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
        child: child,
      );
    }

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: shape,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      ),
      child: child,
    );
  }
}
