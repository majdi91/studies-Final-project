
<!-- <div id="page-heading"><h1>List of Projects</h1> </div> -->

<!--  <table id="product-table" border="0" width="100%" cellpadding="0" cellspacing="0"> -->
<!--  <thead> -->
<!--                           <tr> -->
<!--                               <th class="table-header-repeat line-left minwidth-1"><a href="">Id</a></th> -->
<!--                               <th class="table-header-repeat line-left minwidth-1"><a href="">Titre</a></th> -->
<!--                               <th class="table-header-repeat line-left minwidth-1"><a href="">Category</a></th> -->

<!--                           </tr> -->
<!--                       </thead> -->
<!--                       <tbody> -->
<!--                           <tr ng-repeat="project in vm.projects  track by $index"> -->
<!--                               <td><span ng-bind="project.id" ></span></td> -->
<!--                               <td><span ng-bind="project.titre" ></span></td> -->
<!--                               <td><span ng-bind="project.cat"></span></td> -->
                              
<!--                               <td class="options-width"> -->
<!--                               <a ng-href="#/project_details" title="Details" class="icon-1 info-tooltip" ng-click="vm.edit(project.titre)" ></a> -->
					        

<!--                               </td> -->
<!--                           </tr> -->
<!--                       </tbody> -->
<!--                   </table> -->
           <div class="span4">
                    <div class="blockoff-right">
                        <ul id="person-list" class="nav nav-list">
                            <li class="nav-header">Menu</li>
                           
                            <li >
                                   <a href="#/add_project">
                                        <i class="icon-chevron-right pull-right"></i>
                                      add new project
                                    </a>
                                </li>
                                </ul>
                                </div>
                                </div>
       <div class="span8">
                <div class="box pattern pattern-sandstone">
                    <div class="box-header">
                        <i class="icon-list"></i>
                        <h5>Lists</h5>
                        
                        <button class="btn btn-box-right" data-toggle="collapse" data-target=".box-list">
                            <i class="icon-reorder"></i>
                        </button>
                    </div>
                    <div class="box-content box-list collapse in" >
                        <ul>
                            <li ng-repeat="a in vm.projects  track by $index">
                                <div>
                                <p>{{a.titre}}</p>
                                   <p>{{a.id}}</p>
                                   <p>{{a.cat}}</p>
                                    <a ng-href="#/project_details" title="Details" class="icon-pencil" ng-click="vm.edit(a.titre)" ></a>
                                </div>
                            </li>
                            
                           </ul>
                   </div>

                </div>
            </div>

