jQuery(function($){
	
	$.supersized({
	
		slideshow               :   1,
		autoplay				:	1,
		stop_loop				:	0,
		slide_interval          :   2500,
		transition              :   1,
		transition_speed		:	2500,
		new_window				:	0,
		pause_hover             :   0,
		keyboard_nav            :   0,
		performance				:	1,
		image_protect			:	1,			   
		min_width		        :   0,
		min_height		        :   0,
		vertical_center         :   1,
		horizontal_center       :   1,
		fit_always				:	0,
		fit_portrait         	:   1,
		fit_landscape			:   0,
		slide_links				:	'blank',
		thumb_links				:	0,
		thumbnail_navigation    :   0,
		progress_bar			:	0,
		mouse_scrub				:	0,
		slides 					:  	[
											{image : '/assets/background_02.jpg', title : 'background_02.jpg', thumb : '', url : ''},
											{image : '/assets/background_03.jpg', title : 'background_03.jpg', thumb : '', url : ''},
											{image : '/assets/background_04.jpg', title : 'background_04.jpg', thumb : '', url : ''}
										]
		
	});
  });

