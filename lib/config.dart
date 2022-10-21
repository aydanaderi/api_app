class ServiceConfig {

  ServiceConfig._();

  static const String baseURL = 'https://sa-day1.iranianpooshesh.com';
  static Uri apiuri = Uri.parse('${ServiceConfig.baseURL}'
      '/api/app/Dey_agent/requests_list/?tab=issuance');
}