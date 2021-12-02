part of trakt_dart;

@JsonSerializable(createToJson: false)
class AccessTokenResponse {
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'token_type')
  final String tokenType;

  @JsonKey(name: 'expires_in')
  final int expiresIn;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  final String scope;

  @JsonKey(name: 'created_at')
  final int createdAt;

  AccessTokenResponse(this.accessToken, this.tokenType, this.expiresIn,
      this.refreshToken, this.scope, this.createdAt);

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenResponseFromJson(json);

  static AccessTokenResponse fromJsonModel(Map<String, dynamic> json) =>
      AccessTokenResponse.fromJson(json);
}

@JsonSerializable(createToJson: false)
class DeviceCodeResponse {
  @JsonKey(name: 'device_code')
  final String deviceCode;

  @JsonKey(name: 'user_code')
  final String userCode;

  @JsonKey(name: 'verification_url')
  final String verificationUrl;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'expiresIn')
  final int expiresIn;

  final int interval;

  DeviceCodeResponse(this.deviceCode, this.userCode, this.verificationUrl,
      this.refreshToken, this.expiresIn, this.interval);

  factory DeviceCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceCodeResponseFromJson(json);

  static DeviceCodeResponse fromJsonModel(Map<String, dynamic> json) =>
      DeviceCodeResponse.fromJson(json);
}
