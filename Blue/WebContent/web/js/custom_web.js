function initArrivalsSlider2()
	{
		if($('.arrivals_slider.a2').length)
		{
			var arrivalsSliders = $('.arrivals_slider.a2');
			arrivalsSliders.each(function()
			{
				var arrivalsSlider = $(this);
				initASlider2(arrivalsSlider);
			});	
			
		}
	}

	function initASlider2(as)
	{
		var arrivalsSlider = as;
		arrivalsSlider.on('init', function()
		{
			var activeItems = arrivalsSlider.find('.slick-slide.slick-active.a2');
			for(var x = 0; x < activeItems.length - 1; x++)
			{
				var item = $(activeItems[x]);
				item.find('.border_active.a2').removeClass('active');
				if(item.hasClass('slick-active'))
				{
					item.find('.border_active.a2').addClass('active');
				}
			}
		}).on(
		{
			afterChange: function(event, slick, current_slide_index, next_slide_index)
			{
				var activeItems = arrivalsSlider.find('.slick-slide.slick-active.a2');
				activeItems.find('.border_active.a2').removeClass('active');
				for(var x = 0; x < activeItems.length - 1; x++)
				{
					var item = $(activeItems[x]);
					item.find('.border_active.a2').removeClass('active');
					if(item.hasClass('slick-active'))
					{
						item.find('.border_active.a2').addClass('active');
					}
				}
			}
		})
		.slick(
		{
			rows:2,
			slidesToShow:6,
			slidesToScroll:6,
			infinite:false,
			arrows:false,
			dots:true,
			responsive:
			[
				{
					breakpoint:768, settings:
					{
						rows:2,
						slidesToShow:3,
						slidesToScroll:3,
						dots:true
					}
				},
				{
					breakpoint:575, settings:
					{
						rows:2,
						slidesToShow:2,
						slidesToScroll:2,
						dots:false
					}
				},
				{
					breakpoint:480, settings:
					{
						rows:1,
						slidesToShow:1,
						slidesToScroll:1,
						dots:false
					}
				}
			]
		});
	}
	function initArrivalsSliderSamsung()
	{
		if($('.arrivals_slider.asamsung').length)
		{
			var arrivalsSliders = $('.arrivals_slider.asamsung');
			arrivalsSliders.each(function()
			{
				var arrivalsSlider = $(this);
				initASliderSamsung(arrivalsSlider);
			});	
			
		}
	}

	function initASliderSamsung(as)
	{
		var arrivalsSlider = as;
		arrivalsSlider.on('init', function()
		{
			var activeItems = arrivalsSlider.find('.slick-slide.slick-active.asamsung');
			for(var x = 0; x < activeItems.length - 1; x++)
			{
				var item = $(activeItems[x]);
				item.find('.border_active.asamsung').removeClass('active');
				if(item.hasClass('slick-active'))
				{
					item.find('.border_active.asamsung').addClass('active');
				}
			}
		}).on(
		{
			afterChange: function(event, slick, current_slide_index, next_slide_index)
			{
				var activeItems = arrivalsSlider.find('.slick-slide.slick-active.a2');
				activeItems.find('.border_active.a2').removeClass('active');
				for(var x = 0; x < activeItems.length - 1; x++)
				{
					var item = $(activeItems[x]);
					item.find('.border_active.asamsung').removeClass('active');
					if(item.hasClass('slick-active'))
					{
						item.find('.border_active.asamsung').addClass('active');
					}
				}
			}
		})
		.slick(
		{
			rows:2,
			slidesToShow:6,
			slidesToScroll:6,
			infinite:false,
			arrows:false,
			dots:true,
			responsive:
			[
				{
					breakpoint:768, settings:
					{
						rows:2,
						slidesToShow:3,
						slidesToScroll:3,
						dots:true
					}
				},
				{
					breakpoint:575, settings:
					{
						rows:2,
						slidesToShow:2,
						slidesToScroll:2,
						dots:false
					}
				},
				{
					breakpoint:480, settings:
					{
						rows:1,
						slidesToShow:1,
						slidesToScroll:1,
						dots:false
					}
				}
			]
		});
	}
	function initArrivalsSliderXiaomi()
	{
		if($('.arrivals_slider.axiaomi').length)
		{
			var arrivalsSliders = $('.arrivals_slider.axiaomi');
			arrivalsSliders.each(function()
			{
				var arrivalsSlider = $(this);
				initASliderXiaomi(arrivalsSlider);
			});	
			
		}
	}

	function initASliderXiaomi(as)
	{
		var arrivalsSlider = as;
		arrivalsSlider.on('init', function()
		{
			var activeItems = arrivalsSlider.find('.slick-slide.slick-active.axiaomi');
			for(var x = 0; x < activeItems.length - 1; x++)
			{
				var item = $(activeItems[x]);
				item.find('.border_active.axiaomi').removeClass('active');
				if(item.hasClass('slick-active'))
				{
					item.find('.border_active.axiaomi').addClass('active');
				}
			}
		}).on(
		{
			afterChange: function(event, slick, current_slide_index, next_slide_index)
			{
				var activeItems = arrivalsSlider.find('.slick-slide.slick-active.axiaomi');
				activeItems.find('.border_active.axiaomi').removeClass('active');
				for(var x = 0; x < activeItems.length - 1; x++)
				{
					var item = $(activeItems[x]);
					item.find('.border_active.axiaomi').removeClass('active');
					if(item.hasClass('slick-active'))
					{
						item.find('.border_active.axiaomi').addClass('active');
					}
				}
			}
		})
		.slick(
		{
			rows:2,
			slidesToShow:6,
			slidesToScroll:6,
			infinite:false,
			arrows:false,
			dots:true,
			responsive:
			[
				{
					breakpoint:768, settings:
					{
						rows:2,
						slidesToShow:3,
						slidesToScroll:3,
						dots:true
					}
				},
				{
					breakpoint:575, settings:
					{
						rows:2,
						slidesToShow:2,
						slidesToScroll:2,
						dots:false
					}
				},
				{
					breakpoint:480, settings:
					{
						rows:1,
						slidesToShow:1,
						slidesToScroll:1,
						dots:false
					}
				}
			]
		});
	}
	initArrivalsSlider2();
	initArrivalsSliderSamsung();
	initArrivalsSliderXiaomi();