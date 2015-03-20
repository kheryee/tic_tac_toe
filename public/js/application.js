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

var add = (function () {
    var counter = 0;
    return function () {return counter += 1;}
})();



    function toggle_visibility(id) {
       var e = document.getElementById(id);
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }


function saveToData(grid_id) {
  var id = "th #" + grid_id;
  $(id).append("<b>X</b>");
}

$(document).ready(function() {
  $("td").one("click", function(){
    var grid_id = (event.target.id);
    $(this).empty().append("<b>X</b>");
    var count = add();
    // console.log(count);
    $.ajax({
      type: "post",
      url: "/game",
      data: {grid_id: grid_id, count: count},
      dataType: "json",
      success: function(event){
        saveToData(grid_id);
      }
    });
  });
});


// <script language="JavaScript">
//   window.onbeforeunload = confirmExit;
//   function confirmExit()
//   {
//     return "Are you sure you wanna leave tde otder player alone? :(";
//   }
// </script>









































// $(document).click(function(){
//   alert("Struggle, Frustation & Tears")
// })