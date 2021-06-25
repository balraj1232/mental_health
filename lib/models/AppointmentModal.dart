class AppointmentModal {
  List<Appointments> appointments;
  String mediaUrl;
  Meta meta;

  AppointmentModal({this.appointments, this.mediaUrl, this.meta});

  AppointmentModal.fromJson(Map<String, dynamic> json) {
  /*  if (json['appointments'] != null) {
      appointments = new List<Null>();
      json['appointments'].forEach((v) {
        appointments.add(new Appointments.fromJson(v));
      });
    }*/
    mediaUrl = json['media_url'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   /* if (this.appointments != null) {
      data['appointments'] = this.appointments.map((v) => v.toJson()).toList();
    }*/
    data['media_url'] = this.mediaUrl;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Meta {
  String message;
  String messageType;
  String status;

  Meta({this.message, this.messageType, this.status});

  Meta.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    messageType = json['message_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['message_type'] = this.messageType;
    data['status'] = this.status;
    return data;
  }
}

class Appointments{

}