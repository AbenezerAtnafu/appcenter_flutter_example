class Mutations {
  String userLogin(String email, String password) {
    return '''
      mutation{
        userLogin(email:"$email", password:"$password") {
          authenticatable {
            email
            id
            name
            phoneNumber
            roles
          }
          credentials {
            accessToken
            client
            expiry
            tokenType
            uid
          }
        }
      }
    ''';
  }
}
