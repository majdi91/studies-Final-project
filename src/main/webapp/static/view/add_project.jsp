<html>
<body>
        <section id="my-account-security-form" class="page container">
	 <form name="form" ng-submit="vm.createProject(vm.p)" role="form">
	<div class="container">

                    <div class="alert alert-block alert-info">
                        <p>
                            Add a new Project!
                        </p>
                    </div>
                    <div class="row">
                        <div id="acct-password-row" class="span7">
                            <fieldset>
                            
                                <div class="control-group ">
                                    <label class="control-label">Id <span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="current-pass-control" name="titre" class="span4" type="text" value="" autocomplete="false" ng-model="vm.p.id">

                                    </div>
                                </div>
                                
                                <div class="control-group ">
                                    <label class="control-label">Titre <span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="current-pass-control" name="titre" class="span4" type="text" value="" autocomplete="false" ng-model="vm.p.titre">

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Category</label>
                                    <div class="controls">
                                        <select  class="styledselect_form_1" ng-model="vm.p.cat" ng-options="cat for cat in cats">
											</select>

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Description</label>
                                    <div class="controls">
                                        <textarea id="new-pass-verify-control" name="description" class="span4"   autocomplete="false" ng-model="vm.p.desc" rows="4"></textarea>

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Budget <span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="current-pass-control" name="budget" class="span4" type="text" value="" autocomplete="false" ng-model="vm.p.budget">

                                    </div>
                                </div>
                                 <div class="form-group">
                    			<label>Date range:</label>
                    			<div class="input-group">
                     			 <div class="input-group-addon">
                       			 <i class="fa fa-calendar"></i>
                     			 </div>
                      		<input type="text" class="form-control pull-right" id="reservation" ng-model="vm.p.date">
                   			 </div><!-- /.input group -->
                   			 
                  </div>
                            </fieldset>
                        </div>
                        
                    </div>
                    
                    <footer id="submit-actions" class="form-actions">
                        <button id="submit-button" type="submit" class="btn btn-primary" name="action" value="CONFIRM" onClick="check();">Save</button>
                        <button type="submit" class="btn" name="action" value="CANCEL">Cancel</button>
                    	<a href="<c:url value='/upload' />" ><input type="button" value="Upload Files" class="btn"  /></a>
                    </footer>
                </div>
            </form>
        </section>
    <script>
      $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
        //Money Euro
        $("[data-mask]").inputmask();

        //Date range picker
        $('#reservation').daterangepicker();
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
        //Date range as a button
        $('#daterange-btn').daterangepicker(
            {
              ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
              },
              startDate: moment().subtract(29, 'days'),
              endDate: moment()
            },
        function (start, end) {
          $('#reportrange span').html(start.format("dd/mm/yyyy") + ' - ' + end.format("dd/mm/yyyy"));
        }
        );

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
          checkboxClass: 'icheckbox_minimal-blue',
          radioClass: 'iradio_minimal-blue'
        });
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
          checkboxClass: 'icheckbox_minimal-red',
          radioClass: 'iradio_minimal-red'
        });
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
          checkboxClass: 'icheckbox_flat-green',
          radioClass: 'iradio_flat-green'
        });

        //Colorpicker
        $(".my-colorpicker1").colorpicker();
        //color picker with addon
        $(".my-colorpicker2").colorpicker();

        //Timepicker
        $(".timepicker").timepicker({
          showInputs: false
        });
      });
    </script>
    </body>
    </html>
           

