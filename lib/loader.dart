
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({
    Key? key,
    this.isLinear,

    this.child,
    this.color,
  }) : super(key: key);
  final bool? isLinear;

  final Widget? child;
  final Color? color;

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  Color _buildDefaultColor() {
    return Theme.of(context).brightness == Brightness.light
        ? Theme.of(context).colorScheme.primary
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLinear == true) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.color ?? _buildDefaultColor(),
          ),
        ),
      );
    }


    return SizedBox(
      height: 17,
      width: 17,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.color ?? _buildDefaultColor(),
        ),
      ),
    );
  }
}
