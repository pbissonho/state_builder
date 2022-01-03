import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponseStateBuilder<Loading, Error, Success>
    extends StatelessWidget {
  const ResponseStateBuilder({
    required this.bloc,
    required this.successWidgetBuilder,
    required this.errorWidgetBuilder,
    this.loadingWidgetBuilder,
    Key? key,
  }) : super(key: key);

  final Widget Function(Success success) successWidgetBuilder;
  final Widget Function(Error error) errorWidgetBuilder;
  final BlocBase bloc;
  final Widget Function()? loadingWidgetBuilder;

  @override
  Widget build(BuildContext context) => BlocBuilder(
      bloc: bloc,
      builder: (_, state) {
        if (state == null || state is Loading) {
          return Center(
            child: const Text('LOADINGG'),
          );
        } else if (state is Error) {
          return errorWidgetBuilder(state as Error);
        } else if (state is Success) {
          return successWidgetBuilder(state as Success);
        }

        throw UnknownStateTypeException();
      });
}

class UnknownStateTypeException implements Exception {}