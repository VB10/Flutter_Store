import 'package:flutter/material.dart';

extension FutureExtension on Future {
  Widget toBuild<T>(
      {Widget Function(T data) onSuccess, Widget onError, dynamic data}) {
    return FutureBuilder<T>(
      future: this,
      initialData: data,
      builder: (BuildContext contexti, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if (snapshot.hasData)
              return onSuccess(snapshot.data);
            else
              return onError ?? CircularProgressIndicator();
            break;
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}
