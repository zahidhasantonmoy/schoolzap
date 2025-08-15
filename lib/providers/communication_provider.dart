import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/communication_repository.dart';
import 'package:schoolzap/models/conversation.dart';
import 'package:schoolzap/models/message.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final communicationRepositoryProvider = Provider<CommunicationRepository>((ref) {
  return CommunicationRepository(ref.watch(firestoreProvider));
});

final conversationsProvider = FutureProvider.family<List<Conversation>, String>((ref, userId) {
  return ref.watch(communicationRepositoryProvider).getConversations(userId);
});

final messagesProvider = FutureProvider.family<List<Message>, String>((ref, conversationId) {
  return ref.watch(communicationRepositoryProvider).getMessages(conversationId);
});
