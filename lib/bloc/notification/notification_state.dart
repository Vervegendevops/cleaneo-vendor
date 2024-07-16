 import 'package:equatable/equatable.dart';

import '../../model/notification.dart';

enum NotificationStatus{
  initial,
  loading,
  loaded
}
 enum DeleteNotificationStatus{
   initial,
   loading,
   loaded
 }

class NotificationState extends Equatable{
  NotificationStatus notificationStatus;
  List<Notification> notificationList;
  DeleteNotificationStatus deleteNotificationStatus;

  NotificationState({
    this.notificationStatus=NotificationStatus.initial,
    this.notificationList=const[],
    this.deleteNotificationStatus=DeleteNotificationStatus.initial
});
  NotificationState copyWith({
    NotificationStatus? notificationStatus,
    List<Notification>? notificationList,
    DeleteNotificationStatus? deleteNotificationStatus


  }){
    return NotificationState(
        notificationStatus: notificationStatus??this.notificationStatus,
      notificationList: notificationList??this.notificationList,
      deleteNotificationStatus: deleteNotificationStatus??this.deleteNotificationStatus
    );
  }

  @override
  List<Object?> get props => [notificationStatus,notificationList,deleteNotificationStatus];
}

