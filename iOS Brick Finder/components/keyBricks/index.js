'use strict';

app.keyBricks = kendo.observable({
    onShow: function() {},
    afterShow: function() {}
});
app.localization.registerView('keyBricks');

// START_CUSTOM_CODE_keyBricks
// Add custom code here. For more information about custom code, see http://docs.telerik.com/platform/screenbuilder/troubleshooting/how-to-keep-custom-code-changes

// END_CUSTOM_CODE_keyBricks
(function(parent) {
    var
    /// start global model properties
    /// end global model properties
        keyBricksModel = kendo.observable({
        /// start add model functions
        /// end add model functions

    });

    /// start form functions
    /// end form functions

    parent.set('onShow', function _onShow() {
        var that = parent;
        that.set('addFormData', {
            /// start add form data init
            /// end add form data init
        });
        /// start add form show
        /// end add form show
    });
    parent.set('keyBricksModel', keyBricksModel);
})(app.keyBricks);

// START_CUSTOM_CODE_keyBricksModel
// Add custom code here. For more information about custom code, see http://docs.telerik.com/platform/screenbuilder/troubleshooting/how-to-keep-custom-code-changes

// END_CUSTOM_CODE_keyBricksModel