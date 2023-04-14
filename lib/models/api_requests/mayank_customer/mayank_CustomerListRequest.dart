//LoginUserID:admin
//LoginUserID:4132

class CustomerListScreenRequest {
  String LoginUserID;
  String CompanyId;

  CustomerListScreenRequest({this.LoginUserID, this.CompanyId});

  CustomerListScreenRequest.fromJson(Map<String, dynamic> json) {
    LoginUserID = json['LoginUserID'];
    CompanyId = json['CompanyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LoginUserID'] = this.LoginUserID;
    data['CompanyId'] = this.CompanyId;

    return data;
  }
}
