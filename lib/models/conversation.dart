class Conversation {
  final String id;
  final List<String> participants;
  final DateTime lastMessageTime;
  final String lastMessageSnippet;

  Conversation({
    required this.id,
    required this.participants,
    required this.lastMessageTime,
    required this.lastMessageSnippet,
  });
}
