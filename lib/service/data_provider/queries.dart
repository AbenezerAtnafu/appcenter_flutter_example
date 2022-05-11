class Queries {
  String listings(int page, int limit, dynamic filter, dynamic sort) {
    return '''
      query{
        listings(page: $page, limit: $limit, filter: $filter, sort: $sort) {
          collection {
            contactMechanism
            currency{
              name
            }
            from
            id
            isFeaturedListing
            listedFor
            listedOn
            numberOfViews
            price
            primaryContact{
              email
            }
            property{
              id
            }
            secondaryContact{
              email
            }
            status
            to
          }
          metadata {
            currentPage
            limitValue
            totalCount
            totalPages
          }
        }
      }
    ''';
  }
}
