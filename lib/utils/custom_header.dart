import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';

typedef _RequestTransformer = FutureOr<Request> Function(Request request);

class CustomAuthLink extends _AsyncReqTransformLink {
  CustomAuthLink({
    required this.getHeaders,
  }) : super(requestTransformer: transform(getHeaders));

  final FutureOr<Map<String, String>>? Function() getHeaders;

  static _RequestTransformer transform(
    FutureOr<Map<String, String>>? Function() getHeaders,
  ) =>
      (Request request) async {
        final Map<String, String>? headers = await getHeaders();
        return request.updateContextEntry<HttpLinkHeaders>(
          (_headers) => HttpLinkHeaders(
            headers: headers!,
          ),
        );
      };
}

class _AsyncReqTransformLink extends Link {
  final _RequestTransformer requestTransformer;

  _AsyncReqTransformLink({
    required this.requestTransformer,
  });

  @override
  Stream<Response> request(
    Request request, [
    NextLink? forward,
  ]) async* {
    final req = await requestTransformer(request);

    yield* forward!(req);
  }
}
