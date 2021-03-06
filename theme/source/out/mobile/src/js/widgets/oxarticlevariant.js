/**
 * This file is part of OXID eSales mobile theme.
 *
 * OXID eSales mobile theme is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales mobile theme is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with OXID eSales mobile theme.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2013
 */

( function ( $ ) {

    oxArticleVariant = {

        _create: function() {

            var self = this;
            //var options = self.options;

            /**
             * Variant selection dropdown
             */
            $("ul.vardrop a").click(function() {

                var obj = $( this );

                // resetting
                if ( obj.parents().hasClass("js-disabled") ) {
                    self.resetVariantSelections();
                } else {
                    $( "form.js-oxProductForm input[name=anid]" ).attr( "value", $( "form.js-oxProductForm input[name=parentid]" ).attr( "value" ) );
                }

                // setting new selection
                if ( obj.parents().hasClass("js-fnSubmit") ){
                    obj.parent('li').parent('ul').siblings('input:hidden').attr( "value", obj.attr("data-selection-id") );

                    var form = obj.closest("form");
                    $('input[name=fnc]', form).val("");
                    form.submit();
                }
                return false;
            });

            $("form.js-oxProductForm").submit(function () {
                if (!$("input[name='fnc']", this).val()) {
                    if (($( "input[name=aid]", this ).val() == $( "input[name=parentid]", this ).val() )) {
                        var aSelectionInputs = $("input[name^=varselid]", this);
                        if (aSelectionInputs.length) {
                            var hash = '';
                            aSelectionInputs.not("*[value='']").each(function(i){
                                hash = hash+i+':'+$(this).val()+"|";
                            });
                            if ( jQuery.inArray( hash, oxVariantSelections ) === -1 ) {
                                return self.reloadProductPartially( $("form.js-oxProductForm"), 'detailsMain', $("#detailsMain"), $("#detailsMain")[0]);
                            }
                        }
                    }
                    return self.reloadProductPartially($("form.js-oxProductForm"),'productInfo',$("#productinfo"),$("#productinfo")[0]);
                }
            });

        },

        /**
         * Runs defined scripts inside the method, before ajax is called
         */
        _preAjaxCaller : function()
        {
            $('#zoomModal').remove();
        },

        reloadProductPartially : function(activator, renderPart, highlightTargets, contentTarget) {

            // calls some scripts before the ajax starts
            this._preAjaxCaller();

            oxAjax.ajax(
                activator,
                {//targetEl, onSuccess, onError, additionalData
                    'targetEl'  : highlightTargets,
                    'iconPosEl' : $("#variants .dropdown"),
                    'additionalData' : {'renderPartial' : renderPart},
                    'onSuccess' : function(r) {
                        $(contentTarget).html(r['content']);
                        oxAjax.evalScripts(contentTarget);
                    }
                }
            );
            return false;
        }

    };

    $.widget("ui.oxArticleVariant", oxArticleVariant );

})( jQuery );