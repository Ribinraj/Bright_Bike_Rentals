class PolicyModel {
  final String policyId;
  final String policyName;
  final String policy;
  final String createdDate;
  final String lastModifiedDate;

  PolicyModel.fromJson(Map<String, dynamic> json)
      : policyId = json['policyId'] ?? '',
        policyName = json['policyName'] ?? '',
        policy = json['policy'] ?? '',
        createdDate = json['createdDate'] ?? '',
        lastModifiedDate = json['lastModifiedDate'] ?? '';

  static List<PolicyModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PolicyModel.fromJson(json)).toList();
  }
}