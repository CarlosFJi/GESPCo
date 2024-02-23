import "dart:convert";

import "package:gespco/src/pages/event_list/events_controller.dart";
import "package:gespco/src/services/readJson/readJson.dart";
import "package:gespco/src/shared/environment/environment.dart";
import "package:googleapis/pubsub/v1.dart";
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart';
import "../providers/providers.dart";

class PubSubService {
  const PubSubService({this.httpClientProvider = Providers.freshHttpClient});
  final httpClientProvider;

  // Use service account credentials to get an authenticated and auto refreshing client.
  Future<AuthClient> obtainAuthenticatedClient() async {
    final controllerEvent = ControllerEvents();

    readingJson().readAccount();
    final json = await controllerEvent.readAccountJson();
    final accountCredentials = ServiceAccountCredentials.fromJson(json);
    var scopes = [PubsubApi.cloudPlatformScope];

    AuthClient client =
        await clientViaServiceAccount(accountCredentials, scopes);

    return client; // Remember to close the client when you are finished with it.
  }

  Future<List<String>> publish(String topic, dynamic json) async {
    final AuthClient authClient = await obtainAuthenticatedClient();
    final PubsubApi pubsubApi = PubsubApi(authClient);

    final String messageData = json;
    final List<int> messageBytes = utf8.encode(messageData);
    final String messageBase64 = base64Encode(messageBytes);
    print('pubsub messageData=${messageData}');
    final PublishRequest request = PublishRequest(
      messages: <PubsubMessage>[
        PubsubMessage(data: messageBase64),
      ],
    );

    final String fullTopicName = 'projects/gespco-cfj5b1/topics/$topic';

    print('pubsub fullTopicName=${fullTopicName}');

    final PublishResponse response =
        await pubsubApi.projects.topics.publish(request, fullTopicName);
    print('pubsub response messageId=${response}');
    return response.messageIds!;
  }
}
