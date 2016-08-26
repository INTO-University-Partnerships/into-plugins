(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
'use strict';

var app = angular.module('general.directives', []);

app.directive('alerts', [function () {
    return {
        restrict: 'E',
        scope: {
            messages: '='
        },
        templateUrl: Urls['messaging_api:partial_base']() + 'directive/alerts',
        link: function link(scope, element) {
            element.find('button').bind('click', function () {
                scope.$apply(function () {
                    scope.class = '';
                    scope.msg = '';
                });
            });
        },
        controller: ['$scope', function ($scope) {
            $scope.class = '';

            $scope.setMessage = function (status) {
                if ($scope.messages[status]) {
                    $scope.msg = $scope.messages[status];
                    $scope.class = 'alert-' + status;
                    $scope.messages = {};
                }
            };

            angular.forEach(['success', 'danger', 'warning', 'info'], function (status) {
                $scope.$watch('messages.' + status, function () {
                    $scope.setMessage(status);
                }, true);
            });
        }]
    };
}]);

app.directive('modalConfirm', [function () {
    return {
        restrict: 'E',
        scope: {
            uid: '@',
            title: '@',
            body: '@',
            cancel: '&',
            confirm: '&'
        },
        templateUrl: Urls['messaging_api:partial_base']() + 'directive/modalConfirm'
    };
}]);

app.directive('pagination', [function () {
    return {
        restrict: 'E',
        scope: {
            perPage: '@',
            currentPage: '=',
            total: '=',
            fetchPage: '&'
        },
        templateUrl: Urls['messaging_api:partial_base']() + 'directive/pagination',
        controller: ['$scope', function ($scope) {
            $scope.currentPage = 0;
            $scope.pageCount = 0;
            $scope.pages = [];

            $scope.calculatePageCount = function () {
                if ($scope.total === 0) {
                    $scope.pageCount = 1;
                } else {
                    $scope.pageCount = Math.ceil($scope.total / $scope.perPage);
                }
            };

            $scope.calculatePages = function () {
                var from, to, i;
                from = 1;
                to = $scope.pageCount;
                $scope.pages = [];
                for (i = from; i <= to; ++i) {
                    $scope.pages.push(i);
                }
            };

            $scope.$watch('currentPage', function () {
                $scope.calculatePages();
            });

            $scope.$watch('total', function () {
                $scope.calculatePageCount();
                $scope.calculatePages();
            });

            $scope.prevPage = function () {
                if ($scope.currentPage > 0) {
                    --$scope.currentPage;
                }
            };

            $scope.prevPageDisabled = function () {
                var disabled = $scope.currentPage === 0 ? 'disabled' : '';
                return disabled;
            };

            $scope.nextPage = function () {
                if ($scope.currentPage < $scope.pageCount - 1) {
                    $scope.currentPage++;
                }
            };

            $scope.nextPageDisabled = function () {
                var disabled = $scope.currentPage === $scope.pageCount - 1 ? 'disabled' : '';
                return disabled;
            };

            $scope.pageDisabled = function (n) {
                var disabled = $scope.currentPage === n;
                return disabled;
            };

            $scope.gotoPage = function (n) {
                $scope.currentPage = n;
            };
        }]
    };
}]);

},{}],2:[function(require,module,exports){
'use strict';

var app = angular.module('general.filters', []);

app.filter('raw', ['$sce', function ($sce) {
    return function (untrusted) {
        return $sce.trustAsHtml(untrusted);
    };
}]);

},{}],3:[function(require,module,exports){
'use strict';

var app = angular.module('general.services', []);

app.service('genericSrv', ['$http', '$q', function ($http, $q) {
    this.genericGet = function (url) {
        return this._genericVerb('get', url, {});
    };

    this.genericPost = function (url, data) {
        return this._genericVerb('post', url, data);
    };

    this._genericVerb = function (verb, url, data) {
        var deferred = $q.defer();
        $http[verb](url, data).success(function (d) {
            deferred.resolve(d);
        }).error(function (d) {
            deferred.reject(d);
        });
        return deferred.promise;
    };
}]);

app.service('messageSrv', function () {
    this.messages = {};
    this.collect = function () {
        var retval = {};
        angular.copy(this.messages, retval);
        this.messages = {};
        return retval;
    };
});

},{}],4:[function(require,module,exports){
'use strict';

var app = angular.module('notificationsApp', ['notificationsApp.controllers', 'notificationsApp.services', 'general.directives', 'general.filters', 'general.services', 'ngRoute', 'ngSanitize']);

app.constant('CONFIG', window.CONFIG);
delete window.CONFIG;

app.config(['$routeProvider', '$httpProvider', function ($routeProvider, $httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
    $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
    $routeProvider.when('/', {
        templateUrl: Urls['messaging_api:partial_base']() + 'route/listNotifications',
        controller: 'listNotificationsCtrl'
    }).otherwise({
        redirectTo: '/'
    });
}]);

},{}],5:[function(require,module,exports){
'use strict';

require('./angular-app');

require('./controllers');

require('./services');

require('../general/directives');

require('../general/filters');

require('../general/services');

},{"../general/directives":1,"../general/filters":2,"../general/services":3,"./angular-app":4,"./controllers":6,"./services":7}],6:[function(require,module,exports){
'use strict';

var app = angular.module('notificationsApp.controllers', []);

app.controller('listNotificationsCtrl', ['$scope', '$timeout', '$window', 'genericSrv', 'messageSrv', 'CONFIG', function ($scope, $timeout, $window, genericSrv, messageSrv, config) {
    $scope.perPage = 6;
    $scope.notifications = null;
    $scope.total = 0;
    $scope.currentPage = 0;
    $scope.timeoutPromise = null;
    $scope.messages = messageSrv.collect();
    $scope.showMessageItemIds = config.showMessageItemIds;
    $scope.firstTime = true;

    $scope.getPageOfNotifications = function () {
        var url = Urls['messaging_api:get_notifications']() + '?page=' + $scope.currentPage + '&per_page=' + $scope.perPage;
        $timeout.cancel($scope.timeoutPromise);
        genericSrv.genericGet(url).then(function (data) {
            $scope.notifications = data.notifications;
            $scope.total = data.total;
            if ($scope.firstTime && $scope.total === 0) {
                $scope.firstTime = false;
                $scope.messages.info = config.trans.no_notifications;
            }
        }, function (error) {
            $scope.notifications = null;
            $scope.total = 0;
            $scope.messages.danger = error.errorMessage;
        }).finally(function () {
            $scope.timeoutPromise = $timeout(function () {
                $scope.getPageOfNotifications($scope.currentPage);
            }, 10000);
        });
    };

    $scope.clickNotification = function (notification) {
        var url = Urls['messaging_api:mark_notification_read']() + '?miid=' + notification.id;
        genericSrv.genericGet(url).then(function () {
            $window.location.href = notification.url;
        }, function (error) {
            $scope.messages.danger = error.errorMessage;
        });
    };

    $scope.openModal = function ($event, uid, miid) {
        $event.stopPropagation();
        $timeout.cancel($scope.timeoutPromise);
        $scope.miid = miid;
        jQuery('#' + uid).modal({});
    };

    $scope.cancelDeleteNotification = function (uid) {
        var elem = jQuery('#' + uid);
        elem.off('hidden.bs.modal');
        elem.on('hidden.bs.modal', function () {
            $scope.getPageOfNotifications($scope.currentPage);
        });
        elem.modal('hide');
    };

    $scope.deleteNotification = function (uid) {
        var url,
            elem = jQuery('#' + uid);
        elem.off('hidden.bs.modal');
        elem.on('hidden.bs.modal', function () {
            var miid = $scope.miid;
            $scope.miid = null;
            if (!miid) {
                return;
            }
            url = Urls['messaging_api:delete_message_item']() + '?miid=' + miid;
            genericSrv.genericGet(url).then(function (data) {
                $scope.messages.success = data.successMessage;
                $scope.currentPage = 0;
            }, function (error) {
                $scope.messages[error.type] = error.errorMessage;
            }).finally(function () {
                $scope.getPageOfNotifications($scope.currentPage);
            });
        });
        elem.modal('hide');
    };

    $scope.$watch('currentPage', function (newValue) {
        $scope.getPageOfNotifications(newValue);
    });

    $scope.$on('$destroy', function () {
        $timeout.cancel($scope.timeoutPromise);
    });
}]);

},{}],7:[function(require,module,exports){
'use strict';

angular.module('notificationsApp.services', []);

},{}]},{},[5]);
