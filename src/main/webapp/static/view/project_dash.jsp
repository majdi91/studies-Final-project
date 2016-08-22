 <html>
 
 <%@page import="java.util.*"%>
 <%@page import="com.mongodb.*"%>
 <%@page import="com.websystique.springsecurity.model.*"%>
 <head>
 <link rel="stylesheet" href="static/plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="static/plugins/fullcalendar/fullcalendar.print.css" media="print">
 </head>
 <body>
  <section class="content">
          <div class="row">
            <div class="col-md-6">
              <div class="box_bis">
                <div class="box-header with-border">
                  <h3 class="box-title">Bordered Table</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered">
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Projects</th>
                      <th>Progress</th>
                      <th style="width: 40px">Label</th>
                    </tr>
                    <tr ng-repeat="a in vm.p  track by $index">
                      <td>{{a.id}}</td>
                      <td>{{a.desc}}</td>
                      <td>
                        <div class="progress progress-xs">
                          <div class="progress-bar progress-bar-primary" style="width:{{a.avancement}}%"></div>
                        </div>
                      </td>
                      <td><span class="badge bg-red">{{a.avancement}}%</span></td>
                    </tr>
                   
                  </table>
                </div><!-- /.box-body -->
              
              </div><!-- /.box -->
              </div>
              </div>
              </section>
              
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Calendar
            <small>Control panel</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Calendar</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
       <div class="row">
            <div class="col-md-3">
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h4 class="box-title">Draggable Events</h4>
                </div>
                <div class="box-body">
                  <!-- the events -->
                  <div id="external-events">
                    <div class="external-event bg-green">Lunch</div>
                    <div class="external-event bg-yellow">Go home</div>
                    <div class="external-event bg-aqua">Do homework</div>
                    <div class="external-event bg-light-blue">Work on UI design</div>
                    <div class="external-event bg-red">Sleep tight</div>
                    <div class="checkbox">
                      <label for="drop-remove">
                        <input type="checkbox" id="drop-remove">
                        remove after drop
                      </label>
                    </div>
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Create Event</h3>
                </div>
                <div class="box-body">
                  <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                    <!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
                    <ul class="fc-color-picker" id="color-chooser">
                      <li><a class="text-aqua" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-blue" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-light-blue" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-teal" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-yellow" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-orange" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-green" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-lime" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-red" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-purple" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-fuchsia" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-muted" href="#"><i class="fa fa-square"></i></a></li>
                      <li><a class="text-navy" href="#"><i class="fa fa-square"></i></a></li>
                    </ul>
                  </div><!-- /btn-group -->
                  <div class="input-group">
                    <input id="new-event" type="text" class="form-control" placeholder="Event Title">
                    <div class="input-group-btn">
                      <button id="add-new-event" type="button" class="btn btn-primary btn-flat">Add</button>
                    </div><!-- /btn-group -->
                  </div><!-- /input-group -->
                </div>
              </div>
            </div><!-- /.col -->
            <div class="col-md-9">
              <div class="box box-primary">
                <div class="box-body no-padding">
                  <!-- THE CALENDAR -->
                  <div id="calendar"></div>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
            </div><!-- /.col -->
            </div>
            </section>
       <%                 
                       List<Project> ps = new ArrayList<Project>();
                       List<Project> ps_incomp = new ArrayList<Project>();
                   	try{
                   	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
                   	DB db = mongoClient.getDB( "Persons" );
                   	DBCollection coll = db.getCollection("project");
                       System.out.println("Collection Project selected successfully");
                       DBCursor cursor = coll.find();
                       int i = 1;
               			
                       while (cursor.hasNext()) { 
                          System.out.println("fetched Document in Projects: "+i); 
                          DBObject dbo = cursor.next();
                          Project p = new Project();
                          
                          //System.out.println("ID: "+dbo.get("id"));
                          p.setId((String)dbo.get("project_id"));
                          p.setDesc((String)dbo.get("dsec"));
                          p.setTitre((String)dbo.get("titre"));
                          p.setCat((String)dbo.get("cat"));
                          p.setBudget((double)dbo.get("budget"));
                          p.setEtat((String)dbo.get("etat"));
                          p.setDate_deb((String)dbo.get("date_deb"));
                          p.setDate_fin((String)dbo.get("date_fin"));
                          p.setAvancement((Integer)dbo.get("avancement"));
                          if (p.getAvancement() != 100)  ps.add(p);
                         
                   	
                       i++;}}catch(Exception e){
                           	 e.printStackTrace();
                           
                            }%>
              
               <script>
      $(function () {

        /* initialize the external events
         -----------------------------------------------------------------*/
        function ini_events(ele) {
          ele.each(function () {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
              title: $.trim($(this).text()) // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);

            // make the event draggable using jQuery UI
            $(this).draggable({
              zIndex: 1070,
              revert: true, // will cause the event to go back to its
              revertDuration: 0  //  original position after the drag
            });

          });
        }
        ini_events($('#external-events div.external-event'));

        /* initialize the calendar
         -----------------------------------------------------------------*/
        //Date for the calendar events (dummy data)
        var date = new Date();
        var d = date.getDate(),
                m = date.getMonth(),
                y = date.getFullYear();
       
        $('#calendar').fullCalendar({
        	
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
          buttonText: {
            today: 'today',
            month: 'month',
            week: 'week',
            day: 'day'
          },
          //Random default events
        
          
                
       
            events: [
                     <%for (int j=0;j<ps.size();j++) {
                     char[] ch = ps.get(j).getDate_deb().toCharArray();
                     char[] ch1 = ps.get(j).getDate_fin().toCharArray();
                     String DD = String.copyValueOf(ch,0,2);
                     String D_fin = String.copyValueOf(ch1,0,2);
                     String MM=String.copyValueOf(ch,3,2);
                     String M_fin=String.copyValueOf(ch1,3,2);
                     String YY=String.copyValueOf(ch,6,4);
                     String Y_fin=String.copyValueOf(ch1,6,4);
                     %>
            {
              title: '<%=ps.get(j).getTitre()%>',
              start: '<%=YY%>-<%=MM%>-<%=DD%>',
              date_end: '<%=Y_fin%>-<%=M_fin%>-<%=D_fin%>', 
              backgroundColor: "#f56954", //red
              borderColor: "#f56954" //red
            },<% }%>
           
          ],
          eventMouseover: function (data, event, view) {
			  tooltip = '<div class="tooltiptopicevent" style="width:auto;height:auto;background:#eee;position:absolute;z-index:10001;padding:10px 10px 10px 10px ;  line-height: 200%;">' + 'title: '+ data.title + '</br>' + 'start: '  + moment(data.start).format("DD-MM-YYYY") + '</br>' + 'end: ' + moment(data.date_end).format("DD-MM-YYYY") + '</div>';
				$('#ui-tooltip-0').css("display", "block");
				$("body").append(tooltip);
				$(this).mouseover(function (e) {
					$(this).css('z-index', 10000);
					$('.tooltiptopicevent').fadeIn('500');
					$('.tooltiptopicevent').fadeTo('10', 1.9);
				}).mousemove(function (e) {
					$('.tooltiptopicevent').css('top', e.pageY + 10);
					$('.tooltiptopicevent').css('left', e.pageX + 20);
					
				});

				},
				eventMouseout: function (data, event, view) {   
					$(this).css('z-index', 8);

	            $('.tooltiptopicevent').remove();

					},
          editable: true,
          droppable: true, // this allows things to be dropped onto the calendar !!!
          drop: function (date, allDay) { // this function is called when something is dropped
        	  
            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;
            copiedEventObject.backgroundColor = $(this).css("background-color");
            copiedEventObject.borderColor = $(this).css("border-color");

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
              // if so, remove the element from the "Draggable Events" list
              $(this).remove();
            }

          }
        });

        /* ADDING EVENTS */
        var currColor = "#3c8dbc"; //Red by default
        //Color chooser button
        var colorChooser = $("#color-chooser-btn");
        $("#color-chooser > li > a").click(function (e) {
          e.preventDefault();
          //Save color
          currColor = $(this).css("color");
          //Add color effect to button
          $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
        });
        $("#add-new-event").click(function (e) {
          e.preventDefault();
          //Get value and make sure it is not null
          var val = $("#new-event").val();
          if (val.length == 0) {
            return;
          }

          //Create events
          var event = $("<div />");
          event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
          event.html(val);
          $('#external-events').prepend(event);

          //Add draggable funtionality
          ini_events(event);

          //Remove event from text input
          $("#new-event").val("");
        });
      });
    </script>
    </body>
    </html>