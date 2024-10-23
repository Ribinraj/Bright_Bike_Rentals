class SettingsDataModel {
  final String settingsId;
  final String businessName;
  final String businessAddress;
  final String businessLogo;
  final String businessGoogleMap;
  final String businessFB;
  final String businessInsta;
  final String businessTwitter;
  final String businessPhoneNumber;
  final String businessAltPhoneNumber;
  final String businessEmailAddress;
  final String emailFromAddress;
  final String emailReplyToAddress;
  final String gstPercentage;
  final String halfDayHours;
  final String paymentType;
  final String bookingType;
  final String kmLimitEnabled;
  final String splitPayments;
  final String splitPaymenPercent;
  final String earlyMorning;
  final String earlyMorningPrice;
  final String earlyMorningText;
  final String refundableDeposit;
  final String offlinePaymentInfo;
  final String paymentGateway;
  final String lastModifiedDate;

  SettingsDataModel({
    required this.settingsId,
    required this.businessName,
    required this.businessAddress,
    required this.businessLogo,
    required this.businessGoogleMap,
    required this.businessFB,
    required this.businessInsta,
    required this.businessTwitter,
    required this.businessPhoneNumber,
    required this.businessAltPhoneNumber,
    required this.businessEmailAddress,
    required this.emailFromAddress,
    required this.emailReplyToAddress,
    required this.gstPercentage,
    required this.halfDayHours,
    required this.paymentType,
    required this.bookingType,
    required this.kmLimitEnabled,
    required this.splitPayments,
    required this.splitPaymenPercent,
    required this.earlyMorning,
    required this.earlyMorningPrice,
    required this.earlyMorningText,
    required this.refundableDeposit,
    required this.offlinePaymentInfo,
    required this.paymentGateway,
    required this.lastModifiedDate,
  });

  factory SettingsDataModel.fromJson(Map<String, dynamic> json) {
    return SettingsDataModel(
      settingsId: json['settingsId'] ?? '',
      businessName: json['businessName'] ?? '',
      businessAddress: json['businessAddress'] ?? '',
      businessLogo: json['businessLogo'] ?? '',
      businessGoogleMap: json['businessGoogleMap'] ?? '',
      businessFB: json['businessFB'] ?? '',
      businessInsta: json['businessInsta'] ?? '',
      businessTwitter: json['businessTwitter'] ?? '',
      businessPhoneNumber: json['businessPhoneNumber'] ?? '',
      businessAltPhoneNumber: json['businessAltPhoneNumber'] ?? '',
      businessEmailAddress: json['businessEmailAddress'] ?? '',
      emailFromAddress: json['emailFromAddress'] ?? '',
      emailReplyToAddress: json['emailReplyToAddress'] ?? '',
      gstPercentage: json['gstPercentage'] ?? '',
      halfDayHours: json['halfDayHours'] ?? '',
      paymentType: json['paymentType'] ?? '',
      bookingType: json['bookingType'] ?? '',
      kmLimitEnabled: json['kmLimitEnabled'] ?? '',
      splitPayments: json['splitPayments'] ?? '',
      splitPaymenPercent: json['splitPaymenPercent'] ?? '',
      earlyMorning: json['earlyMorning'] ?? '',
      earlyMorningPrice: json['earlyMorningPrice'] ?? '',
      earlyMorningText: json['earlyMorningText'] ?? '',
      refundableDeposit: json['refundableDeposit'] ?? '',
      offlinePaymentInfo: json['offlinePaymentInfo'] ?? '',
      paymentGateway: json['paymentGateway'] ?? '',
      lastModifiedDate: json['lastModifiedDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'settingsId': settingsId,
      'businessName': businessName,
      'businessAddress': businessAddress,
      'businessLogo': businessLogo,
      'businessGoogleMap': businessGoogleMap,
      'businessFB': businessFB,
      'businessInsta': businessInsta,
      'businessTwitter': businessTwitter,
      'businessPhoneNumber': businessPhoneNumber,
      'businessAltPhoneNumber': businessAltPhoneNumber,
      'businessEmailAddress': businessEmailAddress,
      'emailFromAddress': emailFromAddress,
      'emailReplyToAddress': emailReplyToAddress,
      'gstPercentage': gstPercentage,
      'halfDayHours': halfDayHours,
      'paymentType': paymentType,
      'bookingType': bookingType,
      'kmLimitEnabled': kmLimitEnabled,
      'splitPayments': splitPayments,
      'splitPaymenPercent': splitPaymenPercent,
      'earlyMorning': earlyMorning,
      'earlyMorningPrice': earlyMorningPrice,
      'earlyMorningText': earlyMorningText,
      'refundableDeposit': refundableDeposit,
      'offlinePaymentInfo': offlinePaymentInfo,
      'paymentGateway': paymentGateway,
      'lastModifiedDate': lastModifiedDate,
    };
  }
}