﻿/**
 * 	Buttons are the foundation component of the CLIK framework and are used anywhere a clickable interface control is required. The default Button class (gfx.controls.Button) supports a textField to display a label, and states to visually indicate user interaction. Buttons can be used on their own, or as part of a composite component, such as ScrollBar arrows or the Slider thumb. Most interactive components that are click-activated compose or extend Button.
   
   	The CLIK Button is a general purpose button component, which supports mouse interaction, keyboard interaction, states and other functionality that allow it to be used in a multitude of user interfaces. It also supports toggle capability as well as animated states. The ToggleButton, AnimatedButton and AnimatedToggleButton provided in the Button.fla component source file all use the same base component class.
	
	<b>Inspectable Properties</b>
	The inspectable properties of the Button component are:<ul>
	<li><i>label</i>: Sets the label of the Button.</li>
	<li><i>toggle</i>: Sets the toggle property of the Button. If set to true, the Button will act as a toggle button.</li>
	<li><i>visible</i>: Hides the button if set to false.</li>
	<li><i>disabled</i>: Disables the button if set to true.</li>
	<li><i>disableFocus</i>: By default buttons receive focus for user interactions. Setting this property to true will disable focus acquisition.</li>
	    <li><i>disableConstraints</i>: The Button component contains a constraints object that determines the placement and scaling of the textField inside of the button when the component is resized. Setting this property to true will disable the constraints object. This is particularly useful if there is a need to resize or reposition the button's textField via a timeline animation AND the button component is never resized. If not disabled, the textField will be moved and scaled to its default values throughout its lifetime, thus nullifying any textField translation/scaling tweens that may have been created in the button's timeline.</li>
	<li><i>autoSize</i>: Determines if the button will scale to fit the text that it contains and which direction to align the resized button. Setting the autoSize property to {@code autoSize="none"} will leave its current size unchanged.</li>
	<li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overriden from the game engine using GFx FunctionObjects.</li>
	<li><i>soundMap</i>: Mapping between events and sound process. When an event is fired, the associated sound process will be fired via _global.gfxProcessSound, which should be overriden from the game engine using GFx FunctionObjects.</li></ul>
	
	<b>States</b>
	The CLIK Button component supports different states based on user interaction. These states include <ul>
	<li>an up or default state.</li>
	<li>an over state when the mouse cursor is over the component, or when it is focused.</li>
	<li>a down state when the button is pressed.</li>
	<li>a disabled state.</li></ul>

	These  states are represented as keyframes in the Flash timeline, and are the minimal set of keyframes required for the Button component to operate correctly. There are other states that extend the capabilities of the component to support complex user interactions and animated transitions, and this information is provided in the Getting Started with CLIK Buttons document.	
	
	<b>Events</b>
	All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
	<li><i>type</i>: The event type.</li>
	<li><i>target</i>: The target that generated the event.</li></ul>
		
	The events generated by the Button component are listed below. The properties listed next to the event are provided in addition to the common properties.<ul>
	<li><i>show</i>: The visible property has been set to true at runtime.</li>
	<li><i>hide</i>: The visible property has been set to false at runtime.</li>
	<li><i>focusIn</i>: The button has received focus.</li>
	<li><i>focusOut</i>: The button has lost focus.</li>
	<li><i>select</i>: The selected property has changed.<ul>
		<li><i>selected</i>: The selected state of the Button, true for selected. Boolean type.</li></ul></li>
	<li><i>stateChange</i>: The button's state has changed.<ul>
		<li><i>state</i>: The Button's new state. String type, Values "up", "over", "down", etc.</li></ul></li>
	<li><i>rollOver</i>: The mouse cursor has rolled over the button.<ul>
		<li><i>controllerIdx</i>: The index of the controller used to generate the event (Applicable only for multi-controller environments). Number type. Values 0 to 3 (max 15).</li></ul></li>
	<li><i>rollOut</i>: The mouse cursor has rolled out of the button.<ul>
		<li><i>controllerIdx</i>: The index of the controller used to generate the event (Applicable only for multi-controller environments). Number type. Values 0 to 3 (max 15).</</li></ul></li>
	<li><i>press</i>: The button has been pressed.<ul>
		<li><i>controllerIdx</i>: The index of the controller used to generate the event (applicable only for multi-controller environments). Number type. Values 0 to 3 (max 15).</</li></ul></li>
	<li><i>doubleClick</i>: The button has been double clicked. Only fired when the {@link doubleClickEnabled} property is set.<ul>
		<li><i>controllerIdx</i>: The index of the controller used to generate the event (applicable only for multi-controller environments). Number type. Values 0 to 3 (max 15).</</li></ul></li>
	<li><i>click</i>: The button has been clicked.<ul>
		<li><i>controllerIdx</i>: The index of the controller used to generate the event (applicable only for multi-controller environments). Number type. Values 0 to 3 (max 15).</</li></ul></li>
	<li><i>dragOver</i>: The mouse cursor has been dragged over the button (while the left mouse button is pressed).<ul>
		<li><i>controllerIdx</i>: The index of the controller used to generate the event (applicable only for multi-controller environments). Number type. Values 0 to 3 (max 15).</</li></ul></li>
	<li><i>dragOut</i>: The mouse cursor has been dragged out of the button (while the left mouse button is pressed).<ul>
		<li><i>controllerIdx</i>: The index of the controller used to generate the event (applicable only for multi-controller environments).Number type. Values 0 to 3 (max 15).</</li></ul></li>
	<li><i>releaseOutside</i>: The mouse cursor has been dragged out of the button and the left mouse button has been released.<ul>
		<li><i>controllerIdx</i>: The index of the controller used to generate the event (applicable only for multi-controller environments).Number type. Values 0 to 3 (max 15).</</li></ul></li></ul>
*/

/**********************************************************************
 Copyright (c) 2009 Scaleform Corporation. All Rights Reserved.
 Licensees may use this file in accordance with the valid Scaleform
 License Agreement provided with the software. This file is provided 
 AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE WARRANTY OF DESIGN, 
 MERCHANTABILITY AND FITNESS FOR ANY PURPOSE.
**********************************************************************/

import flash.external.ExternalInterface; 
import gfx.core.UIComponent;
import gfx.controls.ButtonGroup;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import gfx.utils.Constraints;
import gfx.utils.Delegate;
import gfx.utils.Locale;

[InspectableList("disabled", "disableFocus", "visible", "toggle", "labelID", "disableConstraints", "enableInitCallback", "autoSize", "soundMap")]
class gfx.controls.Button extends UIComponent {
	
// Constants:
// Public Properties:
	/** Data related to the button. This property is particularly helpful when using butons in a ButtonGroup. */
	[Inspectable(type="String")]
	public var data:Object;
	/** The mouse state of the button.  Mouse states can be "over", "down", "up", and "release". */
	public var state:String = "up";
	/** A button with a toggle value of {@code true} will change its selected state when the button is "clicked". */
	[Inspectable(defaultValue="false")]
	public var toggle:Boolean = false;
	/** Determines if the component dispatches double-click events. */
	public var doubleClickEnabled:Boolean = false;
	/** Determines if the button dispatches "click" events when pressed down and held. */
	public var autoRepeat:Boolean = false;
	/** Locks drag over and drag out state changes. Useful for scrollbar and slider thumbs. */
	public var lockDragStateChange:Boolean = false;
	/** Mapping between events and sound process */
	[Inspectable(type="Object", defaultValue="theme:default,focusIn:focusIn,focusOut:focusOut,select:select,rollOver:rollOver,rollOut:rollOut,press:press,doubleClick:doubleClick,click:click")]
	public var soundMap:Object = { theme:"default", focusIn:"focusIn", focusOut:"focusOut", select:"select", rollOver:"rollOver", rollOut:"rollOut", press:"press", doubleClick:"doubleClick", click:"click" };

// Private Properties:	
	private var _group:Object; // ButtonGroup, but can be set as a String as well.
	private var _label:String;
	private var _selected:Boolean = false;
	private var _autoSize:String = "none";
	private var _disableFocus:Boolean = false;
	private var _disableConstraints:Boolean = false;
	private var constraints:Constraints;
	[Inspectable(name="group", defaultValue="buttonGroup")]
	private var inspectableGroupName:String;
	private var doubleClickDuration:Number = 250; //LM: This could be public or public-static?
	private var doubleClickInterval:Number;
	private var buttonRepeatDuration:Number = 100;
	private var buttonRepeatDelay:Number = 100;
	private var buttonRepeatInterval:Number;
	private var pressedByKeyboard:Boolean = false;
	/** A list of frames that apply to a given state. The frames will be called in order, and the last existing frame will be displayed. */
	private var stateMap:Object = {
		up:["up"],
		over:["over"],
		down:["down"],
		release: ["release", "over"],
		out:["out","up"],
		disabled:["disabled"],
		selecting: ["selecting", "over"],
		kb_selecting: ["kb_selecting", "up"],
		kb_release: ["kb_release", "out", "up"],
		kb_down: ["kb_down", "down"]
	}
	
// UI Elements:
	/** A reference to the textField in the component.  The textField is an optional element. Note that when state changes are made, the textField instance may change, so changes made to it externally may be lost. */
	public var textField:TextField; // Optional text field
	/** A reference to a MovieClip that is used to denote focus. It can either have one frame (which will cause the Button to show/hide this focus movie by toggling its visibility), or have two named frames: show and hide, which will be played appropriately.*/
	public var focusIndicator:MovieClip;
	

// Initialization:
	/**
	 * The constructor is called when a Button or a sub-class of Button is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend Button, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function Button() { 
		super();
		focusEnabled = tabEnabled = _disableFocus ? false : !_disabled;
		if (inspectableGroupName != null && inspectableGroupName != "") { 
			group = inspectableGroupName; // This needs to be set AFTER the EventDispatcher is mixed in, so that the group can addEventListener, and it won't fail.
		}
	}

// Public Methods:
	/**
	 * Set the {@code label} parameter of the component using the Locale class to look up a localized version of the text from the Game Engine. This property can be set with ActionScript, and is used when the label is set using the Component Inspector.
	 */
	[Inspectable(name="label", defaultValue="")]
	public function get labelID():String { return null; }
	public function set labelID(value:String):Void {
		if (value != "") {
			label = Locale.getTranslatedString(value);
		}
	}
	
	/**
	 * The ActionScript-only label parameter that sets the text directly, and assumes localization has been handled externally.
	 */
	public function get label():String { return _label; }
	public function set label(value:String):Void {
		_label = value;
				
		// When the label changes, if autoSize is true, and there is a textField, we want to resize the component to fit the label.  
		// The only exception is when the label is set during initialization.
        if (initialized) {
            if (textField != null) { textField.text = _label; } // Set the text first
            if (autoSize != "none") { sizeIsInvalid = true; }
            updateAfterStateChange();            
        }        
	}
	
	/**
	 * Disable this component. Focus (along with keyboard events) and mouse events will be suppressed if disabled.
	 */	
	[Inspectable(defaultValue="false", verbose="1")]
	public function get disabled():Boolean { return _disabled; }
	public function set disabled(value:Boolean):Void {
		if (_disabled == value) { return; }
		super.disabled = value;
		clearRepeatInterval();
		focusEnabled = tabEnabled = _disableFocus ? false : !_disabled;
		//#state This will JUST do a hard frame change
		setState(_disabled ? "disabled" : "up");
	}
		
	/**
	 * Set the selected state of the Button. Buttons can have two sets of mouse states, a selected and unselected.  When a Button's {@code toggle} property is {@code true} the selected state will be changed when the button is clicked, however the selected state can be set using ActionScript even if the toggle property is false.
	 */
	[Inspectable(defaultValue="false")]
	public function get selected():Boolean { return _selected; }
	public function set selected(value:Boolean):Void {        
		if (_selected == value) { return; }		
		_selected = value;
		
		//#state This will do a change in state.
		//	1. If the component is not focused, and the selected property is changed via code, it will do a hard frame change unless it is part of a button group.
		//  2. If the component was pressed with the mouse, and is changing its selected state (toggle), it plays the "switch" animation.
		//  2b. If the component was pressed with the keyboard, but has no focusMovie, the "switch" animation plays.
		//  3. If the component was pressed with the keyboard (and is focused), it plays the kb_switch animation.
		//  4. EDGE CASE The component will not be able to be do a up->focused_selected_up when a focused clip changes its selected state via code.
		if (!_disabled) { 
			if (!_focused) { // Hard frame change to up.
				setState((displayFocus && focusIndicator == null) ? "over" : "up");
			} else if (pressedByKeyboard && focusIndicator != null) { // Pressed with keyboard + focusIndicator (down->selected_up, selected_down->up)
				setState("kb_selecting");
			} else {
				setState("selecting") // Pressed with mouse or keyboard and no focusIndicator (down->selected_over, selected_down->over)
			}
		}
        else {
            setState("disabled");
        }

		// The event is dispatched after the frame change so that listening objects can override the behavior.
		if (dispatchEvent != null) { // Prevent the selected event from firing before the EventDispatcher is ready.
			dispatchEventAndSound({type:"select", selected:_selected});
		}
		
	}
		
	/**
	 * The name of the {@link #group} that the button belongs to. If the group does not exist, it is created in the parent of the button so that other buttons with the same group name can belong to the same group.
	 * @see #group
	 * @see ButtonGroup
	 */
	public function get groupName():String { return (_group == null) ? null : _group.name; }
	public function set groupName(value:String):Void {
		group = value;
	}
	
	/**
	 * A reference to the {@link ButtonGroup} instance that the button belongs to. The group is usually created in the parent clip of the button, so buttons in the same MovieClip scope with the same name can behave as a group. ButtonGroups will only be created in the parent scope when automatically created.
	 * @see ButtonGroup
	 */
	public function get group():Object { return _group; }
	public function set group(value:Object):Void {
		var newGroup:ButtonGroup = ButtonGroup(value); // Note, this is a cast, a new group is not created.
		if (typeof(value) == "string") {
			newGroup = _parent["_buttonGroup_"+value];
			if (newGroup == null) {
				_parent["_buttonGroup_"+value] = newGroup = new ButtonGroup(value.toString(), _parent);
			}
		}		
		
		if (_group == newGroup) { return; }
		if (_group != null) {
			_group.removeButton(this);
			// We do not actually clean-up/remove the group, in case it is created manually. This will result in some errant groups, but its minimal.
		}
		_group = newGroup;
		if (_group != null) {
			newGroup.addButton(this);
		}
	}
	
	/**
	 * Disable focus management for the component. Setting the disableFocus property to {@code disableFocus=true} will remove support for tab key, direction key and mouse button based focus changes.
	 */
	[Inspectable(defaultValue="false", verbose="1")]
	public function get disableFocus():Boolean { return _disableFocus; }
	public function set disableFocus(value:Boolean):Void {
		_disableFocus = value;
		focusEnabled = tabEnabled = _disableFocus ? false : !_disabled;
	}	
	
	/**
	 * Disable constraints for the component. Setting the disableConstraintsproperty to {@code disableConstraints=true} will remove constraints from the textfield. This is useful for components with timeline based textfield size tweens, since constraints break them due to a Flash quirk.
	 */
	[Inspectable(defaultValue="false", verbose="1")]
	public function get disableConstraints():Boolean { return _disableConstraints; }
	public function set disableConstraints(value:Boolean):Void {
		_disableConstraints = value;
	}		
	
	/**
	 * Determines if the button will scale to fit the text that it contains. Setting the autoSize property to {@code autoSize="none"} will leave its current size unchanged.
	 */
	[Inspectable(type="String", enumeration="none,left,center,right", defaultValue="none")]
	public function get autoSize():String { return _autoSize; }
	public function set autoSize(value:String):Void {
		if (_autoSize == value) { return; }
		_autoSize = value;
		if (initialized) {                    
            sizeIsInvalid = true;
            validateNow();                      
        }
	}

	public function setSize(width:Number, height:Number):Void {
		//var w:Number = (_autoSize && textField != null) ? calculateWidth() : width;
		super.setSize(width, height);
	}
	
	public function handleInput(details:InputDetails, pathToFocus:Array):Boolean {
		switch(details.navEquivalent) {
			case NavigationCode.ENTER:
				var controllerIdx:Number = details.controllerIdx;
				if (details.value == "keyDown" || details.value == "keyHold") { // A more generic solution may be required for Button
					if (!pressedByKeyboard) { handlePress(controllerIdx); }
				} else {
					handleRelease(controllerIdx);
				}
				return true; // Even though the press may not have handled it (automatic=repeat presses), we want to indicate that we did, since the Button handles repeat, but it won't respond to multiple.
		}
		return false;
	}	
	
	/** @exclude */
	public function toString():String {
		return "[Scaleform Button " + _name + "]";
	}
	
	
// Private Methods:
	private function configUI():Void {		
		constraints = new Constraints(this, true);
		if (!_disableConstraints) {
			constraints.addElement(textField, Constraints.ALL);
		}
		super.configUI();
		
		// Force dimension check if autoSize is set to true
		if (_autoSize != "none") {
			sizeIsInvalid = true;
		}
		
		onRollOver = handleMouseRollOver;
		onRollOut = handleMouseRollOut;
		onPress = handleMousePress;
		onRelease = handleMouseRelease;		
		onDragOver = handleDragOver;
		onDragOut = handleDragOut;
		onReleaseOutside = handleReleaseOutside;
		
		if (focusIndicator != null && !_focused && focusIndicator._totalFrames == 1) { focusIndicator._visible = false; }
		
		updateAfterStateChange();
	}
		
	private function draw():Void {
		// Note that if this is called after a frame change, and there is a new keyframe, the size may be read incorrectly in GFx.
		if (sizeIsInvalid) { // The size has changed.	
			alignForAutoSize();
			_width = __width;
			_height = __height;
		}
        
        if (initialized) {        
		    constraints.update(__width, __height);
        } 
	}
	
	// This method is fired after the state has changed to allow the component to ensure the state is up-to-date.  For instance, updating the contraints in Button.
	private function updateAfterStateChange():Void {
		// Redraw should only happen AFTER the initialization.
		if (!initialized) { return; }
		validateNow();// Ensure that the width/height is up to date.
		
		if (textField != null && _label != null) { textField.text = _label; }		
		if (constraints != null) { 
			constraints.update(width, height);
		}
		dispatchEvent({type:"stateChange", state:state});
	}
	
	// Get the auto width of the component, determined by the text width and constraints metrics
	private function calculateWidth():Number {
		if (constraints == null) {
			invalidate();
			return 0;
		}
		var metrics:Object = constraints.getElement(textField).metrics;
		var w:Number = textField.textWidth + metrics.left + metrics.right + 5; // We add 5 pixels to accommodate Flash's poor measurement of anti-aliased fonts.
		return w;
	}
	
	/**
	 * Realigns the component based on the autoSize property.
	 */
	private function alignForAutoSize():Void {
        if (!initialized || _autoSize == "none" || textField == null) 
            return;
        
        var oldWidth = __width;
        width = calculateWidth();                         

        switch (_autoSize) {
            case "right":
                var oldRight = _x + oldWidth;
                _x = oldRight - __width;
                break;
            case "center":
                var oldCenter = _x + oldWidth/2;
                _x = oldCenter - __width / 2;
                break;
        }
    }
	
	/**
	 * Set the current visible state.  The state is determined by getting a list of possible frame names based on the state, and applying a possible prefixes depending on the button state (eg, selected).  Flash and GFx will go to the last existing frame called, so we can use "fall-back" frames.
	 * @param state The name of the new state
	 * @see #getStatePrefixes
	 * @see #stateMap
	 */
	private function setState(state:String):Void {
		this.state = state;
		var prefixes:Array = getStatePrefixes();
		var states:Array = stateMap[state];
		if (states == null || states.length == 0) { return; }
		do {
			var prefix:String = prefixes.pop().toString();
			for (var i:Number = states.length - 1; i >= 0; i--) {
				gotoAndPlay(prefix+states[i]);
			}
		} while (prefixes.length > 0);
		updateAfterStateChange();
	}
	
	/**
	 * Get a list of frame label prefixes for state management.  Prefixes are applied in the setState method.
	 * @see #setState
	 */
	private function getStatePrefixes():Array {
		return (_selected) ? ["selected_",""] : [""];
	}
	
	// #state
	//  * focus changes on press (handled by onPress) 
	//  * focus changes using keyboard or ActionScript (up->over / over->up), unless there is a focusMovie (no state change)
	//  * EDGE CASE: A focused button is set to selected=true via code. Will play the "over" keyframe again (over->selected_over)
	private function changeFocus():Void {
		if (_disabled) { return; }
		//var newState:String = ((_focused || _displayFocus) && focusIndicator == null) ? "over" : "out";
		if (focusIndicator == null) {
			setState((_focused || _displayFocus) ? "over" : "out");
		}
		if (focusIndicator != null) {
			if (focusIndicator._totalframes == 1) { focusIndicator._visible = _focused != 0; } // Do a simple show/hide on single-frame focus indicators.
			else { 
				focusIndicator.gotoAndPlay(_focused ? "show" : "hide"); 
				focusIndicator.gotoAndPlay( "state" + _focused ); 
			}
			// If focus is moved on keyboard press, the button needs to reset since it will not recieve a key up event.
			if (pressedByKeyboard && !_focused) {
				setState("kb_release"); 
				pressedByKeyboard = false;
			}
		}
	}
	
	// #state RollOver is only called by mouse interaction. Focus change happens in changeFocus.
	private function handleMouseRollOver(controllerIdx:Number):Void {
		if (_disabled) { return; }
		if ((!_focused && !_displayFocus) || focusIndicator != null) { setState("over"); } // Otherwise it is focused, and has no focusIndicator, so do nothing.
		dispatchEventAndSound({type:"rollOver", controllerIdx:controllerIdx});
	}
	
	// #state RollOut is only called by mouse interaction. Focus change happens in changeFocus.
	private function handleMouseRollOut(controllerIdx:Number):Void {
		if (_disabled) { return; }
		if ((!_focused && !_displayFocus) || focusIndicator != null) { setState("out"); } // Otherwise it is focused, and has no focusIndicator, so do nothing.
		dispatchEventAndSound({type:"rollOut", controllerIdx:controllerIdx});
	}
	
	// #state Press happens on mouse press, and keyboard press:
	//	* Keyboard press does a up->down, or over->down (no focusMovie). This method will not handle keyboard press
	//  * Mouse press does a over->down only.
	private function handleMousePress(controllerIdx:Number, button:Number):Void {
		if (_disabled) { return; }
		if (!_disableFocus) { Selection.setFocus(this, controllerIdx); }
		setState("down"); // Focus changes in the setState will override those in the changeFocus (above)
		dispatchEventAndSound({type:"press", controllerIdx:controllerIdx, button:button});		
		if (autoRepeat) {
			buttonRepeatInterval = setInterval(this, "beginButtonRepeat", buttonRepeatDelay, controllerIdx, button);
		}
	}
	// #state invoked by keyboard
	private function handlePress(controllerIdx:Number):Void {
		if (_disabled) { return; }
		pressedByKeyboard = true;
		setState(focusIndicator == null ? "down" : "kb_down");		
		dispatchEventAndSound({type:"press", controllerIdx:controllerIdx});
	}
	
	// #state Release happens on mouse release (click) and keyboard release:
	//  * Keyboard release does a down->up or a down->over (no focusMovie)
	//  * Mouse release does a down->over only.
	private function handleMouseRelease(controllerIdx:Number, button:Number):Void {
		if (_disabled) { return; }
		clearInterval(buttonRepeatInterval);
		delete buttonRepeatInterval;
		
		if (doubleClickEnabled) {
			if (doubleClickInterval == null) {
				doubleClickInterval = setInterval(this, "doubleClickExpired", doubleClickDuration);
			} else {
				doubleClickExpired();
				dispatchEventAndSound({type:"doubleClick", controllerIdx:controllerIdx, button:button});
				setState("release");
				return;
			}
		}
		
		setState("release");
		handleClick(controllerIdx, button); // State changes in the handleClick will override those in the setState or focus change (above)
	}
	// #state invoked by keyboard
	private function handleRelease(controllerIdx:Number):Void {
		if (_disabled) { return; }
		setState(focusIndicator == null ? "release" : "kb_release");
		handleClick(controllerIdx); // State changes in handleClick will override those in the setState (above)
		pressedByKeyboard = false;
	}
	
	/**
	 * The button has been "clicked", either by a mouse click, or a key press.
	 */
	private function handleClick(controllerIdx:Number, button:Number):Void {
		if (toggle) { selected = !_selected; } // Will cause a state change.
		dispatchEventAndSound({type:"click", controllerIdx:controllerIdx, button:button});		
	}

	// The cursor was dragged over into the button. This occurs only when the cursor was dragged out from the same button earlier.
	private function handleDragOver(controllerIdx:Number):Void {
		if (_disabled || lockDragStateChange) { return; }
		
		// #state This needs to handle 3 scenarios:
		//  * button is dragged over and has trackAsMenu (up->over)
		//  * button is pressed, and dragged out, then back over (up->down)
		//  * button is pressed, and dragged out, then back over, and has no focusIndicator (over->down)
		//  * EDGE CASE: button is dragged over, has trackAsMenu, is focused, and has no focusMovie (over->over)
		if (_focused || _displayFocus) {
			setState(focusIndicator == null ? "down" : "kb_down"); // The user has dragged out first, so do a up->down transition.
		} else {
			setState("over");
		}
		
		dispatchEvent({type:"dragOver", controllerIdx:controllerIdx});
	}
	private function handleDragOut(controllerIdx:Number):Void {
		if (_disabled || lockDragStateChange) { return; }		
		
		// #state This needs to handle 3 scenarios:
		//  * button is dragged over and dragged out and has trackAsMenu (over->up)
		//  * button is pressed, and dragged out (down->up)
		//  * button is pressed, and dragged out, but has no focusIndicator (down->over)
		//  * EDGE CASE: button is dragged out, has trackAsMenu, is focused, and has no focusMovie (over->over)
		// We assume that when the button is focused, it must have been pressed first.
		if (_focused || _displayFocus) {
			setState(focusIndicator == null ? "release" : "kb_release"); // The user has pressed and dragged out of the component. Do a down->up transition.
		} else {
			setState("out");
		}
		
		dispatchEvent({type:"dragOut", controllerIdx:controllerIdx});
	}	
	
	// The releaseOutside method clears any active repeat intervals.
	private function handleReleaseOutside(controllerIdx:Number, button:Number):Void {	
		clearRepeatInterval();
		if (_disabled) { return; }
		// If drag state change is locked, then releasing outside is 
		// equivalent to drag out.
		if (lockDragStateChange) { 
			if (_focused || _displayFocus) {
				setState(focusIndicator == null ? "release" : "kb_release"); // See handleDragOut().
			} else {
				setState("kb_release");	// * button is not focused and released outside (down->up).
			}
		}
		// #state Nothing should be required here, since it should already be in the right state.
		dispatchEvent({type:"releaseOutside", state:state, button:button});
	}
	
	// A double click did not happen. Clear the interval.
	private function doubleClickExpired():Void {
		clearInterval(doubleClickInterval);
		delete doubleClickInterval;
	}
	
	// The button has been pressed long enough to do a "repeat".
	private function beginButtonRepeat(controllerIdx:Number, button:Number):Void {
		clearRepeatInterval();
		buttonRepeatInterval = setInterval(this, "handleButtonRepeat", buttonRepeatDuration, controllerIdx, button);
	}
	
	// The button is being pressed, and doing a "repeat"
	private function handleButtonRepeat(controllerIdx:Number, button:Number):Void {
		dispatchEventAndSound({type:"click", controllerIdx:controllerIdx, button:button});
	}
	
	private function clearRepeatInterval():Void {
		clearInterval(buttonRepeatInterval);
		delete buttonRepeatInterval;
	}

}
