'use strict';

app.homePage = kendo.observable({
    onShow: function() {},
    afterShow: function() {}
});
app.localization.registerView('homePage');

// START_CUSTOM_CODE_homePage
// Add custom code here. For more information about custom code, see http://docs.telerik.com/platform/screenbuilder/troubleshooting/how-to-keep-custom-code-changes

// END_CUSTOM_CODE_homePage
(function(parent) {
    var
    /// start global model properties
    /// end global model properties
        homePageModel = kendo.observable({
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
    parent.set('homePageModel', homePageModel);
})(app.homePage);

// START_CUSTOM_CODE_homePageModel
// Add custom code here. For more information about custom code, see http://docs.telerik.com/platform/screenbuilder/troubleshooting/how-to-keep-custom-code-changes

// END_CUSTOM_CODE_homePageModel