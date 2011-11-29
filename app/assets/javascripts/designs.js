function remove_fields(link) {
  jQuery(link).prev("input[type=hidden]").val("1");
  jQuery(link).closest(".image").hide();
}

function add_fields(link, association) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  //jQuery(link).before(content.replace(regexp, new_id));
  var new_image = jQuery("#new_image").clone();
  new_image.attr("id","");
  jQuery(link).before(new_image);
  new_image.find('input').removeAttr('disabled');
  new_image.find('textarea').removeAttr('disabled');
  new_image.show();
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
