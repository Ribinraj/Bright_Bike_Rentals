part of 'privacy_policy_bloc.dart';

@immutable
sealed class PrivacyPolicyState {}

final class PrivacyPolicyInitial extends PrivacyPolicyState {}

final class PrivacyPolicyLoadingState extends PrivacyPolicyState {}

final class PrivacyPolicySuccessState extends PrivacyPolicyState {
  final List<PolicyModel> policy;

  PrivacyPolicySuccessState({required this.policy});
}


final class PrivacyPolicyErrorState extends PrivacyPolicyState {
 final String message;

  PrivacyPolicyErrorState({required this.message});
}
