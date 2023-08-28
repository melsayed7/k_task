/// status : 200
/// message : "success"
/// products : [{"name":"منتج 1","sellerName":"متجر 1","price":12,"category":"صنف 1","images":["https://miro.medium.com/v2/resize:fit:720/format:webp/0*I9lgn4msD3eQtlFa.png"]},{"name":"منتج 2","sellerName":"متجر 2","price":12,"category":"صنف 1","images":["https://miro.medium.com/v2/resize:fit:720/format:webp/0*VmGG5CvzspNvbZCa.png"]},{"name":"منتج 3","sellerName":"متجر 3","price":12,"category":"صنف 2","images":["https://promptdb.ai/files/preview/800x800/81668027812n5txinveuv2zbkjy8bdu3tkvaux1wishetboz59r1rlm9g8gbm1rwi8pf5y7mlhosqiqmapld2rms5zvpanq6tdaltjrgrkxbuky.png"]},{"name":"منتج 4","sellerName":"متجر 4","price":12,"category":"صنف 2","images":["https://miro.medium.com/v2/resize:fit:720/format:webp/1*VYisIu_trZPEZbLWkUtmBg.jpeg"]},{"name":"منتج 5","sellerName":"متجر 5","price":12,"category":"صنف 3","images":["https://miro.medium.com/v2/resize:fit:720/format:webp/1*l290e27XI60k5vsUgEJkgw.png"]},{"name":"منتج 6","sellerName":"متجر 6","price":12,"category":"صنف 3","images":["https://miro.medium.com/v2/resize:fit:720/format:webp/1*HmKYkNZOSjX0iESyA4KZMA.png"]}]

class ProductModel {
  ProductModel({
    this.status,
    this.message,
    this.products,
  });

  ProductModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }

  num? status;
  String? message;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "منتج 1"
/// sellerName : "متجر 1"
/// price : 12
/// category : "صنف 1"
/// images : ["https://miro.medium.com/v2/resize:fit:720/format:webp/0*I9lgn4msD3eQtlFa.png"]

class Products {
  Products({
    this.name,
    this.sellerName,
    this.price,
    this.category,
    this.images,
  });

  Products.fromJson(dynamic json) {
    name = json['name'];
    sellerName = json['sellerName'];
    price = json['price'];
    category = json['category'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }

  String? name;
  String? sellerName;
  num? price;
  String? category;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['sellerName'] = sellerName;
    map['price'] = price;
    map['category'] = category;
    map['images'] = images;
    return map;
  }
}
