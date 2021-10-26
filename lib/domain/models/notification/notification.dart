enum NotificationType {
  /// Positive type of notification when something was completed successfully.
  ///
  /// For example, when user receives report about plant seeding.
  positive,

  /// Notification that attracts attention.
  ///
  /// For example, when user gets invitation for a cleaning day.
  warning,

  /// Negative type of notification when something was completed wrong.
  ///
  /// For example, when report couldn't be loaded.
  negative,
}

class Notification {
  const Notification({
    required this.id,
    required this.timestamp,
    required this.content,
    this.type = NotificationType.warning,
    this.isRead = false,
  });

  /// Notification unique identifier.
  final String id;

  /// Notification content.
  final String content;

  /// Time when the notification was created.
  final DateTime timestamp;

  /// Notication type.
  final NotificationType type;

  /// Whether the notification is read or not.
  final bool isRead;
}
