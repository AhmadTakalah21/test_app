// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditionModel _$EditionModelFromJson(Map<String, dynamic> json) => EditionModel(
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      publicDescription: json['publicDescription'] as String?,
      internalDescription: json['internalDescription'] as String?,
      isPublished: json['isPublished'] as bool,
      isRegistrable: json['isRegistrable'] as bool,
      type: (json['type'] as num).toInt(),
      minimumUsersCount: (json['minimumUsersCount'] as num?)?.toInt(),
      monthlyPrice: (json['monthlyPrice'] as num?)?.toDouble(),
      annualPrice: (json['annualPrice'] as num?)?.toDouble(),
      waitingDayAfterExpire: (json['waitingDayAfterExpire'] as num?)?.toInt(),
      trialDayCount: (json['trialDayCount'] as num?)?.toInt(),
      countAllowExtendTrial: (json['countAllowExtendTrial'] as num?)?.toInt(),
      hasTrial: json['hasTrial'] as bool,
      disableWorkspaceAfterExpire: json['disableWorkspaceAfterExpire'] as bool,
      isMostPopular: json['isMostPopular'] as bool?,
      doNotSendVerifyEmail: json['doNotSendVerifyEmail'] as bool?,
      expiringEdition: json['expiringEdition'] == null
          ? null
          : ExpiringEditionModel.fromJson(
              json['expiringEdition'] as Map<String, dynamic>),
      seatsText: json['seatsText'] as String?,
      buttonText: json['buttonText'] as String?,
      buttonLink: json['buttonLink'] as String?,
      starterLineText: json['starterLineText'] as String?,
      editionColor: json['editionColor'] as String?,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$EditionModelToJson(EditionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'publicDescription': instance.publicDescription,
      'internalDescription': instance.internalDescription,
      'isPublished': instance.isPublished,
      'isRegistrable': instance.isRegistrable,
      'type': instance.type,
      'minimumUsersCount': instance.minimumUsersCount,
      'monthlyPrice': instance.monthlyPrice,
      'annualPrice': instance.annualPrice,
      'waitingDayAfterExpire': instance.waitingDayAfterExpire,
      'trialDayCount': instance.trialDayCount,
      'countAllowExtendTrial': instance.countAllowExtendTrial,
      'hasTrial': instance.hasTrial,
      'disableWorkspaceAfterExpire': instance.disableWorkspaceAfterExpire,
      'isMostPopular': instance.isMostPopular,
      'doNotSendVerifyEmail': instance.doNotSendVerifyEmail,
      'expiringEdition': instance.expiringEdition?.toJson(),
      'seatsText': instance.seatsText,
      'buttonText': instance.buttonText,
      'buttonLink': instance.buttonLink,
      'starterLineText': instance.starterLineText,
      'editionColor': instance.editionColor,
      'id': instance.id,
    };
