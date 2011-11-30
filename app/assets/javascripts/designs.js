function remove_fields(link) {
  jQuery(link).prev("input[type=hidden]").val("1");
  jQuery(link).closest(".image").hide();
}

function add_fields(link, association) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  //jQuery(link).before(content.replace(regexp, new_id));
  var new_image = jQuery("#image_new").clone();
  new_image.removeAttr("id");
  jQuery("#image_new").before(new_image);

  //replacing input name id for a newer one.
  new_image.find('input').each(function(index,value){
      replace_id(new_id,value);
    });
  //replacing also the name id for textareas
  new_image.find('textarea').each(function(index,value){
      replace_id(new_id,value);
    });
  new_image.show();
}

//change ID for the input in order to make diferent input names.
function replace_id(new_id,value){
  var id = jQuery(value).attr("id");
  var name = jQuery(value).attr("name");
  jQuery(value).attr("name", name.replace("0",new_id));
  jQuery(value).attr("id", id.replace("0",new_id));
  jQuery(value).removeAttr('disabled');
}

jQuery(document).ready(function(){
  jQuery("input[type = file]").change(function() {
    var divImage = jQuery(this).closest("div.image_design");
    var options = {
      success: function(responseXML){
        var response = jQuery.parseJSON(jQuery(responseXML).text());
        divImage.find('img').attr("src",response.thumb);
        divImage.children("a[rel = facebox]").attr("href",response.original);
      }
    };

    jQuery(this).parent().parent().ajaxSubmit(options);
  });
});
