class NetworkResponse{
  final String? errorText;
  final dynamic data;
  final String? errorCode;

  NetworkResponse( {
     this.errorText = '',
     this.data,
     this.errorCode='',
     }
     );

}