abstract class NotificationEvent {}
class GetNotificationEvent extends NotificationEvent{}
class DeleteNotificationEvent extends NotificationEvent{
  int notificationID;
  DeleteNotificationEvent(this.notificationID);

}


