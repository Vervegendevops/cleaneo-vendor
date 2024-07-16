import 'package:bloc/bloc.dart';
import '../../model/notification.dart';
import '../../services/api_provider.dart';
import 'notification_event.dart';
import 'notification_state.dart';


class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {
    on<GetNotificationEvent>(getNotification);
    on<DeleteNotificationEvent>(deleteNotification);
  }
  getNotification(GetNotificationEvent event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(notificationStatus: NotificationStatus.initial));
    List<Notification> notificationList=await ApiProvider().getNotifications();

    if(notificationList.isNotEmpty){
      emit(state.copyWith(notificationStatus: NotificationStatus.loaded,notificationList: notificationList));
    }
    else{
      emit(state.copyWith(notificationStatus: NotificationStatus.initial));
    }
  }

  deleteNotification(DeleteNotificationEvent event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(deleteNotificationStatus: DeleteNotificationStatus.initial));
    int? statuscode=await ApiProvider().deleteNotificationData(event.notificationID);
    print("statuscode==$statuscode");
    if(statuscode==200){
      List<Notification> notificationList=await ApiProvider().getNotifications();
      emit(state.copyWith(notificationStatus: NotificationStatus.loaded,notificationList: notificationList));

    }
    else{
      emit(state.copyWith(notificationStatus: NotificationStatus.initial));

    }

  }
}
