class MayankCustomerListCallResponse {
  List<MayankCustomerListCallResponseDetail> details;
  int totalCount;

  MayankCustomerListCallResponse({this.details, this.totalCount});

  MayankCustomerListCallResponse.fromJson(Map<String, dynamic> json) {
    if (json['details'] != null) {
      details = [];
      json['details'].forEach((v) {
        details.add(new MayankCustomerListCallResponseDetail.fromJson(v));
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

class MayankCustomerListCallResponseDetail {
  int rowNum;
  int customerID;
  String customerName;
  String customerType;
  bool blockCustomer;
  String address;
  String area;
  String pinCode;
  int cityCode;
  String cityName;
  int stateCode;
  String stateName;
  int gSTStateCode;

  String cityName1;

  String stateName1;
  String gSTNO;
  String pANNO;
  String cINNO;
  String contactNo1;
  String contactNo2;
  String emailAddress;
  String websiteAddress;
  String birthDate;
  String anniversaryDate;
  String parentName;
  int customerSourceID;
  String customerSourceName;
  String specialityName;
  String countryCode;
  String countryName;
  String countryName1;
  int opening;
  int debit;
  int credit;
  int closing;
  int priceListID;
  String createdBy;
  String latitude;
  String longitude;

  MayankCustomerListCallResponseDetail(
      {this.rowNum,
      this.customerID,
      this.customerName,
      this.customerType,
      this.blockCustomer,
      this.address,
      this.area,
      this.pinCode,
      this.cityCode,
      this.cityName,
      this.stateCode,
      this.stateName,
      this.gSTStateCode,
      this.cityName1,
      this.stateName1,
      this.gSTNO,
      this.pANNO,
      this.cINNO,
      this.contactNo1,
      this.contactNo2,
      this.emailAddress,
      this.websiteAddress,
      this.birthDate,
      this.anniversaryDate,
      this.parentName,
      this.customerSourceID,
      this.customerSourceName,
      this.specialityName,
      this.countryCode,
      this.countryName,
      this.countryName1,
      this.opening,
      this.debit,
      this.credit,
      this.closing,
      this.priceListID,
      this.createdBy,
      this.latitude,
      this.longitude});

  MayankCustomerListCallResponseDetail.fromJson(Map<String, dynamic> json) {
    rowNum = json['RowNum'];
    customerID = json['CustomerID'];
    customerName = json['CustomerName'];
    customerType = json['CustomerType'];
    blockCustomer = json['BlockCustomer'];
    address = json['Address'];
    area = json['Area'];
    pinCode = json['PinCode'];
    cityCode = json['CityCode'];
    cityName = json['CityName'];
    stateCode = json['StateCode'];
    stateName = json['StateName'];
    gSTStateCode = json['GSTStateCode'];

    cityName1 = json['CityName1'];

    stateName1 = json['StateName1'];

    gSTNO = json['GSTNO'];
    pANNO = json['PANNO'];
    cINNO = json['CINNO'];
    contactNo1 = json['ContactNo1'];
    contactNo2 = json['ContactNo2'];
    emailAddress = json['EmailAddress'];
    websiteAddress = json['WebsiteAddress'];
    birthDate = json['BirthDate'];
    anniversaryDate = json['AnniversaryDate'];

    parentName = json['ParentName'];
    customerSourceID = json['CustomerSourceID'];
    customerSourceName = json['CustomerSourceName'];

    specialityName = json['SpecialityName'];

    countryCode = json['CountryCode'];
    countryName = json['CountryName'];
    countryName1 = json['CountryName1'];
    opening = json['Opening'];
    debit = json['Debit'];
    credit = json['Credit'];
    closing = json['Closing'];
    priceListID = json['PriceListID'];
    createdBy = json['CreatedBy'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RowNum'] = this.rowNum;
    data['CustomerID'] = this.customerID;
    data['CustomerName'] = this.customerName;
    data['CustomerType'] = this.customerType;
    data['BlockCustomer'] = this.blockCustomer;
    data['Address'] = this.address;
    data['Area'] = this.area;
    data['PinCode'] = this.pinCode;
    data['CityCode'] = this.cityCode;
    data['CityName'] = this.cityName;
    data['StateCode'] = this.stateCode;
    data['StateName'] = this.stateName;
    data['GSTStateCode'] = this.gSTStateCode;

    data['CityName1'] = this.cityName1;

    data['StateName1'] = this.stateName1;

    data['GSTNO'] = this.gSTNO;
    data['PANNO'] = this.pANNO;
    data['CINNO'] = this.cINNO;
    data['ContactNo1'] = this.contactNo1;
    data['ContactNo2'] = this.contactNo2;
    data['EmailAddress'] = this.emailAddress;
    data['WebsiteAddress'] = this.websiteAddress;
    data['BirthDate'] = this.birthDate;
    data['AnniversaryDate'] = this.anniversaryDate;

    data['ParentName'] = this.parentName;
    data['CustomerSourceID'] = this.customerSourceID;
    data['CustomerSourceName'] = this.customerSourceName;

    data['SpecialityName'] = this.specialityName;

    data['CountryCode'] = this.countryCode;
    data['CountryName'] = this.countryName;

    data['CountryName1'] = this.countryName1;
    data['Opening'] = this.opening;
    data['Debit'] = this.debit;
    data['Credit'] = this.credit;
    data['Closing'] = this.closing;
    data['PriceListID'] = this.priceListID;
    data['CreatedBy'] = this.createdBy;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    return data;
  }
}
