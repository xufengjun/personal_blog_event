/*
 * Copyright 2009 Greg Monroe
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at 
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 * See the License for the specific language governing permissions and 
 * limitations under the License. 
 */

/**
 * @fileOverview Contains the word Filter plug-in code.
 * @version 0.9
 * @author Greg Monroe <monroe@dukece.com> 
 */

/**
 * See (http://jquery.com/).
 * @name jQuery
 * @class 
 * See the jQuery Library  (http://jquery.com/) for full details.  This just
 * documents the function and classes that are added to jQuery by this plug-in.
 */

/**
 * See (http://jquery.com/)
 * @name jQuery.fn
 * @class 
 * See the jQuery Library  (http://jquery.com/) for full details.  This just
 * documents the function and classes that are added to jQuery by this plug-in.
 * @memberOf jQuery
 */

/**
 * <p>Remove all elements from the set of matched elements using a a set of 
 * words and options settings. The default is to show return only elements that
 * contain all the specified words.  However, the options can be used to
 * change this to be be any word or the inverse match.</p>
 *
 * The example below will only show paragraphs that contain both the words
 * foo and bar.
 *
 * @example $('p').hide().wordFilter(['foo','bar']).show(); 
 *
 * @param words An array of words to filter the selected items by.
 * @param options An optional options object.
 * @param options.useOr If true, show selections that contain ANY single word in
 *                      the list. If false, (default) only show selections that
 *                      contain ALL the works in the list. 
 * @param options.invert If true, invert the selection display. I.e., don't 
 *                       show selection if it contains words.
 * @param options.matchType Can be three values, "whole", "prefix", or 
 *                      "contains".  "whole" (default) means the whole word must                      
 *                      be matched.  "prefix" means that any word that starts
 *                      with the word is matched.  "contains" means that
 *                      any word that contains the word is matched.  Note
 *                      that contained may match HTML tags as well.
 * @param options.ignoreCase If false, the case of the word must match. If true,
 *                      (default) the case is ignored.
 * @param options.skipHidden If true, any element that is already hidden is 
 *                      skipped.  Makes for faster drill down searches in 
 *                      autoSearch.  Default is false.                       
 *
 */
jQuery.fn.wordFilter = function ( words, options ) {
    
    var i, regEx, regExps, eStart, eEnd, exp, found, flags;
    
    options = jQuery.extend({
        useOr: false,
        invert: false,
        matchType: 'prefix',
        ignoreCase: true,
        skipHidden: false
    }, options);
    if ( ! words ) {
        return this;
    }
    if ( options.matchType == 'prefix' ) {
        eStart = '.*\\W';
        eEnd = '.*';
    } else if ( options.matchType == 'contains' ) {
        eStart = '.*';
        eEnd = '.*';
    } else {
        eStart = '.*\\W';
        eEnd = '\\W.*';
    }
    regExps = [];
    for( i=0; i < words.length; i++ ) {
        exp = eStart + words[i] + eEnd;
        regEx = new RegExp();
        flag = 'm';
        if  ( options.ignoreCase ) {
            flags = 'im';
        }
        regEx.compile(exp,flags);
        regExps.push(regEx);
    }
    return this.filter( function ( index ) {
        if ( options.skipHidden && $(this).is(':hidden') ) {
            return;
        }
        var txt = ' ' + $(this).text() + ' ';
        found = false;
        for( var i=0; i < regExps.length; i++ ) {
            if ( regExps[i].test(txt) ) {
                found = true;
                if ( options.useOr ) {  // Or requires only 1 word found
                    break;
                }
            } else {
                found = false;
                if ( ! options.useOr ) { // And finished if any word not found.
                    break;
                }
            }
        }
        return options.invert ? ! found : found;
    });
};
/**
 * <p>Hide or show information on a page based on words typed into a textbox.  
 * Works like an automatch suggestion field to only display the 'selector' 
 * elements that match what is typed.  This occurs "close" to real time. 
 * For performance reasons, the wordFilter is only applied after the user
 * has stopped typing (or presses enter or a space).</p>
 *
 * @example $('#searchTextBox').autoSearch('.searchItems');
 *
 * @param selector The jQuery selector that determines the elements to search
 * @param options The wordFilter options to use.
 * @param options.searchCallback A function that will be called with each
 *      keystroke in the search textbox.  Will be passed a modified options
 *      object with lastSearch and hiddenCount properties.
 * @param options.wait The time in milliseconds to wait before assuming typing 
 *       has stopped.  Default: 750ms
 * @see jQuery.fn.wordFilter for other options.
 * 
 */
jQuery.fn.autoSearch = function ( selector, options ) {
    var opts = {
            useOr: false,
            invert: false,
            matchType: 'prefix',
            ignoreCase: true,
            skipHidden: false,
            wait: 750
        };
    // Copy options so they can be modified 
    if ( options ) {
        opts = jQuery.extend(true, opts, options);
    } 
    // Toggle invert setting so that element to hide are returned
    // instead of elements with matches.
    if (opts.invert ) {
        opts.invert = ! opts.invert;
    } else {
        opts.invert = true;
    }
    opts.skipHidden = true;
    opts.lastSearch = String("");
    
    var doSearch = function( opts ) {
    	var words, hidden, currentShown;
	    var searchItems = jQuery(selector);
	    opts.total = searchItems.size();
		var s = opts.search;

		if ( ! s ) { 
			searchItems.show();
			words = [];
			currentShown = opts.total;
			hidden = 0;
		} else {
			if ( opts.useOr ||
				 opts.matchType == 'whole' ||
				 opts.useOr ||
				 opts.lastSearch.length > s.length ||
				 s.indexOf(opts.lastSearch) !== 0 ) {
				searchItems.show();
			}
			currentShown = searchItems.filter(selector+':visible').size();
			words = s.split(/\s+/);
			hidden = searchItems.wordFilter( words, opts ).hide().size();
		}
		opts.shown = currentShown - hidden;
		opts.lastSearch = s;
		opts.words = words;
		if ( jQuery.isFunction(opts.searchCallback )) {
			opts.searchCallback( opts );
		}
    };
    var keyPressTimer = null;
    
    // Named function so it can be unbound.
    var keyUpEventHandler = function ( e ) {
    	var opts = e.data;
    	opts.search = jQuery.trim( jQuery(this).val() );
    	if ( e.keyCode == 13 || e.keyCode == 32 ) {
    		doSearch( opts );
    		return;
    	}
    	var timerSearchCall = function() {
    		doSearch( opts );
    	};
    	clearTimeout( keyPressTimer );
    	keyPressTimer = setTimeout( timerSearchCall, opts.wait );
    };
    
    // Bind the keystroke event and trigger it so any pre-populated data
    // takes effect.
    return this.bind('keyup', opts, keyUpEventHandler).trigger('keyup', opts);
};
 