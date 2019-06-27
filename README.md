## How to access API?

* User need to signup with the application first. 

```
/singup
{
    "name": "Deepak",
    "email": "jhadeepakkumar14@gmail.com",
    "password": "password",
    "password_confirmation": "password"
}

Response: 
{
    "message": "Account created successfully",
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NjE3NTYxMDJ9.cOGs84bC2pVZ2BrEKkxEFjtXscUkZAn1OG6Sv8HJhUI"
}
```
   
   * If you are already completed signup before, then to get auth_token you need to login.
```
/auth/login
{
    "email": "jhadeepakkumar14@gmail.com",
    "password": "password"
}

Response:
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjE3NTYyOTN9.EZzhyRj3uaDfGBc1k3LeWTV2G5Bt5jp2B0tcgLOfOHw"
}    
```

* After getting auth token, user can access other APIs.


##Challenges you will face
Ensuring that API can be scaled and is well-tested, abstracting business logic in reusable concerns or services

##Questions
How does your solution perform?
```
1. I have added OAuth logic to make APIs secure.
2. I have written controller concerns to handle response and exception from one place.
   This will help when we want to expand or scale the application.
3. I have added JWT encoding/decoding and error messages and api version
   login in app/lib. 
4. I added 100% Rspec coverage.  
```
How does your solution scale?
```
1. I have added proper indexing in tables such that at any point data 
   increases then queries should not lag.
2. With the proper unit test coverage, developers will be much confident 
   in adding new features so it will help while scaling up the app.      
```
What would you improve next?
```
1. I would like to use serailizers and pagination that will help while scaling up.
2. At some point I would like to move this application from RESTful API to GraphQL API.
```