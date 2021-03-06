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
package org.apache.royale.jewel.beads.layouts
{
	import org.apache.royale.core.LayoutBase;
	import org.apache.royale.core.IBeadLayout;
	import org.apache.royale.core.ILayoutChild;
	import org.apache.royale.core.ILayoutView;
	import org.apache.royale.core.IUIBase;
	import org.apache.royale.core.IStrand;

	COMPILE::JS {
    	import org.apache.royale.core.UIBase;
    }

    /**
     *  The GridCellLayout class is the layout used for childrens in a Grid
     *
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion Royale 0.9.3
     */
	public class GridCellLayout extends LayoutBase implements IBeadLayout
	{
		public static const MAX_COLUMNS:Number = 12;
		public static const PHONE:String = "phone";
		public static const TABLET:String = "tablet";
		public static const DESKTOP:String = "desktop";

        /**
         *  Constructor.
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.3
         */
		public function GridCellLayout()
		{
			super();
		}

		/**
		 * @royalesuppresspublicvarwarning
		 */
		public static const LAYOUT_TYPE_NAMES:String = "cell";

		COMPILE::JS
		private var hostComponent:UIBase;

		COMPILE::JS
		protected var hostClassList:DOMTokenList;

		/**
		 *  @copy org.apache.royale.core.IBead#strand
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
		override public function set strand(value:IStrand):void
		{
			super.strand = value;

			COMPILE::JS
			{
				hostComponent = host as UIBase;
				hostClassList = hostComponent.positioner.classList;
				
				setFractionForScreen(DESKTOP, _desktopNumerator, _desktopDenominator);
				setFractionForScreen(TABLET, _tabletNumerator, _tabletDenominator);
				setFractionForScreen(PHONE, _phoneNumerator, _phoneDenominator);
			}
		}

		private var _desktopNumerator:Number;
		/**
		 *  The X Number for "desktop-col-X-Y" effect selector.
		 *  Sets the desktop numerator for the X/Y fraction that indicates the cell's size in
		 * 	desktop screen. Needs to be set in conjunction with desktop denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get desktopNumerator():Number
        {
            return _desktopNumerator;
        }

        public function set desktopNumerator(value:Number):void
        {
			if (_desktopNumerator != value)
            {
                COMPILE::JS
                {
					if(hostComponent)
						setFractionForScreen(DESKTOP, value, _desktopDenominator);
					_desktopNumerator = value;
				}
			}
		}

		private var _desktopDenominator:Number;
		/**
		 *  The Y Number for "desktop-col-X-Y" effect selector.
		 *  Sets the desktop denominator for the X/Y fraction that indicates the cell's size in
		 *  desktop screen. Needs to be set in conjunction with desktop denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get desktopDenominator():Number
        {
            return _desktopDenominator;
        }

        public function set desktopDenominator(value:Number):void
        {
			if (_desktopDenominator != value)
            {
                COMPILE::JS
                {
					if(hostComponent)
						setFractionForScreen(DESKTOP, _desktopNumerator, value);
					_desktopDenominator = value;
				}
			}
		}

		private var _tabletNumerator:Number;
		/**
		 *  The X Number for "tablet-col-X-Y" effect selector.
		 *  Sets the tablet numerator for the X/Y fraction that indicates the cell's size in
		 * 	tablet screen. Needs to be set in conjunction with tablet denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get tabletNumerator():Number
        {
            return _tabletNumerator;
        }

        public function set tabletNumerator(value:Number):void
        {
			if (_tabletNumerator != value)
            {
                COMPILE::JS
                {
					if(hostComponent)
						setFractionForScreen(TABLET, value, _tabletDenominator);
					_tabletNumerator = value;
				}
			}
		}

		private var _tabletDenominator:Number;
		/**
		 *  The Y Number for "tablet-col-X-Y" effect selector.
		 *  Sets the tablet denominator for the X/Y fraction that indicates the cell's size in
		 *  tablet screen. Needs to be set in conjunction with tablet denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get tabletDenominator():Number
        {
            return _tabletDenominator;
        }

        public function set tabletDenominator(value:Number):void
        {
			if (_tabletDenominator != value)
            {
                COMPILE::JS
                {
					if(hostComponent)
						setFractionForScreen(TABLET, _tabletNumerator, value);
					_tabletDenominator = value;
				}
			}
		}

		private var _phoneNumerator:Number;
		/**
		 *  The X Number for "phone-col-X-Y" effect selector.
		 *  Sets the phone numerator for the X/Y fraction that indicates the cell's size in
		 * 	phone screen. Needs to be set in conjunction with phone denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get phoneNumerator():Number
        {
            return _phoneNumerator;
        }

        public function set phoneNumerator(value:Number):void
        {
			if (_phoneNumerator != value)
            {
                COMPILE::JS
                {
					if(hostComponent)
						setFractionForScreen(PHONE, value, _phoneDenominator);
					_phoneNumerator = value;
				}
			}
		}

		private var _phoneDenominator:Number;
		/**
		 *  The Y Number for "phone-col-X-Y" effect selector.
		 *  Sets the phone denominator for the X/Y fraction that indicates the cell's size in
		 *  phone screen. Needs to be set in conjunction with phone denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get phoneDenominator():Number
        {
            return _phoneDenominator;
        }

        public function set phoneDenominator(value:Number):void
        {
			if (_phoneDenominator != value)
            {
                COMPILE::JS
                {
					if(hostComponent)
						setFractionForScreen(PHONE, _phoneNumerator, value);
					_phoneDenominator = value;
				}
			}
		}

		COMPILE::JS
		private function setFractionForScreen(screen:String, num:Number, den:Number):void
		{
			if(num && den)
			{
				if (num <= 0 || num > MAX_COLUMNS)
					throw new Error(screen + " numerator must be between 1 and " + MAX_COLUMNS);
				if (den <= 0 || den > MAX_COLUMNS)
					throw new Error(screen + " denominator must be between 1 and " + MAX_COLUMNS);
				
				if (hostClassList.contains(screen + "-col-" + _desktopNumerator + "-" + _desktopDenominator))
					hostClassList.remove(screen + "-col-" + _desktopNumerator + "-" + _desktopDenominator);
				hostClassList.add(screen + "-col-" + num + "-" + den);
			}
        }

		private var _phoneVisible:Boolean;
		/**
		 *  Makes the cell to be visible or hidden in phone size
		 *  Uses "visible-phone" and "hidden-phone" effect selectors.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get phoneVisible():Boolean
        {
            return _phoneVisible;
        }

        public function set phoneVisible(value:Boolean):void
        {
			if (_phoneVisible != value)
            {
                COMPILE::JS
                {
					_phoneVisible = value;

					if(hostComponent)
					{
						if(_phoneVisible)
						{
							if (hostClassList.contains("hidden-phone"))
								hostClassList.remove("hidden-phone");
							hostClassList.add("visible-phone");
						} else
						{
							if (hostClassList.contains("visible-phone"))
								hostClassList.remove("visible-phone");
							hostClassList.add("hidden-phone");
						}
					}
				}
			}
		}

		private var _tabletVisible:Boolean;
		/**
		 *  Makes the cell to be visible or hidden in phone size
		 *  Uses "visible-tablet" and "hidden-tablet" effect selectors.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get tabletVisible():Boolean
        {
            return _tabletVisible;
        }

        public function set tabletVisible(value:Boolean):void
        {
			if (_tabletVisible != value)
            {
                COMPILE::JS
                {
					_tabletVisible = value;

					if(hostComponent)
					{
						if(_tabletVisible)
						{
							if (hostClassList.contains("hidden-tablet"))
								hostClassList.remove("hidden-tablet");
							hostClassList.add("visible-tablet");
						} else
						{
							if (hostClassList.contains("visible-tablet"))
								hostClassList.remove("visible-tablet");
							hostClassList.add("hidden-tablet");
						}
					}
				}
			}
		}

		private var _desktopVisible:Boolean;
		/**
		 *  Makes the cell to be visible or hidden in phone size
		 *  Uses "visible-desktop" and "hidden-desktop" effect selectors.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get desktopVisible():Boolean
        {
            return _desktopVisible;
        }

        public function set desktopVisible(value:Boolean):void
        {
			if (_desktopVisible != value)
            {
                COMPILE::JS
                {
					_desktopVisible = value;

					if(hostComponent)
					{
						if(_desktopVisible)
						{
							if (hostClassList.contains("hidden-desktop"))
								hostClassList.remove("hidden-desktop");
							hostClassList.add("visible-desktop");
						} else
						{
							if (hostClassList.contains("visible-desktop"))
								hostClassList.remove("visible-desktop");
							hostClassList.add("hidden-desktop");
						}
					}
				}
			}
		}

		private var _wideScreenVisible:Boolean;
		/**
		 *  Makes the cell to be visible or hidden in phone size
		 *  Uses "visible-widescreen" and "hidden-widescreen" effect selectors.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get wideScreenVisible():Boolean
        {
            return _wideScreenVisible;
        }

        public function set wideScreenVisible(value:Boolean):void
        {
			if (_wideScreenVisible != value)
            {
                COMPILE::JS
                {
					_wideScreenVisible = value;

					if(hostComponent)
					{
						if(_wideScreenVisible)
						{
							if (hostClassList.contains("hidden-widescreen"))
								hostClassList.remove("hidden-widescreen");
							hostClassList.add("visible-widescreen");
						} else
						{
							if (hostClassList.contains("visible-widescreen"))
								hostClassList.remove("visible-widescreen");
							hostClassList.add("hidden-widescreen");
						}
					}
				}
			}
		}

        /**
         * @copy org.apache.royale.core.IBeadLayout#layout
		 * @royaleignorecoercion org.apache.royale.core.UIBase
         */
		override public function layout():Boolean
		{
            COMPILE::SWF
            {
				var contentView:ILayoutView = layoutView;

				var hostWidthSizedToContent:Boolean = host.isWidthSizedToContent();
				var hostHeightSizedToContent:Boolean = host.isHeightSizedToContent();

				var w:Number = hostWidthSizedToContent ? 0 : contentView.width;
				var h:Number = hostHeightSizedToContent ? 0 : contentView.height;

				var n:int = contentView.numElements;

                for (var i:int = 0; i < n; i++)
                {
                    var child:IUIBase = contentView.getElementAt(i) as IUIBase;
					if (child == null || !child.visible) continue;

					var positions:Object = childPositions(child);
					var margins:Object = childMargins(child, contentView.width, contentView.height);
                    var ww:Number = w;
                    var hh:Number = h;

                    var ilc:ILayoutChild = child as ILayoutChild;

					// set the top edge of the child
                    if (!isNaN(positions.left))
                    {
                        if (ilc)
                            ilc.setX(positions.left+margins.left);
                        else
                            child.x = positions.left+margins.left;
                        ww -= positions.left + margins.left;
                    }

					// set the left edge of the child
                    if (!isNaN(positions.top))
                    {
                        if (ilc)
                            ilc.setY(positions.top+margins.top);
                        else
                            child.y = positions.top+margins.top;
                        hh -= positions.top + margins.top;
                    }

					// set the right edge of the child
					if (!isNaN(positions.right))
					{
						if (!hostWidthSizedToContent)
						{
							if (!isNaN(positions.left))
							{
								if (ilc)
									ilc.setWidth(ww - positions.right - margins.right, false);
								else
									child.width = ww - positions.right - margins.right;
							}
							else
							{
								if (ilc)
								{
									ilc.setX( w - positions.right - margins.left - child.width - margins.right);
								}
								else
								{
									child.x = w - positions.right - margins.left - child.width - margins.right;
								}
							}
						}
					}
					else if (ilc != null && !isNaN(ilc.percentWidth) && !hostWidthSizedToContent)
					{
						ilc.setWidth((ww - margins.right - margins.left) * ilc.percentWidth/100, false);
					}

					// set the bottm edge of the child
					if (!isNaN(positions.bottom))
					{
						if (!hostHeightSizedToContent)
						{
							if (!isNaN(positions.top))
							{
								if (ilc)
									ilc.setHeight(hh - positions.bottom - margins.bottom, false);
								else
									child.height = hh - positions.bottom - margins.bottom;
							}
							else
							{
								if (ilc)
									ilc.setY( h - positions.bottom - child.height - margins.bottom);
								else
									child.y = h - positions.bottom - child.height - margins.bottom;
							}
						}
					}
					else if (ilc != null && !isNaN(ilc.percentHeight) && !hostHeightSizedToContent)
					{
						ilc.setHeight((hh - margins.top - margins.bottom) * ilc.percentHeight/100, false);
					}
					
					if (margins.auto)
					{
						if (ilc)
							ilc.setX( (w - child.width) / 2);
						else
							child.x = (w - child.width) / 2;
					}
                }

                return true;

            }

            COMPILE::JS
            {
				/** 
				 *  This Layout uses the following CSS rules
				 *  no code needed in JS for layout
				 * 
				 *  .layout {
				 *		display: flex;
				 *	}
				 *
				 *	.layout.absolute {
				 *		position: relative;
				 *	}
				 *  
				 *	.layout.absolute > * {
		         *      position: absolute  
				 *  }
				 */

                return true;
            }
		}
	}
}
