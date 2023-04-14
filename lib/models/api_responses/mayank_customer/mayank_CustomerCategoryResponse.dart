class mayankCustomerCategoryResponse {
  List<mayankCustomerCategoryResponseDetails> details;
  int totalCount;

  mayankCustomerCategoryResponse({this.details, this.totalCount});

  mayankCustomerCategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['details'] != null) {
      details = [];
      json['details'].forEach((v) {
        details.add(new mayankCustomerCategoryResponseDetails.fromJson(v));
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

class mayankCustomerCategoryResponseDetails {
  int rowNum;
  int pkID;
  String categoryName;

  mayankCustomerCategoryResponseDetails(
      {this.rowNum, this.pkID, this.categoryName});

  mayankCustomerCategoryResponseDetails.fromJson(Map<String, dynamic> json) {
    rowNum = json['RowNum'];
    pkID = json['pkID'];
    categoryName = json['CategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RowNum'] = this.rowNum;
    data['pkID'] = this.pkID;
    data['CategoryName'] = this.categoryName;
    return data;
  }
}
