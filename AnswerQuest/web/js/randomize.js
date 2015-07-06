/*
*
* @reference http://stackoverflow.com/a/1533945
* @reference http://jsbin.com/oyaxa/403/edit?html,css,output
* @author Nathan Ryan, x13448212
*
*/

$(document).ready(function() {
  $("div.answers").randomize("div.answer");
});

(function($) {
  
  $.fn.randomize = function(tree, childElem) {
    return this.each(function() {
      var $this = $(this);
      if (tree) $this = $(this).find(tree);
      var unsortedElems = $this.children(childElem);
      var elems = unsortedElems.clone();
      
      elems.sort(function() { return (Math.round(Math.random())-0.5); });  

      for(var i=0; i < elems.length; i++)
        unsortedElems.eq(i).replaceWith(elems[i]);
    });    
  };

})(jQuery);
