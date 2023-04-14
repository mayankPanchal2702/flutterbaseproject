class MayankCustomerSourceResponse {
  List<MayankCustomerSourceResponseDetails> details;
  int totalCount;

  MayankCustomerSourceResponse({this.details, this.totalCount});

  MayankCustomerSourceResponse.fromJson(Map<String, dynamic> json) {
    if (json['details'] != null) {
      details = <MayankCustomerSourceResponseDetails>[];
      json['details'].forEach((v) {
        details.add(new MayankCustomerSourceResponseDetails.fromJson(v));
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

class MayankCustomerSourceResponseDetails {
  int rowNum;
  int pkID;
  String inquiryStatus;
  String statusCategory;

  MayankCustomerSourceResponseDetails(
      {this.rowNum, this.pkID, this.inquiryStatus, this.statusCategory});

  MayankCustomerSourceResponseDetails.fromJson(Map<String, dynamic> json) {
    rowNum = json['RowNum'];
    pkID = json['pkID'];
    inquiryStatus = json['InquiryStatus'];
    statusCategory = json['StatusCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RowNum'] = this.rowNum;
    data['pkID'] = this.pkID;
    data['InquiryStatus'] = this.inquiryStatus;
    data['StatusCategory'] = this.statusCategory;
    return data;
  }
}
