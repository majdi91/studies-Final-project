<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
            .my-drop-zone { border: dotted 3px lightgray; }
            .nv-file-over { border: dotted 3px red; } /* Default class applied to drop zones on over */
            .another-file-over-class { border: dotted 3px green; }

            html, body { height: 100%; }

            canvas {
                background-color: #f3f3f3;
                -webkit-box-shadow: 3px 3px 3px 0 #e3e3e3;
                -moz-box-shadow: 3px 3px 3px 0 #e3e3e3;
                box-shadow: 3px 3px 3px 0 #e3e3e3;
                border: 1px solid #c3c3c3;
                height: 100px;
                margin: 6px 0 0 6px;
            }
        </style>
</head>
<body onload="getUser()">
        <div growl></div>
        <section id="my-account-security-form" class="page container">
            <form id="userSecurityForm" class="form-horizontal"  ng-submit="vm.createAnn(vm.pub)" onload="getUser()">
                <div class="container">

                    <div class="alert alert-block alert-info">
                        <p>
                            Add a new anounce!
                        </p>
                    </div>
                    <div class="row">
                        <div id="acct-password-row" class="span7">
                            <fieldset>
                                <br>
                                <div class="control-group ">
                                    <label class="control-label">Title : <span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="current-pass-control" name="titre" class="span4" type="text" value="" autocomplete="false" ng-model="vm.pub.titre">

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Category :</label>
                                    <div class="controls">
                                        <select  class="styledselect_form_1" ng-model="vm.pub.cat" ng-options="cat for cat in vm.pub.cats">
											</select>

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Description :</label>
                                    <div class="controls">
                                        <textarea id="new-pass-verify-control" name="description" class="span4"   autocomplete="false" ng-model="vm.pub.desc" rows="4"></textarea>

                                    </div>
                                </div>
                                <div class="container"  nv-file-drop="" uploader="uploader">

           

            <div class="row">

                
                <div class="col-md-9" style="margin-bottom: 40px">
                 
                  <input type="file" nv-file-select="" uploader="uploader" multiple  />
                 
                  <p>Queue length: {{ uploader.queue.length }}</p>
                    <table class="table">
                        <thead>
                            <tr>
                                <th width="50%">Name</th>
                                <th ng-show="uploader.isHTML5">Size</th>
                                <th ng-show="uploader.isHTML5">Progress</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="item in uploader.queue">
                                <td>
                                    <strong>{{ item.file.name }}</strong>
                                    
                                    <!-- Image preview -->
                                    <!--auto height-->
                                    <!--<div ng-thumb="{ file: item.file, width: 100 }"></div>-->
                                    <!--auto width-->
                                    <div ng-show="uploader.isHTML5" ng-thumb="{ file: item._file, height: 100 }"></div>
                                    <!--fixed width and height -->
                                    <!--<div ng-thumb="{ file: item.file, width: 100, height: 100 }"></div>-->
                                </td>
                                <td ng-show="uploader.isHTML5" nowrap>{{ item.file.size/1024/1024|number:2 }} MB</td>
                                <td ng-show="uploader.isHTML5">
                                    <div class="progress" style="margin-bottom: 0;">
                                        <div class="progress-bar" role="progressbar" ng-style="{ 'width': item.progress + '%' }"></div>
                                    </div>
                                </td>
                                <td class="text-center">
                                    <span ng-show="item.isSuccess"><i class="glyphicon glyphicon-ok"></i></span>
                                    <span ng-show="item.isCancel"><i class="glyphicon glyphicon-ban-circle"></i></span>
                                    <span ng-show="item.isError"><i class="glyphicon glyphicon-remove"></i></span>
                                </td>
                                <td nowrap>
                                    <button type="button" class="btn btn-success btn-xs" ng-click="item.upload()" ng-disabled="item.isReady || item.isUploading || item.isSuccess">
                                        <span class="glyphicon glyphicon-upload"></span> Upload
                                    </button>
                                    <button type="button" class="btn btn-warning btn-xs" ng-click="item.cancel()" ng-disabled="!item.isUploading">
                                        <span class="glyphicon glyphicon-ban-circle"></span> Cancel
                                    </button>
                                    <button type="button" class="btn btn-danger btn-xs" ng-click="item.remove()">
                                        <span class="glyphicon glyphicon-trash"></span> Remove
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div>
                        <div>
                            Queue progress:
                            <div class="progress" style="">
                                <div class="progress-bar" role="progressbar" ng-style="{ 'width': uploader.progress + '%' }"></div>
                            </div>
                        </div>
                       
                    </div>

                </div>

            </div>

        </div>
                            </fieldset>
                        </div>
                        
                    </div>
                    
                    <footer id="submit-actions" class="form-actions">
                        <button id="submit-button" type="submit" class="btn btn-primary" name="action" value="CONFIRM" onClick="check();">Save</button>
                        <button type="submit" class="btn" name="action" value="CANCEL">Cancel</button>
                    	
                    </footer>
                </div>
            </form>
        </section>
    
            </div>
        </div>

     </body>   