import 'package:appointments_app/features/auth/model/expiring_edition_model/expiring_edition_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'edition_model.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class EditionModel {
  const EditionModel({
    required this.name,
    required this.displayName,
    this.publicDescription,
    this.internalDescription,
    required this.isPublished,
    required this.isRegistrable,
    required this.type,
    this.minimumUsersCount,
    this.monthlyPrice,
    this.annualPrice,
    this.waitingDayAfterExpire,
    this.trialDayCount,
    this.countAllowExtendTrial,
    required this.hasTrial,
    required this.disableWorkspaceAfterExpire,
    this.isMostPopular,
    this.doNotSendVerifyEmail,
    this.expiringEdition,
    this.seatsText,
    this.buttonText,
    this.buttonLink,
    this.starterLineText,
    this.editionColor,
    required this.id,
  });

  final String name;
  final String displayName;
  final String? publicDescription;
  final String? internalDescription;
  final bool isPublished;
  final bool isRegistrable;
  final int type;
  final int? minimumUsersCount;
  final double? monthlyPrice;
  final double? annualPrice;
  final int? waitingDayAfterExpire;
  final int? trialDayCount;
  final int? countAllowExtendTrial;
  final bool hasTrial;
  final bool disableWorkspaceAfterExpire;
  final bool? isMostPopular;
  final bool? doNotSendVerifyEmail;
  final ExpiringEditionModel? expiringEdition;
  final String? seatsText;
  final String? buttonText;
  final String? buttonLink;
  final String? starterLineText;
  final String? editionColor;
  final int id;

  factory EditionModel.fromJson(Map<String, dynamic> json) =>
      _$EditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditionModelToJson(this);
}