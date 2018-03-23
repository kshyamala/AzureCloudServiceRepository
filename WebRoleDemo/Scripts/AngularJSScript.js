var app = angular.module("myModule", []);

app.service('operations', function ($http) {
    this.getUsers = function () {
        return $http.get("http://skazuredemo.cloudapp.net/api/user/list");
        //return $http.get("http://localhost:57996/api/user/list");
    } 
    this.post = function (User) {
        var request = $http({
            method: "post",             url: "http://skazuredemo.cloudapp.net/api/user/create",             //url: "http://localhost:57996/api/user/create",             data: User
        });         return request;
    }
 });

app.controller('myController', function ($scope, operations) {
     loadRecords();      function loadRecords() {
        var promiseGet = operations.getUsers();          promiseGet.then(             function (response) { $scope.users = response.data },             function (errorResponse) { $scope.statusMessage = "Error while retrieving user data: " + errorResponse.data.Message;}
        );
    }

    $scope.add = function () {
        $scope.statusMessage = "";
        var data = {
            fname: $scope.firstName,             lname: $scope.lastName,             age: $scope.age,             emailID: $scope.emailId,
        };         var promisePost = operations.post(data);             promisePost.then(function (response) {
                $scope.statusMessage = "User created successfully";                 loadRecords();                 clearData();
            },
            function (errorResponse) {
                debugger;
                $scope.statusMessage = "Error: " + errorResponse.data.Message;
            }
        );
            
    };     
    function clearData() {
        $scope.firstName = "";
        $scope.lastName = "";
        $scope.age = "";
        $scope.emailId = "";        
    }

});