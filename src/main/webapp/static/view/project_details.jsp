<table id="product-table" border="0" width="100%" cellpadding="0" cellspacing="0">
<thead>
                          <tr>
                              <th class="table-header-repeat line-left minwidth-1"><a href="">Project_ID</a></th>
                              <th class="table-header-repeat line-left minwidth-1"><a href="">Description</a></th>
                              <th class="table-header-repeat line-left minwidth-1"><a href="">Type</a></th>
								<th class="table-header-repeat line-left minwidth-1"><a href="">Budget</a></th>
								
                          </tr>
                      </thead>
 <tbody>
 <tr>
 <td><span  ng-bind="vm.project.id" /></span></td>
 <td><span ng-bind="vm.project.desc" /></span></td>
 <td><span ng-bind="vm.project.type" /></span></td>
 <td><span ng-bind="vm.project.budget" /></span></td>
 </tr>
 </tbody>
 </table>
 <form >
 <textarea ng-model="vm.comment.txt" placeholder="Your Comment" style='width:550px'></textarea>
 <input type="submit" style='margin-top:10px;' value="Post Comment" ng-click="vm.AddComment(vm.comment)" class="styled-button-3"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="styled-button-3" ng-click="vm.vote_like()"><i class=" icon-thumbs-up">Like | {{like}}</i></button>
 <button class="styled-button-3" ng-click="vm.vote_dislike()"><i class=" icon-thumbs-down">Dislike | {{dislike}}</i></button>
 </form>


      <div >
      <ul >
                      <li ng-repeat="comment in vm.commentsByproject  track by $index">
                      <textarea ng-bind="comment.txt"  rows="2" spellcheck="false" disabled></textarea>
               </li>      
               </ul>         
</div>
                              
                          
                      