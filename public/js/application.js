// $(document).ready(function() {
//   $(".login").click(function() {

//     $.ajax({
//       type: 'get',
//       url: $(this).attr("href"),
//       success: function(msg){
//         $("body").html('').append(msg);
//       }
//     });
//     event.preventDefault();

//   });
// });


    function toggle_visibility(id) {
       var e = document.getElementById(id);
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }