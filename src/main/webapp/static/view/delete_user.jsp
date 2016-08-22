

           
       <section class="page container">
            <div class="row">
                
                                <div class="span12">
                                <div id="{{user.username}}" class="box">
                        <div class="box-header">
                            <i class="icon-user icon-large"></i>
                            
                            
                        </div>
                        <div class="box-content box-table">
                        <table class="table table-hover tablesorter">
                            <thead>
                                <tr>
                                    <th>FirstName</th>
                                    <th>LastName</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            
                                <tr ng-repeat="user in vm.users  track by $index">
                                    <td>{{user.firstName}}</td>
                                    <td>{{user.lastName}}</td>
                                    <td>{{user.email}}</td>
                                    <td>{{user.role}}</td>
                                    <td><a title="Details" class="fa fa-trash-o" ng-click="vm.edit_delete(user.username)" ></a></td> 
                                </tr>
                            
                            </tbody>
                        </table>
                        </div>
</div>
                    </div>
                                </div>
                                </section>
                                

