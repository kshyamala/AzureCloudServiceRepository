var app = angular.module("myModule", []);

app.service('operations', function ($http) {
    this.getUsers = function () {
        return $http.get("http://skazuredemo.cloudapp.net/api/user/list");
    } 
    this.post = function (User) {
        var request = $http({
            method: "post",             url: "http://skazuredemo.cloudapp.net/api/user/create",             data: User
        });         return request;
    }
 });

app.controller('myController', function ($scope, operations) {
     loadRecords();      function loadRecords() {
        var promiseGet = operations.getUsers();          promiseGet.then(             function (response) { $scope.users = response.data },             function (errorResponse) {alert("Error while retrieving user data. Response Code: " + errorResponse.data);}
        );
    }

    $scope.add = function () {

        var data = {
            fname: $scope.firstName,             lname: $scope.lastName,             age: $scope.age,             emailID: $scope.emailId,
        };          var promisePost = operations.post(data);             promisePost.then(function (response) {
                alert(response.data);                 loadRecords();                 clearData();
            },
            function (errorResponse) {
                //alert("Error while adding user data. Response Code: " + errorResponse.data);
                $scope.message = errorResponse.data;
                $scope.statuscode = errorResponse.statuscode;
                $scope.status = errorResponse.statusText;
                $scope.headers = errorResponse.headers();
            }
        );
            function parseErrorResponse(response) {
                var errors = [];
                for (var key in response.ModelState) {
                    for (var i = 0; i < response.ModelState[key].length; i++) {
                        errors.push(response.ModelState[key][i]);
                    }
                }
                return errors;
            }
    }; 
    function clearData() {
        $scope.firstName = "";
        $scope.lastName = "";
        $scope.age = "";
        $scope.emailId = "";
    }

});