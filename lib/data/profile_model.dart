class CustomerProfileModel {
  final String customerId;
  final String customerName;
  final String customerEmail;
  final String customerMobile;
  final String? customerAadhar;
  final String? customerAadharProof;
  final String? customerDrivingLicense;
  final String? customerDrivingLicenseProof;
  final String? emergencyContactNumber;
  final String? emergencyName;
  final String createdDate;
  final String lastModifiedDate;

  CustomerProfileModel({
    required this.customerId,
    required this.customerName,
    required this.customerEmail,
    required this.customerMobile,
    this.customerAadhar,
    this.customerAadharProof,
    this.customerDrivingLicense,
    this.customerDrivingLicenseProof,
    this.emergencyContactNumber,
    this.emergencyName,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory CustomerProfileModel.fromJson(Map<String, dynamic> json) {
    return CustomerProfileModel(
      customerId: json['customerId'] ?? '',
      customerName: json['customerName'] ?? '',
      customerEmail: json['customerEmail'] ?? '',
      customerMobile: json['customerMobile'] ?? '',
      customerAadhar: json['customerAadhar'],
      customerAadharProof: json['customerAadharProof'],
      customerDrivingLicense: json['customerDrivingLicense'],
      customerDrivingLicenseProof: json['customerDrivingLicenseProof'],
      emergencyContactNumber: json['emergencyContactNumber'],
      emergencyName: json['emergencyName'],
      createdDate: json['createdDate'] ?? '',
      lastModifiedDate: json['lastModifiedDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'customerEmail': customerEmail,
      'customerMobile': customerMobile,
      'customerAadhar': customerAadhar,
      'customerAadharProof': customerAadharProof,
      'customerDrivingLicense': customerDrivingLicense,
      'customerDrivingLicenseProof': customerDrivingLicenseProof,
      'emergencyContactNumber': emergencyContactNumber,
      'emergencyName': emergencyName,
      'createdDate': createdDate,
      'lastModifiedDate': lastModifiedDate,
    };
  }
}