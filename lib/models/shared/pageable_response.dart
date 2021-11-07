// To parse this JSON data, do
//
//     final pageableResponse = pageableResponseFromJson(jsonString);

import 'dart:convert';

PageableResponse pageableResponseFromJson(String str) => PageableResponse.fromJson(json.decode(str));

String pageableResponseToJson(PageableResponse data) => json.encode(data.toJson());

class PageableResponse {
    PageableResponse({
        required this.content,
        required this.pageable,
        required this.totalPages,
        required this.totalElements,
        required this.last,
        required this.size,
        required this.number,
        required this.sort,
        required this.numberOfElements,
        required this.first,
        required this.empty,
    });

    List<dynamic> content;
    Pageable pageable;
    int totalPages;
    int totalElements;
    bool last;
    int size;
    int number;
    Sort sort;
    int numberOfElements;
    bool first;
    bool empty;

    factory PageableResponse.fromJson(Map<String, dynamic> json) => PageableResponse(
        content: json["content"],
        pageable: Pageable.fromJson(json["pageable"]),
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        last: json["last"],
        size: json["size"],
        number: json["number"],
        sort: Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        first: json["first"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "totalPages": totalPages,
        "totalElements": totalElements,
        "last": last,
        "size": size,
        "number": number,
        "sort": sort.toJson(),
        "numberOfElements": numberOfElements,
        "first": first,
        "empty": empty,
    };
}

class Pageable {
    Pageable({
        required this.sort,
        required this.offset,
        required this.pageNumber,
        required this.pageSize,
        required this.paged,
        required this.unpaged,
    });

    Sort sort;
    int offset;
    int pageNumber;
    int pageSize;
    bool paged;
    bool unpaged;

    factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        offset: json["offset"],
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        paged: json["paged"],
        unpaged: json["unpaged"],
    );

    Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "offset": offset,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "paged": paged,
        "unpaged": unpaged,
    };
}

class Sort {
    Sort({
        required this.sorted,
        required this.unsorted,
        required this.empty,
    });

    bool sorted;
    bool unsorted;
    bool empty;

    factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
    };
}
