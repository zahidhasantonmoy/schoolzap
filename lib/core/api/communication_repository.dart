import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/conversation.dart';
import '../../models/message.dart';

class CommunicationRepository {
  final FirebaseFirestore _firestore;

  CommunicationRepository(this._firestore);

  Future<List<Conversation>> getConversations(String userId) async {
    final snapshot = await _firestore.collection('conversations')
        .where('participants', arrayContains: userId)
        .get();
    return snapshot.docs.map((doc) => Conversation(
      id: doc.id,
      participants: List<String>.from(doc['participants']),
      lastMessageTime: (doc['lastMessageTime'] as Timestamp).toDate(),
      lastMessageSnippet: doc['lastMessageSnippet'],
    )).toList();
  }

  Future<List<Message>> getMessages(String conversationId) async {
    final snapshot = await _firestore.collection('messages')
        .where('conversationId', isEqualTo: conversationId)
        .orderBy('timestamp', descending: false)
        .get();
    return snapshot.docs.map((doc) => Message(
      id: doc.id,
      conversationId: doc['conversationId'],
      senderId: doc['senderId'],
      text: doc['text'],
      timestamp: (doc['timestamp'] as Timestamp).toDate(),
    )).toList();
  }

  Future<void> sendMessage(Message message) async {
    await _firestore.collection('messages').add({
      'conversationId': message.conversationId,
      'senderId': message.senderId,
      'text': message.text,
      'timestamp': message.timestamp,
    });
    // Update last message in conversation
    await _firestore.collection('conversations').doc(message.conversationId).update({
      'lastMessageTime': message.timestamp,
      'lastMessageSnippet': message.text,
    });
  }

  Future<String> createConversation(List<String> participants) async {
    final docRef = await _firestore.collection('conversations').add({
      'participants': participants,
      'lastMessageTime': DateTime.now(),
      'lastMessageSnippet': '',
    });
    return docRef.id;
  }
}
