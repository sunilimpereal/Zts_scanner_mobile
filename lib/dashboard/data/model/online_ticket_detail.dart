// To parse this JSON data, do
//
//     final onlineTicketDetail = onlineTicketDetailFromJson(jsonString);

import 'dart:convert';

List<OnlineTicketDetail> onlineTicketDetailFromJson(String str) => List<OnlineTicketDetail>.from(json.decode(str).map((x) => OnlineTicketDetail.fromJson(x)));

String onlineTicketDetailToJson(List<OnlineTicketDetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnlineTicketDetail {
    OnlineTicketDetail({
      required  this.id,
      required  this.isScanned,
      required  this.online,
      required  this.uuid,
      required  this.offlineTicket,
      required  this.onlineTicket,
      required  this.createdTs,
      required  this.modifiedTs,
    });

    int id;
    bool isScanned;
    bool online;
    String uuid;
    dynamic offlineTicket;
    OnlineTicket onlineTicket;
    DateTime createdTs;
    DateTime modifiedTs;

    factory OnlineTicketDetail.fromJson(Map<String, dynamic> json) => OnlineTicketDetail(
        id: json["id"],
        isScanned: json["is_scanned"],
        online: json["online"],
        uuid: json["uuid"],
        offlineTicket: json["offline_ticket"],
        onlineTicket: OnlineTicket.fromJson(json["online_ticket"]),
        createdTs: DateTime.parse(json["created_ts"]),
        modifiedTs: DateTime.parse(json["modified_ts"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_scanned": isScanned,
        "online": online,
        "uuid": uuid,
        "offline_ticket": offlineTicket,
        "online_ticket": onlineTicket.toJson(),
        "created_ts": createdTs.toIso8601String(),
        "modified_ts": modifiedTs.toIso8601String(),
    };
}

class OnlineTicket {
    OnlineTicket({
      required  this.id,
      required  this.number,
      required  this.organization,
      required  this.userEmail,
      required  this.organizationName,
      required  this.lineitems,
      required  this.price,
      required  this.userDetails,
      required  this.issuedTs,
      required  this.isScanned,
      required  this.createdTs,
      required  this.modifiedTs,
      required  this.qrCode,
    });

    int id;
    String number;
    int organization;
    String userEmail;
    String organizationName;
    List<Lineitem> lineitems;
    int price;
    UserDetails userDetails;
    DateTime issuedTs;
    bool isScanned;
    DateTime createdTs;
    DateTime modifiedTs;
    String qrCode;

    factory OnlineTicket.fromJson(Map<String, dynamic> json) => OnlineTicket(
        id: json["id"],
        number: json["number"],
        organization: json["organization"],
        userEmail: json["user_email"],
        organizationName: json["organization_name"],
        lineitems: List<Lineitem>.from(json["lineitems"].map((x) => Lineitem.fromJson(x))),
        price: json["price"],
        userDetails: UserDetails.fromJson(json["user_details"]),
        issuedTs: DateTime.parse(json["issued_ts"]),
        isScanned: json["isScanned"],
        createdTs: DateTime.parse(json["created_ts"]),
        modifiedTs: DateTime.parse(json["modified_ts"]),
        qrCode: json["qr_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "organization": organization,
        "user_email": userEmail,
        "organization_name": organizationName,
        "lineitems": List<dynamic>.from(lineitems.map((x) => x.toJson())),
        "price": price,
        "user_details": userDetails.toJson(),
        "issued_ts": issuedTs.toIso8601String(),
        "isScanned": isScanned,
        "created_ts": createdTs.toIso8601String(),
        "modified_ts": modifiedTs.toIso8601String(),
        "qr_code": qrCode,
    };
}

class Lineitem {
    Lineitem({
     required   this.id,
     required   this.subcategory,
     required   this.subcategoryName,
     required   this.type,
     required   this.subcategoryPrice,
     required   this.category,
     required   this.quantity,
     required   this.price,
     required   this.createdTs,
     required   this.modifiedTs,
    });

    int id;
    int subcategory;
    String subcategoryName;
    String type;
    int subcategoryPrice;
    String category;
    int quantity;
    int price;
    DateTime createdTs;
    DateTime modifiedTs;

    factory Lineitem.fromJson(Map<String, dynamic> json) => Lineitem(
        id: json["id"],
        subcategory: json["subcategory"],
        subcategoryName: json["subcategory_name"],
        type: json["type"],
        subcategoryPrice: json["subcategory_price"],
        category: json["category"],
        quantity: json["quantity"],
        price: json["price"],
        createdTs: DateTime.parse(json["created_ts"]),
        modifiedTs: DateTime.parse(json["modified_ts"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subcategory": subcategory,
        "subcategory_name": subcategoryName,
        "type": type,
        "subcategory_price": subcategoryPrice,
        "category": category,
        "quantity": quantity,
        "price": price,
        "created_ts": createdTs.toIso8601String(),
        "modified_ts": modifiedTs.toIso8601String(),
    };
}

class UserDetails {
    UserDetails({
      required  this.city,
      required  this.name,
      required  this.email,
      required  this.dateOfVisit,
    });

    String city;
    String name;
    String email;
    DateTime dateOfVisit;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        city: json["city"],
        name: json["name"],
        email: json["email"],
        dateOfVisit: DateTime.parse(json["date_of_visit"]),
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "name": name,
        "email": email,
        "date_of_visit": "${dateOfVisit.year.toString().padLeft(4, '0')}-${dateOfVisit.month.toString().padLeft(2, '0')}-${dateOfVisit.day.toString().padLeft(2, '0')}",
    };
}
