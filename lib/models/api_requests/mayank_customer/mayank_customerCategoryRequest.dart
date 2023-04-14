//LoginUserID:adminCompanyId:4132
// pkID:
//LoginUserID:4132

class mayankCustomerCategoryRequest {
  String CompanyId;
  String pkID;

  mayankCustomerCategoryRequest({this.CompanyId, this.pkID});

  mayankCustomerCategoryRequest.fromJson(Map<String, dynamic> json) {
    CompanyId = json['CompanyId'];
    pkID = json['pkID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CompanyId'] = this.CompanyId;
    data['pkID'] = this.pkID;

    return data;
  }
}
