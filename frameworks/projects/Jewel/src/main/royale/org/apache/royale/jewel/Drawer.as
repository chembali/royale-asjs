////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.royale.jewel
{
	import org.apache.royale.events.MouseEvent;
	import org.apache.royale.events.Event;
	import org.apache.royale.core.UIBase;
	import org.apache.royale.utils.StringUtil;

	/**
	 *  The Drawer class is a container component used for navigation
	 *  can be opened with the menu icon.
	 * 
	 *  It can be used in float or fixed modes. 
	 *  
	 *  float make the drawer appear over the screen without make anything change size
	 *  and click outside the drawer will hide it. Usually clicking in some navigation option
	 *  will hide it as well.
	 * 
	 *  fixed will need some place and make the other content shrink. click on navigation option 
	 *  in the drawer usually doesn't hide it.
	 *
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.9.3
	 */
	public class Drawer extends DrawerBase
	{
		public static const FLOAT:String = "float";
		public static const FIXED:String = "fixed";
		public static const AUTO:String = "auto";

		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
		public function Drawer()
		{
			super();

			// defaults to float (notice that float or fixed is needed always)
            typeNames = "jewel drawer " + FLOAT;

			addEventListener(MouseEvent.CLICK, internalMouseHandler);

			// TODO (carlosrovira) handle swipe touch gesture to close drawer in mobile (only on float)
			// addEventListener("touchstart" handleTouchStart);
			// addEventListener("touchmove" handleTouchMove);
			// addEventListener("touchend" handleTouchEnd);
		}

		// private function handleTouchStart(event:Event):void
		// {
		// }
		// private function handleTouchMove(event:Event):void
		// {
		// }
		// private function handleTouchEnd(event:Event):void
		// {
		// }

		private function internalMouseHandler(event:MouseEvent):void
		{
			COMPILE::JS
			{
				var hostComponent:UIBase = event.target as UIBase;
				var hostClassList:DOMTokenList = hostComponent.positioner.classList;
				if (hostClassList.contains("drawer"))
				{
					close();
				}
			}
		}

		private var _isOpen:Boolean;

		[Bindable]
        /**
         *  Open or close the drawer
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.3
         */
		public function get isOpen():Boolean
		{
            return _isOpen;
		}

		public function set isOpen(value:Boolean):void
		{
            if (_isOpen != value)
            {
                _isOpen = value;

                toggleClass("open", _isOpen);
				
				adjustAppScroll();

				_isOpen ? dispatchEvent(new Event("openDrawer")) : dispatchEvent(new Event("closeDrawer"));
            }
		}

		protected function adjustAppScroll():void
		{
			COMPILE::JS
			{
				//avoid scroll in html
				if(fixed)
				{
					document.body.classList.remove("remove-app-scroll");
				} else
				{
					document.body.classList.toggle("remove-app-scroll", _isOpen);
				}
			}
		}

		public function open():void
		{
            isOpen = true;
		}

		public function close():void
		{
            isOpen = false;
		}

		protected var _fixed:Boolean = false;

		[Bindable]
        /**
		 *  A boolean flag to switch between "float" and "fixed" effect selector.
		 *  Optional. Makes the drawer always fixed instead of floating.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get fixed():Boolean
        {
            return _fixed;
        }
        public function set fixed(value:Boolean):void
        {
            if (_fixed != value)
            {
                _fixed = value;

				if(_fixed)
				{
					typeNames = StringUtil.removeWord(typeNames, " " + FLOAT);
					typeNames += " " + FIXED;
				}
				else
				{
					typeNames = StringUtil.removeWord(typeNames, " " + FIXED);
					typeNames += " " + FLOAT;
				}

				COMPILE::JS
				{
					if (parent)
						setClassName(computeFinalClassNames()); 

					toggleClass("open", _isOpen);
				}
            }
        }

		protected var _auto:Boolean = false;
        /**
		 *  A boolean flag to activate "auto" effect selector.
		 *  Optional. Makes the drawer auto adapt using 
		 *  a float behaviour on mobile and tablets and fixed
		 *  behaviour on desktop.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get auto():Boolean
        {
            return _auto;
        }
        public function set auto(value:Boolean):void
        {
            if (_auto != value)
            {
                _auto = value;

				COMPILE::JS
				{
				if(_auto)
				{
					window.addEventListener('resize', autoResizeHandler, false);
				}
				else
				{
					window.removeEventListener('resize', autoResizeHandler, false);
				}
				}

                toggleClass("auto", _auto);
				autoResizeHandler();
            }
        }

		/**
		 *  When set to "auto" this resize handler monitors the width of the app window
		 *  and switch between fixed and float modes.
		 * 
		 *  Note:This could be done with media queries, but since it handles open/close
		 *  maybe this is the right way
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
		private function autoResizeHandler(event:Event = null):void
        {
			COMPILE::JS
			{
				var outerWidth:Number = window.outerWidth;

				var tmpFixed:Boolean = fixed;

				// Desktop width size
				if(outerWidth > 992)
				{
					fixed = true;
					if(tmpFixed != fixed)
					{
						open();
					}
				}
				else
				{
					fixed = false;
					if(tmpFixed != fixed)
					{
						close();
					}
				}

			}
		}
	}
}
