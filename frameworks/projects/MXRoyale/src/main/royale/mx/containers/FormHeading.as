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

package mx.containers
{

//import flash.events.Event;
import org.apache.royale.events.Event;
//import flash.text.TextFieldAutoSize;
import mx.controls.Label;
import mx.core.EdgeMetrics;
import mx.core.UIComponent;
/* 
include "../styles/metadata/LeadingStyle.as"
include "../styles/metadata/PaddingStyles.as"
include "../styles/metadata/TextStyles.as" */

/**
 *  Number of pixels between the label area and the heading text.
 *
 *  @default 14
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Royale 0.9.3
 */
//[Style(name="indicatorGap", type="Number", format="Length", inherit="yes")]

/**
 *  Width of the form labels.
 *  The default value is the length of the longest label in the form.
 *  For FormHeading, the <code>labelWidth</code>
 *  is space to the left of the heading text.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Royale 0.9.3
 */
//[Style(name="labelWidth", type="Number", format="Length", inherit="yes")]

/**
 *  Number of pixels above the heading text.
 *
 *  @default 0
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Royale 0.9.3
 */
//[Style(name="paddingTop", type="Number", format="Length", inherit="no")]

//[IconFile("FormHeading.png")]

[Alternative(replacement="spark.components.FormHeading", since="4.5")]

/**
 *  The FormHeading container is used to display a heading
 *  for a group of controls inside a Form container.
 *  The left side of the heading is aligned
 *  with the left side of the controls inside the form.
 *  You can include multiple FormHeading containers within a single Form
 *  container.
 *
 *  @mxml
 *
 *  <p>The <code>&lt;mx:FormHeading&gt;</code> tag inherits all of the tag
 *  attributes of its superclass and adds the following tag attributes:</p>
 *
 *  <pre>
 *  &lt;mx:FormHeading
 *    <strong>Properties</strong>
 *    label=""
 *  
 *    <strong>Styles</strong>
 *    color="0x0B333C"
 *    disabledColor="0xAAB3B3"
 *    fontAntiAliasType="advanced|normal"
 *    fontFamily="Verdana"
 *    fontGridFitType="pixel|subpixel|none"
 *    fontSharpness="0"
 *    fontSize="12"
 *    fontStyle="normal|italic"
 *    fontThickness="0"
 *    fontWeight="normal|bold"
 *    indicatorGap="14"
 *    labelWidth="<i>Calculated</i>"
 *    leading="2"
 *    paddingLeft="0"
 *    paddingRight="0"
 *    paddingTop="0"
 *    textAlign="<i>Calculated</i>"
 *    textDecoration="none|underline"
 *    textIndent="0"
 *  /&gt;
 *  </pre>
 *
 *  @see mx.containers.Form
 *  @see mx.containers.FormItem
 * 
 *  @includeExample examples/FormExample.mxml
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Royale 0.9.3
 */
public class FormHeading extends UIComponent
{
	/* include "../core/Version.as";
 */
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------

	/**
	 *  Constructor.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Royale 0.9.3
	 */
	public function FormHeading()
	{
		super();
	}

	//--------------------------------------------------------------------------
	//
	//  Variables
	//
	//--------------------------------------------------------------------------

	/**
	 *  @private
	 */
	private var labelObj:Label;

	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------

	//----------------------------------
	//  label
	//----------------------------------

	/**
	 *  @private
	 *  Storage for the label property.
	 */
	private var _label:String = "";

	[Bindable("labelChanged")]
	[Inspectable(category="General", defaultValue="")]

	/**
	 *  Form heading text.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Royale 0.9.3
	 */
	public function get label():String
	{
		return _label;
	}

	/**
	 *  @private
	 */
	public function set label(value:String):void
	{
		_label = value;

		invalidateProperties();

		dispatchEvent(new Event("labelChanged"));
	}



	
}

}
