class Listing {
  Listings? listings;

  Listing({this.listings});

  Listing.fromJson(Map<String, dynamic> json) {
    listings = json['listings'] != null
        ? new Listings.fromJson(json['listings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listings != null) {
      data['listings'] = this.listings!.toJson();
    }
    return data;
  }
}

class Listings {
  List<Collection>? collection;
  Metadata? metadata;

  Listings({this.collection, this.metadata});

  Listings.fromJson(Map<String, dynamic> json) {
    if (json['collection'] != null) {
      collection = <Collection>[];
      json['collection'].forEach((v) {
        collection!.add(new Collection.fromJson(v));
      });
    }
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}

class Collection {
  String? contactMechanism;
  Currency? currency;
  String? from;
  String? id;
  bool? isFeaturedListing;
  String? listedFor;
  String? listedOn;
  int? numberOfViews;
  double? price;
  PrimaryContact? primaryContact;
  Property? property;
  PrimaryContact? secondaryContact;
  String? status;
  Null? to;

  Collection(
      {this.contactMechanism,
      this.currency,
      this.from,
      this.id,
      this.isFeaturedListing,
      this.listedFor,
      this.listedOn,
      this.numberOfViews,
      this.price,
      this.primaryContact,
      this.property,
      this.secondaryContact,
      this.status,
      this.to});

  Collection.fromJson(Map<String, dynamic> json) {
    contactMechanism = json['contactMechanism'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    from = json['from'];
    id = json['id'];
    isFeaturedListing = json['isFeaturedListing'];
    listedFor = json['listedFor'];
    listedOn = json['listedOn'];
    numberOfViews = json['numberOfViews'];
    price = json['price'];
    primaryContact = json['primaryContact'] != null
        ? new PrimaryContact.fromJson(json['primaryContact'])
        : null;
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    secondaryContact = json['secondaryContact'] != null
        ? new PrimaryContact.fromJson(json['secondaryContact'])
        : null;
    status = json['status'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contactMechanism'] = this.contactMechanism;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    data['from'] = this.from;
    data['id'] = this.id;
    data['isFeaturedListing'] = this.isFeaturedListing;
    data['listedFor'] = this.listedFor;
    data['listedOn'] = this.listedOn;
    data['numberOfViews'] = this.numberOfViews;
    data['price'] = this.price;
    if (this.primaryContact != null) {
      data['primaryContact'] = this.primaryContact!.toJson();
    }
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    if (this.secondaryContact != null) {
      data['secondaryContact'] = this.secondaryContact!.toJson();
    }
    data['status'] = this.status;
    data['to'] = this.to;
    return data;
  }
}

class Currency {
  String? name;

  Currency({this.name});

  Currency.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class PrimaryContact {
  String? email;

  PrimaryContact({this.email});

  PrimaryContact.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}

class Property {
  String? id;

  Property({this.id});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Metadata {
  int? currentPage;
  int? limitValue;
  int? totalCount;
  int? totalPages;

  Metadata(
      {this.currentPage, this.limitValue, this.totalCount, this.totalPages});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limitValue = json['limitValue'];
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['limitValue'] = this.limitValue;
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    return data;
  }
}
