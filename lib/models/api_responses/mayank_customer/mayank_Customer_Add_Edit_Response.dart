/*CustomerId:0
CustomerName:Morari Dham
CustomerType:Customer
Address:9, Nandanvan Industrial Estate, Near Mahakali Mandir road, Bakrol Dhamatvan Road, Dhamatvan, Ahemdab
Area:Bakrol
CityCode:12
StateCode:350
PinCode:
ContactNo1:7082451657
ContactNo2:
EmailAddress:info@dolphin.com
GSTNO:
PANNO:
LoginUserID:maulik
WebsiteAddress:www.dolphin.com
Latitude:234344
Longitude:2134232
CountryCode:IND
BlockCustomer:
CustomerSourceID:
CompanyId:4132*/
class CustomerAddEditListScreenResponse {
  List<CustomerAddEditListScreenResponseDetails> details;
  int totalCount;

  CustomerAddEditListScreenResponse({this.details, this.totalCount});

  CustomerAddEditListScreenResponse.fromJson(Map<String, dynamic> json) {
    if (json['details'] != null) {
      details = [];
      json['details'].forEach((v) {
        details.add(new CustomerAddEditListScreenResponseDetails.fromJson(v));
      });
    }
    totalCount = json['TotalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    data['TotalCount'] = this.totalCount;
    return data;
  }
}

class CustomerAddEditListScreenResponseDetails {
  int column1;
  String column2;

  CustomerAddEditListScreenResponseDetails({this.column1, this.column2});

  CustomerAddEditListScreenResponseDetails.fromJson(Map<String, dynamic> json) {
    column1 = json['Column1'];
    column2 = json['Column2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Column1'] = this.column1;
    data['Column2'] = this.column2;
    return data;
  }
}
