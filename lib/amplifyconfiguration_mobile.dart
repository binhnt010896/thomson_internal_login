const amplifyconfig = '''{
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-southeast-1_Etd2uyb2R",
                        "AppClientId": "28n3d7m30j9c5tik31dr23f2nh",
                        "Region": "ap-southeast-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "tmctest-cogn-azure.auth.ap-southeast-1.amazoncognito.com",
                            "AppClientId": "28n3d7m30j9c5tik31dr23f2nh",
                            "SignInRedirectURI": "https://thomson-internal-login-rtks.vercel.app/login/",
                            "SignOutRedirectURI": "https://thomson-internal-login-rtks.vercel.app/login/",
                            "ResponseType": "code",
                            "Scopes": [
                                "email",
                                "openid",
                                "phone",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [
                            "GOOGLE"
                        ],
                        "usernameAttributes": [],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": [
                                "REQUIRES_LOWERCASE",
                                "REQUIRES_UPPERCASE",
                                "REQUIRES_NUMBERS",
                                "REQUIRES_SYMBOLS"
                            ]
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                }
            }
        }
    }
}''';
