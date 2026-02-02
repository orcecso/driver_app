// ignore_for_file: non_constant_identifier_names

import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(useConstantCase: true)
abstract class Env {
  @EnviedField(varName: 'PRIVACY_POLICY', obfuscate: true)
  static String PRIVACY_POLICY = _Env.PRIVACY_POLICY;

  @EnviedField(varName: 'TERMS_AND_CONDITION', obfuscate: true)
  static String TERMS_AND_CONDITION = _Env.TERMS_AND_CONDITION;

  @EnviedField(varName: 'IDMETA_TPAY_TOKEN', obfuscate: true)
  static String IDMETA_TPAY_TOKEN = _Env.IDMETA_TPAY_TOKEN;

  @EnviedField(varName: 'IDMETA_URL', obfuscate: true)
  static String IDMETA_URL = _Env.IDMETA_URL;

  // DOCUMENT VERIFICATION
  @EnviedField(varName: 'IDMETA_DOC_TEMPLATE_ID', obfuscate: true)
  static String IDMETA_DOC_TEMPLATE_ID = _Env.IDMETA_DOC_TEMPLATE_ID;

  // LIVENESS VERIFICATION
  @EnviedField(varName: 'IDMETA_LIVENESS_TEMPLATE_ID', obfuscate: true)
  static String IDMETA_LIVENESS_TEMPLATE_ID = _Env.IDMETA_LIVENESS_TEMPLATE_ID;

  @EnviedField(varName: 'IDMETA_LIVENESS_URL', obfuscate: true)
  static String IDMETA_LIVENESS_URL = _Env.IDMETA_LIVENESS_URL;

  // FACE MATCH
  @EnviedField(varName: 'IDMETA_FACE_COMPARISON_TEMPLATE_ID', obfuscate: true)
  static String IDMETA_FACE_COMPARISON_TEMPLATE_ID =
      _Env.IDMETA_FACE_COMPARISON_TEMPLATE_ID;

  // AMLA
  @EnviedField(varName: 'IDMETA_AMLA_TEMPLATE_ID', obfuscate: true)
  static String IDMETA_AMLA_TEMPLATE_ID = _Env.IDMETA_AMLA_TEMPLATE_ID;

  @EnviedField(varName: 'TELEGRAM_BOT_TOKEN', obfuscate: true)
  static String TELEGRAM_BOT_TOKEN = _Env.TELEGRAM_BOT_TOKEN;

  @EnviedField(varName: 'TELEGRAM_CHAT_ID', obfuscate: true)
  static String TELEGRAM_CHAT_ID = _Env.TELEGRAM_CHAT_ID;

  @EnviedField(varName: 'TELEGRAM_GROUPCHAT_ID', obfuscate: true)
  static int TELEGRAM_GROUPCHAT_ID = _Env.TELEGRAM_GROUPCHAT_ID;

  @EnviedField(varName: 'TELEGRAM_BOT_ID', obfuscate: true)
  static String TELEGRAM_BOT_ID = _Env.TELEGRAM_BOT_ID;

  // DEV
  @EnviedField(varName: 'URL_DEV', obfuscate: true)
  static String URL_DEV = _Env.URL_DEV;

  // SIT
  @EnviedField(varName: 'URL_SIT', obfuscate: true)
  static String URL_SIT = _Env.URL_SIT;

  // UAT
  @EnviedField(varName: 'URL_UAT', obfuscate: true)
  static String URL_UAT = _Env.URL_UAT;

  // PROD
  @EnviedField(varName: 'URL_PROD', obfuscate: true)
  static String URL_PROD = _Env.URL_PROD;

  // Global values
  @EnviedField(varName: 'APPLICATION_ID', obfuscate: true)
  static String APPLICATION_ID = _Env.APPLICATION_ID;

  @EnviedField(varName: 'OTPTYPE_BIOMETRICS', obfuscate: true)
  static int OTPTYPE_BIOMETRICS = _Env.OTPTYPE_BIOMETRICS;

  @EnviedField(varName: 'EKYC_API_URL', obfuscate: true)
  static String EKYC_API_URL = _Env.EKYC_API_URL;

  // EKYC STG
  @EnviedField(varName: 'PARTNER_CODE_STG', obfuscate: true)
  static String PARTNER_CODE_STG = _Env.PARTNER_CODE_STG;

  @EnviedField(varName: 'PARTNER_KEY_STG', obfuscate: true)
  static String PARTNER_KEY_STG = _Env.PARTNER_KEY_STG;

  // EKYC PROD
  @EnviedField(varName: 'PARTNER_CODE_PROD', obfuscate: true)
  static String PARTNER_CODE_PROD = _Env.PARTNER_CODE_PROD;

  @EnviedField(varName: 'PARTNER_KEY_PROD', obfuscate: true)
  static String PARTNER_KEY_PROD = _Env.PARTNER_KEY_PROD;

  // APP KEYS
  @EnviedField(varName: 'APP_KEY', obfuscate: true)
  static String APP_KEY = _Env.APP_KEY;

  // SECRET KEYS
  @EnviedField(varName: 'SECRET_KEY', obfuscate: true)
  static String SECRET_KEY = _Env.SECRET_KEY;

  // FIREBASE CONFIGURATION (The newly added sensitive keys)
  @EnviedField(varName: 'FIREBASE_API_KEY_ANDROID', obfuscate: true)
  static String FIREBASE_API_KEY_ANDROID = _Env.FIREBASE_API_KEY_ANDROID;
  @EnviedField(varName: 'FIREBASE_API_KEY_IOS', obfuscate: true)
  static String FIREBASE_API_KEY_IOS = _Env.FIREBASE_API_KEY_IOS;
  @EnviedField(varName: 'FIREBASE_IOS_APP_ID', obfuscate: true)
  static String FIREBASE_IOS_APP_ID = _Env.FIREBASE_IOS_APP_ID;
  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID', obfuscate: true)
  static String FIREBASE_ANDROID_APP_ID = _Env.FIREBASE_ANDROID_APP_ID;

  @EnviedField(varName: 'FIREBASE_MESSAGING_SENDER_ID', obfuscate: true)
  static String FIREBASE_MESSAGING_SENDER_ID =
      _Env.FIREBASE_MESSAGING_SENDER_ID; // 👈 New iOS field

  @EnviedField(varName: 'FIREBASE_PROJECT_ID', obfuscate: true)
  static String FIREBASE_PROJECT_ID = _Env.FIREBASE_PROJECT_ID;

  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET', obfuscate: true)
  static String FIREBASE_STORAGE_BUCKET = _Env.FIREBASE_STORAGE_BUCKET; // 👈 New Storage Bucket field

  // APP STORE URLs
  @EnviedField(varName: 'STORE_URL_APPLESTORE_API', obfuscate: true)
  static String STORE_URL_APPLESTORE_API = _Env.STORE_URL_APPLESTORE_API;

  @EnviedField(varName: 'STORE_URL_GOOGLESTORE_API', obfuscate: true)
  static String STORE_URL_GOOGLESTORE_API = _Env.STORE_URL_GOOGLESTORE_API;

  @EnviedField(varName: 'HIVE_ENCRYPTION_KEY', obfuscate: true)
  static String HIVE_ENCRYPTION_KEY = _Env.HIVE_ENCRYPTION_KEY;

  @EnviedField(varName: 'IDMETA_ALLOWED_URL_1', obfuscate: true)
  static String IDMETA_ALLOWED_URL_1 = _Env.IDMETA_ALLOWED_URL_1;

  @EnviedField(varName: 'IDMETA_ALLOWED_URL_2', obfuscate: true)
  static String IDMETA_ALLOWED_URL_2 = _Env.IDMETA_ALLOWED_URL_2;

  @EnviedField(varName: 'IOS_BUNDLE_ID', obfuscate: true)
  static String IOS_BUNDLE_ID = _Env.IOS_BUNDLE_ID;

  @EnviedField(varName: 'CERTIFICATE_HASH_BASE64', obfuscate: true)
  static String CERTIFICATE_HASH_BASE64 = _Env.CERTIFICATE_HASH_BASE64;

  @EnviedField(varName: 'APPLE_TEAM_ID', obfuscate: true)
  static String APPLE_TEAM_ID = _Env.APPLE_TEAM_ID;

  @EnviedField(varName: 'PACKAGENAME', obfuscate: true)
  static String PACKAGENAME = _Env.PACKAGENAME;

  @EnviedField(varName: 'COMPANYEMAIL', obfuscate: true)
  static String COMPANYEMAIL = _Env.COMPANYEMAIL;
}
