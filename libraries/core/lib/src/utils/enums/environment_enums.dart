enum EnvironmentEnums { dev, sit, uat, prod }

class AppConfig {
  static late EnvironmentEnums environment;

  static void setEnvironment(EnvironmentEnums env) {
    environment = env;
  }
}
