$(function() {
   $('#changeId').on('click', function(event) {
       event.preventDefault();
       $.popupWindow('requestId.do', {
           width: 400,
           height: 400,
           center: 'screen'
       });
   });
   
   $('#dropButton').on('click', function(event) {
       event.preventDefault();
       $.popupWindow('requestDrop.do', {
           width: 400,
           height: 300,
           center: 'screen'
       });
   });
})
