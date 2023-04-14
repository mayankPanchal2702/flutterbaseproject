// LoginUserID:admin
// CompanyId:4132

class MayankCustomerListCallRequest {
  String LoginUserID;
  String CompanyId;

  MayankCustomerListCallRequest({this.CompanyId, this.LoginUserID});

  MayankCustomerListCallRequest.fromJson(Map<String, dynamic> json) {
    CompanyId = json['CompanyId'];
    LoginUserID = json['LoginUserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CompanyId'] = this.CompanyId;
    data['LoginUserID'] = this.LoginUserID;

    return data;
  }
}
