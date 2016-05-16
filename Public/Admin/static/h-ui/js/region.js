function loadRegion(sel,type_id,selName,url){

	jQuery("#"+selName+" option").each(function(){
		jQuery(this).remove();
	});
	jQuery("<option value=''>请选择</option>").appendTo(jQuery("#"+selName));
	if(jQuery("#"+sel).val()==''){
		
		return;
	}
	jQuery.getJSON(url,{pid:jQuery("#"+sel).val(),type:type_id},
		function(data){
			if(data){
				
				jQuery.each(data,function(idx,item){
					
					jQuery("<option value="+item.region_id+">"+item.region_name+"</option>").appendTo(jQuery("#"+selName));
				
				});
			}else{
				jQuery("<option value=''>请选择</option>").appendTo(jQuery("#"+selName));
			}
		}
	);
}