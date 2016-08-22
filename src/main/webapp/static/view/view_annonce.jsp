<!-- <div class="row"> -->
<!--  <div class="span8"> -->
<!--                  <div class="blockoff-left"> -->
<!--                     <legend class="lead"> -->
<!--                         Welcome -->
<!--                     </legend> -->
<!--                     <p> -->
<!--                         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor -->
<!--                         incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud -->
<!--                         exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. -->
<!--                     </p> -->
<!--                 </div> -->
                
<!--             </div> -->
<!--           </div> -->
<!--  <div class="row">          -->
<!-- <div class="span8"> -->
<!-- 		<div class="blockoff-left"> -->
<!--                 <div class="box pattern pattern-sandstone"> -->
<!--                     <div class="box-header"> -->
<!--                         <i class="icon-list"></i> -->
<!--                         <h5>Lists</h5> -->
<!--                         <button class="btn btn-box-right" data-toggle="collapse" data-target=".box-list"> -->
<!--                             <i class="icon-reorder"></i> -->
<!--                         </button> -->
<!--                     </div> -->
<!--                     <div class="box-content box-list collapse in" ng-controller="AnnController as ctr"> -->
<!--                         <ul> -->
<!--                             <li ng-repeat="a in ctr.pubs  track by $index"> -->
<!--                                 <div> -->
<!--                                     <p>{{a.titre}}</p> -->
<!--                                     <p>{{a.lib}}</p> -->
                                    
<!--                                 </div> -->
<!--                             </li> -->
                            
<!--                            </ul> -->
<!--                    </div> -->

<!--                 </div> -->
<!--            </div> -->
<!--            </div> -->
<!--         <div class="span8"> -->
<!--                 <div class="box"> -->
<!--                     <div class="box-header"> -->
<!--                         <i class="icon-book"></i> -->
<!--                         <h5>Forms</h5> -->
<!--                     </div> -->
<!--                     <div class="box-content"> -->
<!--                         <form class="form-inline"> -->
<!--                             <p>Login</p> -->
<!--                             <div class="input-prepend"> -->
<!--                                 <span class="add-on"><i class="icon-envelope"></i></span> -->
<!--                                 <input class="span4" type="text" placeholder="Email address"> -->
<!--                             </div> -->
<!--                             <div class="input-prepend"> -->
<!--                                 <span class="add-on"><i class="icon-key"></i></span> -->
<!--                                 <input class="span4" type="password" placeholder="Password"> -->
<!--                             </div> -->
<!--                         </form> -->
                        
<!--                     </div> -->
<!--                     <div class="box-footer"> -->
<!--                         <button type="submit" class="btn btn-primary"> -->
<!--                             <i class="icon-ok"></i> -->
<!--                             Submit -->
<!--                         </button> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
       <div class="row">
            <div class="col-md-12">
              <!-- The time line -->
              <ul class="timeline" ng-controller="AnnController as ctr">
                <!-- timeline time label -->
               
                <!-- /.timeline-label -->
                <!-- timeline item -->
                <li ng-repeat="a in ctr.pubs  track by $index">
                  <i class="fa fa-tags bg-blue"></i>
                  <div class="timeline-item">
                    <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
                    <h3 class="timeline-header"><a href="javascript:void(0)">{{a.lib}}</a></h3>
                    <div class="timeline-body" >
                       <p>{{a.titre}}</p> 
                               <p>{{a.lib}}</p> 
                               <div ng-repeat="b in a.file_name  track by $index">
                                <img ng-src="{{myImgSrc}}{{b}}" alt="Description" width="30%"/> 
                               </div>
                    </div>
                    <div class="timeline-footer">
                      <a class="btn btn-primary btn-xs">Read more</a>
                      <a class="btn btn-danger btn-xs">Delete</a>
                    </div>
                  </div>
                </li>
		
            </ul>
            </div></div>
            
                       
                