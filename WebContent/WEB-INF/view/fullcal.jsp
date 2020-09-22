<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/fullcalendar-5.3.2/lib/main.css" rel="stylesheet" type="text/css">
<link href="/fullcalendar-5.3.2/lib/main.min.css" rel="stylesheet" type="text/css">
<link href="/fullcalendar-5.3.2/fullcalendar.css" rel="stylesheet" type="text/css">
<link href="/fullcalendar-5.3.2/fullcalendar.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/fullcalendar-5.3.2/lib/main.js"></script>
<script type="text/javascript" src="/fullcalendar-5.3.2/lib/main.min.js"></script>
<script type="text/javascript" src="/fullcalendar-5.3.2/lib/locales-all.js"></script>
<script type="text/javascript" src="/fullcalendar-5.3.2/lib/locales-all.min.js"></script> 
<script src="/js/jquery-3.5.1.min.js"></script>
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	initialView: 'dayGridMonth',
            initialDate: new Date(),
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            events: [
              {
                title: 'All Day Event',
                start: '2020-09-21'
              }
             ],
             selectable: true,
             selectHelper: true,
            /*  dateClick: function(info) {
                 alert('clicked ' + info.dateStr);
               }, */
             select: function(info) {
            	 prompt(' Create an event from ' + info.startStr + ' to '
            			 + info.endStr + " Enter a title: ", '');
            	 
             }
        
        });
        calendar.render();
      });

</script> 


<!--   <script type="text/javascript">
	  $(document).ready(function() {
		  $("#calender").fullcal({
			  header: { left: 'prev, today', 
				  	center: 'title', 
				  	right: 'month' 
				  },

			  defaultDate : new Date(),
			  editable : true,
			  eventLimit : true,
			  events: [
				  {
					  title : "Event",
					  start : "2020-09-21",
					  end : "2020-09-22"
				  },
			  ]
		  });
	});
</script>  -->
<style type="text/css">
html, body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}

#calendar {
  max-width: 1100px;
  margin: 40px auto;
}
</style>

</head>


<body>
	 <div id='calendar'></div>
	 
</body>


</html>