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

  String userSignUp(String name, String email, String password) {
    return '''
      mutation {
        userSignUp(
          email: "$email"
          password: "$password"
          passwordConfirmation: "$password"
          confirmSuccessUrl: "1"
          name: "$name"
        ) {
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

  String requestCode(String phoneNumber) {
    return '''
      mutation {
        requestCode(phoneNumber: "$phoneNumber") {
          requestId
          sentCode
        }
      }
    ''';
  }

  String verifyCode(String? requestId, String code) {
    return '''
      mutation {
        verifyCode(requestId: "$requestId", code: "$code") {
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
