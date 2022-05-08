class Queries {
  String fetchAllProfile() {
    return '''
    query{
        properties(onlyAvailableForListing: false) {
          shortDescription
        }
      }
    ''';
  }

  String fetchProfileById(String id) {
    return '''
      query{
        character(id:"$id") {
          name
          image
          species
          origin{
            dimension
          }
            
        }
      }
    ''';
  }
}
