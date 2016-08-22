  <body ng-app="myApp" ng-controller="UserController">
  <form name="form" ng-submit="vm.submit()" role="form">
        <div class="form-group" ng-class="{ 'has-error': form.firstName.$dirty && form.firstName.$error.required }">
            <label for="firstName">First name</label>
            <input type="text" name="firstName" id="firstName" class="form-control" ng-model="vm.user.firstName" required />
            <span ng-show="form.firstName.$dirty && form.firstName.$error.required" class="help-block">First name is required</span>
        </div>
        </form>
  </body>      