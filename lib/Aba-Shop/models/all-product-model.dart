class AllProductModel {
  final String? productCategory;

  //product Details
  final String? productId;
  final String? productImage;
  final String? productDescription;
  final num productOriginalPrice;
  final num productDiscountPrice;
  final String? addresse;
  late final int orderQuantity;
  final String? waist;
  final String? tissue_type;
  final String? color;
  final String? thickness;
  final String? silhouette;
  final String? leatheryQuality;
  final String? mold;
  final String? pattern;
  final String? collection;

  final List? favourites;

  //Seller detail
  final String? sellerId;
  final String? sellerName;
  final String? sellerEmail;
  final String? sellerPhoneNumber;
  final String? dateAdded;
  final String? timeAdded;
  final num? total;
  final num? totalUnit;
  final String? status;
  final int? orderNumber;
  bool isChecked;

  AllProductModel(
      {this.productId,
        this.productCategory,
        this.productImage,
        this.productDescription,
        required this.productOriginalPrice,
        required this.productDiscountPrice,
        this.addresse,
        required this.orderQuantity,
        this.waist,
        this.tissue_type,
        this.color,
        this.thickness,
        this.silhouette,
        this.leatheryQuality,
        this.mold,
        this.pattern,
        this.collection,

        this.favourites,
        this.sellerId,
        this.sellerName,
        this.sellerEmail,
        this.sellerPhoneNumber,
        this.orderNumber,
        this.total,
        this.totalUnit,
        this.dateAdded,
        this.timeAdded,
        this.status,
        required this.isChecked});


  num get totalPrice => productDiscountPrice * orderQuantity;
}
