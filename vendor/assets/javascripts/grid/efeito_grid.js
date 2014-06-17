;( function( window ) {
	
	var docElem = window.document.documentElement;
	//Pega o tamanho da janela
	var viewportH = window['innerHeight'];
	
	function inViewport(el, h) {
		var elH = el.offsetHeight,
			scrolled = scrollY(),
			viewed = scrolled + getViewportH(),
			elTop = getOffset(el).top,
			elBottom = elTop + elH,
			//Se h 0 entao o elemento é considerado no viewport assim que ele entra
			//Se h 1 entao o elemento só é considerado no viewport quando ele estiver totalmente dentro
			h = h || 0;
			return (elTop + elH * h) <= viewed &&(elBottom - elH * h) >= scrolled;
	}
	
	function getViewportH() {
		var viewportH = window['innerHeight'];
		
		return viewportH;
	}
	
	//Pega a posicao x e y de um elemento passado
	function getOffset(el) {
		var offsetTop = 0, offsetLeft = 0;
		do {
			if(!isNaN(el.offsetTop ) ) {
				offsetTop += el.offsetTop;
			}
			if(!isNaN(el.offsetLeft) ) {
				offsetLeft += el.offsetLeft;
			}
		}while( el = el.offsetParent)
		
		return {
			top: offsetTop,
			left: offsetLeft
		}
	}
	//Retorna a posiçao Y da tela
	function scrollY() {
		return window.pageYOffset || docElem.scrollTop;
	}
	function extend( a, b ) {
		for( var key in b ) { 
			if( b.hasOwnProperty( key ) ) {
				a[key] = b[key];
			}
		}
		return a;
	}
	
	function AnimOnScroll(el,options) {
		this.el = el;
		this.options = extend(this.defaults, options);
		this._init();
	}
	
	//Adicionar os efetiso
	AnimOnScroll.prototype = {
		defaults : {
			minDuration : 0.1,
			maxDuration : 1,
			
			viewportFactor : 0
		},
		_init : function() {
			this.items = Array.prototype.slice.call(
				document.querySelectorAll('#' +this.el.id + ' > div '));
			this.itemsCount = this.items.length;
			//Numero de itens renderizados(mostrados)
			this.itemsRenderedCount = 0;
			this.didScroll = false;
			
			console.log(this.items);
			console.log('Possui :' + this.itemsCount);
			
			var self = this;
			
			imagesLoaded(this.el, function() {
				
				new Masonry(self.el, {
					itemSelector: '.item',
					transitionDuration : 0
				});
				
				self.items.forEach( function( el, i ) {
					if( inViewport( el ) ) {
						self._checkTotalRendered();
						$(el).addClass('animate' );
					}
				});
				
				window.addEventListener( 'ready', function() {
					self._onScrollFn();
				}, false);
				
				window.addEventListener( 'resize', function() {
					self._resizeHandler();
				}, false );
				
				window.addEventListener('scroll', function() {
					self._onScrollFn();
				},false);
			
			});
			
		},
		_onScrollFn : function () {
			//console.log('scrollFn\n');
			var self = this;
			if(!this.didScroll) {
				this.didScroll = true;
				setTimeout(function () {self._scrollPage();}, 60);
			}
		},
		_scrollPage : function () {
			var self = this;
			//console.log('scrollPage\n');
			this.items.forEach(function(el, i) {
				if(!$(el).hasClass('shown') && !$(el).hasClass('animate') && 
				inViewport(el, self.options.viewportFactor)) {
					setTimeout(function () {
						var perspY = scrollY() + getViewportH() /2 ;
						self.el.style.WebkitPerspectiveOrigin = '50% ' + perspY + 'px';
						self.el.style.MozPerspectiveOrigin = '50% ' + perspY + 'px';
						self.el.style.perspectiveOrigin = '50% ' + perspY + 'px';
						
						self._checkTotalRendered();
						if(self.options.minDuration && self.options.maxDuration) {
							console.log('entrou no duracao');
							var randDuration = (Math.random() * 
							(self.options.maxDuration - self.options.minDuration) + self.options.minDuration) + 's';
							el.style.WebkitAnimationDuration = randDuration;
							el.style.MozAnimationDuration = randDuration;
							el.style.animationDuration = randDuration;
						}
						
						$(el).addClass('animate');
					}, 25);
				}
			});
			this.didScroll = false;
		},
		_resizeHandler : function () {
			var self = this;
			function delayed() {
				self._scrollPage();
				self.resizeTimeout = null;
			}
			if(this.resizeTimeout) {
				clearTimeout(this.resizeTimeout);
			}
			this.resizeTimeout = setTimeout(delayed, 1000);
		},
		_checkTotalRendered : function () {
			++this.itemsRenderedCount;
			if(this.itemsRenderedCount === this.itemsCount) {
				window.removeEventListener('scroll', this._onScrollFn);
			}
		}
	};
	
	//Adiciona o namespace global
	window.AnimOnScroll = AnimOnScroll;
})(window);