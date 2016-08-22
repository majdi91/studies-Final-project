 <section class="content">
          <div class="row">
            <!-- left column -->
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Add User</h3>
                </div>
 <form role="form">
                  <div class="box-body">
                  <div class="form-group">
                      <label for="exampleInputEmail1">FirstName</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter your firstname" ng-model="vm.user.firstName" required>
                   <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">LastName</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter your lastname" ng-model="vm.user.lastName" required>
                    <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">UserName</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter username" ng-model="vm.user.username" required ng-minlength="3">
                    <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" ng-model="vm.user.email" required>
                    <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Role</label>
                      <input type="text" class="form-control" id="exampleInput" placeholder="Enter your role" ng-model="vm.user.role" required>
                    <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" ng-model="vm.user.password" required>
                    <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Confirm Password</label>
                      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm password" required>
                    <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                    </div>
                    
                    
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary" ng-click="vm.createUser(vm.user)">Submit</button>
                  </div>
                </form>
                </div>
                </div>
                </div>
                </section>
                