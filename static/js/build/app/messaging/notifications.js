/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 6);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


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

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var app = angular.module('general.filters', []);

app.filter('raw', ['$sce', function ($sce) {
    return function (untrusted) {
        return $sce.trustAsHtml(untrusted);
    };
}]);

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


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

/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


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

/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


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

/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


angular.module('notificationsApp.services', []);

/***/ }),
/* 6 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


__webpack_require__(3);

__webpack_require__(4);

__webpack_require__(5);

__webpack_require__(0);

__webpack_require__(1);

__webpack_require__(2);

/***/ })
/******/ ]);
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vd2VicGFjay9ib290c3RyYXAgMTdhM2VmZTNkZDBiN2ZkY2Y1ZTYiLCJ3ZWJwYWNrOi8vLy4vbWVzc2FnaW5nL2pzL2dlbmVyYWwvZGlyZWN0aXZlcy5qcyIsIndlYnBhY2s6Ly8vLi9tZXNzYWdpbmcvanMvZ2VuZXJhbC9maWx0ZXJzLmpzIiwid2VicGFjazovLy8uL21lc3NhZ2luZy9qcy9nZW5lcmFsL3NlcnZpY2VzLmpzIiwid2VicGFjazovLy8uL21lc3NhZ2luZy9qcy9ub3RpZmljYXRpb25zL2FuZ3VsYXItYXBwLmpzIiwid2VicGFjazovLy8uL21lc3NhZ2luZy9qcy9ub3RpZmljYXRpb25zL2NvbnRyb2xsZXJzLmpzIiwid2VicGFjazovLy8uL21lc3NhZ2luZy9qcy9ub3RpZmljYXRpb25zL3NlcnZpY2VzLmpzIiwid2VicGFjazovLy8uL21lc3NhZ2luZy9qcy9ub3RpZmljYXRpb25zL2FwcC5qcyJdLCJuYW1lcyI6WyJhcHAiLCJhbmd1bGFyIiwibW9kdWxlIiwiZGlyZWN0aXZlIiwicmVzdHJpY3QiLCJzY29wZSIsIm1lc3NhZ2VzIiwidGVtcGxhdGVVcmwiLCJVcmxzIiwibGluayIsImVsZW1lbnQiLCJmaW5kIiwiYmluZCIsIiRhcHBseSIsImNsYXNzIiwibXNnIiwiY29udHJvbGxlciIsIiRzY29wZSIsInNldE1lc3NhZ2UiLCJzdGF0dXMiLCJmb3JFYWNoIiwiJHdhdGNoIiwidWlkIiwidGl0bGUiLCJib2R5IiwiY2FuY2VsIiwiY29uZmlybSIsInBlclBhZ2UiLCJjdXJyZW50UGFnZSIsInRvdGFsIiwiZmV0Y2hQYWdlIiwicGFnZUNvdW50IiwicGFnZXMiLCJjYWxjdWxhdGVQYWdlQ291bnQiLCJNYXRoIiwiY2VpbCIsImNhbGN1bGF0ZVBhZ2VzIiwiZnJvbSIsInRvIiwiaSIsInB1c2giLCJwcmV2UGFnZSIsInByZXZQYWdlRGlzYWJsZWQiLCJkaXNhYmxlZCIsIm5leHRQYWdlIiwibmV4dFBhZ2VEaXNhYmxlZCIsInBhZ2VEaXNhYmxlZCIsIm4iLCJnb3RvUGFnZSIsImZpbHRlciIsIiRzY2UiLCJ1bnRydXN0ZWQiLCJ0cnVzdEFzSHRtbCIsInNlcnZpY2UiLCIkaHR0cCIsIiRxIiwiZ2VuZXJpY0dldCIsInVybCIsIl9nZW5lcmljVmVyYiIsImdlbmVyaWNQb3N0IiwiZGF0YSIsInZlcmIiLCJkZWZlcnJlZCIsImRlZmVyIiwic3VjY2VzcyIsImQiLCJyZXNvbHZlIiwiZXJyb3IiLCJyZWplY3QiLCJwcm9taXNlIiwiY29sbGVjdCIsInJldHZhbCIsImNvcHkiLCJjb25zdGFudCIsIndpbmRvdyIsIkNPTkZJRyIsImNvbmZpZyIsIiRyb3V0ZVByb3ZpZGVyIiwiJGh0dHBQcm92aWRlciIsImRlZmF1bHRzIiwieHNyZkNvb2tpZU5hbWUiLCJ4c3JmSGVhZGVyTmFtZSIsImhlYWRlcnMiLCJjb21tb24iLCJ3aGVuIiwib3RoZXJ3aXNlIiwicmVkaXJlY3RUbyIsIiR0aW1lb3V0IiwiJHdpbmRvdyIsImdlbmVyaWNTcnYiLCJtZXNzYWdlU3J2Iiwibm90aWZpY2F0aW9ucyIsInRpbWVvdXRQcm9taXNlIiwic2hvd01lc3NhZ2VJdGVtSWRzIiwiZmlyc3RUaW1lIiwiZ2V0UGFnZU9mTm90aWZpY2F0aW9ucyIsInRoZW4iLCJpbmZvIiwidHJhbnMiLCJub19ub3RpZmljYXRpb25zIiwiZGFuZ2VyIiwiZXJyb3JNZXNzYWdlIiwiZmluYWxseSIsImNsaWNrTm90aWZpY2F0aW9uIiwibm90aWZpY2F0aW9uIiwiaWQiLCJsb2NhdGlvbiIsImhyZWYiLCJvcGVuTW9kYWwiLCIkZXZlbnQiLCJtaWlkIiwic3RvcFByb3BhZ2F0aW9uIiwialF1ZXJ5IiwibW9kYWwiLCJjYW5jZWxEZWxldGVOb3RpZmljYXRpb24iLCJlbGVtIiwib2ZmIiwib24iLCJkZWxldGVOb3RpZmljYXRpb24iLCJzdWNjZXNzTWVzc2FnZSIsInR5cGUiLCJuZXdWYWx1ZSIsIiRvbiJdLCJtYXBwaW5ncyI6IjtBQUFBO0FBQ0E7O0FBRUE7QUFDQTs7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QTNGLFFBQVFDLE1BQVIsQ0FBZSwyQkFBZixFQUE0QyxFQUE1QyxFOzs7Ozs7O0FDRkE7O0FBRUE7O0FBQ0E7O0FBQ0E7O0FBQ0E7O0FBQ0E7O0FBQ0EsdUIiLCJmaWxlIjoibm90aWZpY2F0aW9ucy5qcyIsInNvdXJjZXNDb250ZW50IjpbIiBcdC8vIFRoZSBtb2R1bGUgY2FjaGVcbiBcdHZhciBpbnN0YWxsZWRNb2R1bGVzID0ge307XG5cbiBcdC8vIFRoZSByZXF1aXJlIGZ1bmN0aW9uXG4gXHRmdW5jdGlvbiBfX3dlYnBhY2tfcmVxdWlyZV9fKG1vZHVsZUlkKSB7XG5cbiBcdFx0Ly8gQ2hlY2sgaWYgbW9kdWxlIGlzIGluIGNhY2hlXG4gXHRcdGlmKGluc3RhbGxlZE1vZHVsZXNbbW9kdWxlSWRdKVxuIFx0XHRcdHJldHVybiBpbnN0YWxsZWRNb2R1bGVzW21vZHVsZUlkXS5leHBvcnRzO1xuXG4gXHRcdC8vIENyZWF0ZSBhIG5ldyBtb2R1bGUgKGFuZCBwdXQgaXQgaW50byB0aGUgY2FjaGUpXG4gXHRcdHZhciBtb2R1bGUgPSBpbnN0YWxsZWRNb2R1bGVzW21vZHVsZUlkXSA9IHtcbiBcdFx0XHRpOiBtb2R1bGVJZCxcbiBcdFx0XHRsOiBmYWxzZSxcbiBcdFx0XHRleHBvcnRzOiB7fVxuIFx0XHR9O1xuXG4gXHRcdC8vIEV4ZWN1dGUgdGhlIG1vZHVsZSBmdW5jdGlvblxuIFx0XHRtb2R1bGVzW21vZHVsZUlkXS5jYWxsKG1vZHVsZS5leHBvcnRzLCBtb2R1bGUsIG1vZHVsZS5leHBvcnRzLCBfX3dlYnBhY2tfcmVxdWlyZV9fKTtcblxuIFx0XHQvLyBGbGFnIHRoZSBtb2R1bGUgYXMgbG9hZGVkXG4gXHRcdG1vZHVsZS5sID0gdHJ1ZTtcblxuIFx0XHQvLyBSZXR1cm4gdGhlIGV4cG9ydHMgb2YgdGhlIG1vZHVsZVxuIFx0XHRyZXR1cm4gbW9kdWxlLmV4cG9ydHM7XG4gXHR9XG5cblxuIFx0Ly8gZXhwb3NlIHRoZSBtb2R1bGVzIG9iamVjdCAoX193ZWJwYWNrX21vZHVsZXNfXylcbiBcdF9fd2VicGFja19yZXF1aXJlX18ubSA9IG1vZHVsZXM7XG5cbiBcdC8vIGV4cG9zZSB0aGUgbW9kdWxlIGNhY2hlXG4gXHRfX3dlYnBhY2tfcmVxdWlyZV9fLmMgPSBpbnN0YWxsZWRNb2R1bGVzO1xuXG4gXHQvLyBpZGVudGl0eSBmdW5jdGlvbiBmb3IgY2FsbGluZyBoYXJtb255IGltcG9ydHMgd2l0aCB0aGUgY29ycmVjdCBjb250ZXh0XG4gXHRfX3dlYnBhY2tfcmVxdWlyZV9fLmkgPSBmdW5jdGlvbih2YWx1ZSkgeyByZXR1cm4gdmFsdWU7IH07XG5cbiBcdC8vIGRlZmluZSBnZXR0ZXIgZnVuY3Rpb24gZm9yIGhhcm1vbnkgZXhwb3J0c1xuIFx0X193ZWJwYWNrX3JlcXVpcmVfXy5kID0gZnVuY3Rpb24oZXhwb3J0cywgbmFtZSwgZ2V0dGVyKSB7XG4gXHRcdGlmKCFfX3dlYnBhY2tfcmVxdWlyZV9fLm8oZXhwb3J0cywgbmFtZSkpIHtcbiBcdFx0XHRPYmplY3QuZGVmaW5lUHJvcGVydHkoZXhwb3J0cywgbmFtZSwge1xuIFx0XHRcdFx0Y29uZmlndXJhYmxlOiBmYWxzZSxcbiBcdFx0XHRcdGVudW1lcmFibGU6IHRydWUsXG4gXHRcdFx0XHRnZXQ6IGdldHRlclxuIFx0XHRcdH0pO1xuIFx0XHR9XG4gXHR9O1xuXG4gXHQvLyBnZXREZWZhdWx0RXhwb3J0IGZ1bmN0aW9uIGZvciBjb21wYXRpYmlsaXR5IHdpdGggbm9uLWhhcm1vbnkgbW9kdWxlc1xuIFx0X193ZWJwYWNrX3JlcXVpcmVfXy5uID0gZnVuY3Rpb24obW9kdWxlKSB7XG4gXHRcdHZhciBnZXR0ZXIgPSBtb2R1bGUgJiYgbW9kdWxlLl9fZXNNb2R1bGUgP1xuIFx0XHRcdGZ1bmN0aW9uIGdldERlZmF1bHQoKSB7IHJldHVybiBtb2R1bGVbJ2RlZmF1bHQnXTsgfSA6XG4gXHRcdFx0ZnVuY3Rpb24gZ2V0TW9kdWxlRXhwb3J0cygpIHsgcmV0dXJuIG1vZHVsZTsgfTtcbiBcdFx0X193ZWJwYWNrX3JlcXVpcmVfXy5kKGdldHRlciwgJ2EnLCBnZXR0ZXIpO1xuIFx0XHRyZXR1cm4gZ2V0dGVyO1xuIFx0fTtcblxuIFx0Ly8gT2JqZWN0LnByb3RvdHlwZS5oYXNPd25Qcm9wZXJ0eS5jYWxsXG4gXHRfX3dlYnBhY2tfcmVxdWlyZV9fLm8gPSBmdW5jdGlvbihvYmplY3QsIHByb3BlcnR5KSB7IHJldHVybiBPYmplY3QucHJvdG90eXBlLmhhc093blByb3BlcnR5LmNhbGwob2JqZWN0LCBwcm9wZXJ0eSk7IH07XG5cbiBcdC8vIF9fd2VicGFja19wdWJsaWNfcGF0aF9fXG4gXHRfX3dlYnBhY2tfcmVxdWlyZV9fLnAgPSBcIlwiO1xuXG4gXHQvLyBMb2FkIGVudHJ5IG1vZHVsZSBhbmQgcmV0dXJuIGV4cG9ydHNcbiBcdHJldHVybiBfX3dlYnBhY2tfcmVxdWlyZV9fKF9fd2VicGFja19yZXF1aXJlX18ucyA9IDYpO1xuXG5cblxuLy8gV0VCUEFDSyBGT09URVIgLy9cbi8vIHdlYnBhY2svYm9vdHN0cmFwIDE3YTNlZmUzZGQwYjdmZGNmNWU2IiwiJ3VzZSBzdHJpY3QnO1xuXG52YXIgYXBwID0gYW5ndWxhci5tb2R1bGUoJ2dlbmVyYWwuZGlyZWN0aXZlcycsIFtdKTtcblxuYXBwLmRpcmVjdGl2ZSgnYWxlcnRzJywgW1xuICAgIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgcmV0dXJuIHtcbiAgICAgICAgICAgIHJlc3RyaWN0OiAnRScsXG4gICAgICAgICAgICBzY29wZToge1xuICAgICAgICAgICAgICAgIG1lc3NhZ2VzOiAnPSdcbiAgICAgICAgICAgIH0sXG4gICAgICAgICAgICB0ZW1wbGF0ZVVybDogVXJsc1snbWVzc2FnaW5nX2FwaTpwYXJ0aWFsX2Jhc2UnXSgpICsgJ2RpcmVjdGl2ZS9hbGVydHMnLFxuICAgICAgICAgICAgbGluazogZnVuY3Rpb24gKHNjb3BlLCBlbGVtZW50KSB7XG4gICAgICAgICAgICAgICAgZWxlbWVudC5maW5kKCdidXR0b24nKS5iaW5kKCdjbGljaycsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgc2NvcGUuJGFwcGx5KGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgIHNjb3BlLmNsYXNzID0gJyc7XG4gICAgICAgICAgICAgICAgICAgICAgICBzY29wZS5tc2cgPSAnJztcbiAgICAgICAgICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICB9LFxuICAgICAgICAgICAgY29udHJvbGxlcjogWyckc2NvcGUnLCBmdW5jdGlvbiAoJHNjb3BlKSB7XG4gICAgICAgICAgICAgICAgJHNjb3BlLmNsYXNzID0gJyc7XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUuc2V0TWVzc2FnZSA9IGZ1bmN0aW9uIChzdGF0dXMpIHtcbiAgICAgICAgICAgICAgICAgICAgaWYgKCRzY29wZS5tZXNzYWdlc1tzdGF0dXNdKSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUubXNnID0gJHNjb3BlLm1lc3NhZ2VzW3N0YXR1c107XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUuY2xhc3MgPSAnYWxlcnQtJyArIHN0YXR1cztcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5tZXNzYWdlcyA9IHt9O1xuICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgfTtcblxuICAgICAgICAgICAgICAgIGFuZ3VsYXIuZm9yRWFjaChbJ3N1Y2Nlc3MnLCAnZGFuZ2VyJywgJ3dhcm5pbmcnLCAnaW5mbyddLCBmdW5jdGlvbiAoc3RhdHVzKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS4kd2F0Y2goJ21lc3NhZ2VzLicgKyBzdGF0dXMsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5zZXRNZXNzYWdlKHN0YXR1cyk7XG4gICAgICAgICAgICAgICAgICAgIH0sIHRydWUpO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgfV1cbiAgICAgICAgfTtcbiAgICB9XG5dKTtcblxuYXBwLmRpcmVjdGl2ZSgnbW9kYWxDb25maXJtJywgW1xuICAgIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgcmV0dXJuIHtcbiAgICAgICAgICAgIHJlc3RyaWN0OiAnRScsXG4gICAgICAgICAgICBzY29wZToge1xuICAgICAgICAgICAgICAgIHVpZDogJ0AnLFxuICAgICAgICAgICAgICAgIHRpdGxlOiAnQCcsXG4gICAgICAgICAgICAgICAgYm9keTogJ0AnLFxuICAgICAgICAgICAgICAgIGNhbmNlbDogJyYnLFxuICAgICAgICAgICAgICAgIGNvbmZpcm06ICcmJ1xuICAgICAgICAgICAgfSxcbiAgICAgICAgICAgIHRlbXBsYXRlVXJsOiBVcmxzWydtZXNzYWdpbmdfYXBpOnBhcnRpYWxfYmFzZSddKCkgKyAnZGlyZWN0aXZlL21vZGFsQ29uZmlybSdcbiAgICAgICAgfTtcbiAgICB9XG5dKTtcblxuYXBwLmRpcmVjdGl2ZSgncGFnaW5hdGlvbicsIFtcbiAgICBmdW5jdGlvbiAoKSB7XG4gICAgICAgIHJldHVybiB7XG4gICAgICAgICAgICByZXN0cmljdDogJ0UnLFxuICAgICAgICAgICAgc2NvcGU6IHtcbiAgICAgICAgICAgICAgICBwZXJQYWdlOiAnQCcsXG4gICAgICAgICAgICAgICAgY3VycmVudFBhZ2U6ICc9JyxcbiAgICAgICAgICAgICAgICB0b3RhbDogJz0nLFxuICAgICAgICAgICAgICAgIGZldGNoUGFnZTogJyYnXG4gICAgICAgICAgICB9LFxuICAgICAgICAgICAgdGVtcGxhdGVVcmw6IFVybHNbJ21lc3NhZ2luZ19hcGk6cGFydGlhbF9iYXNlJ10oKSArICdkaXJlY3RpdmUvcGFnaW5hdGlvbicsXG4gICAgICAgICAgICBjb250cm9sbGVyOiBbJyRzY29wZScsIGZ1bmN0aW9uICgkc2NvcGUpIHtcbiAgICAgICAgICAgICAgICAkc2NvcGUuY3VycmVudFBhZ2UgPSAwO1xuICAgICAgICAgICAgICAgICRzY29wZS5wYWdlQ291bnQgPSAwO1xuICAgICAgICAgICAgICAgICRzY29wZS5wYWdlcyA9IFtdO1xuXG4gICAgICAgICAgICAgICAgJHNjb3BlLmNhbGN1bGF0ZVBhZ2VDb3VudCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgaWYgKCRzY29wZS50b3RhbCA9PT0gMCkge1xuICAgICAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnBhZ2VDb3VudCA9IDE7XG4gICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUucGFnZUNvdW50ID0gTWF0aC5jZWlsKCRzY29wZS50b3RhbCAvICRzY29wZS5wZXJQYWdlKTtcbiAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUuY2FsY3VsYXRlUGFnZXMgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgIHZhciBmcm9tLCB0bywgaTtcbiAgICAgICAgICAgICAgICAgICAgZnJvbSA9IDE7XG4gICAgICAgICAgICAgICAgICAgIHRvID0gJHNjb3BlLnBhZ2VDb3VudDtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnBhZ2VzID0gW107XG4gICAgICAgICAgICAgICAgICAgIGZvciAoaSA9IGZyb207IGkgPD0gdG87ICsraSkge1xuICAgICAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnBhZ2VzLnB1c2goaSk7XG4gICAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICB9O1xuXG4gICAgICAgICAgICAgICAgJHNjb3BlLiR3YXRjaCgnY3VycmVudFBhZ2UnLCBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5jYWxjdWxhdGVQYWdlcygpO1xuICAgICAgICAgICAgICAgIH0pO1xuXG4gICAgICAgICAgICAgICAgJHNjb3BlLiR3YXRjaCgndG90YWwnLCBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5jYWxjdWxhdGVQYWdlQ291bnQoKTtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLmNhbGN1bGF0ZVBhZ2VzKCk7XG4gICAgICAgICAgICAgICAgfSk7XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUucHJldlBhZ2UgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgIGlmICgkc2NvcGUuY3VycmVudFBhZ2UgPiAwKSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAtLSRzY29wZS5jdXJyZW50UGFnZTtcbiAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUucHJldlBhZ2VEaXNhYmxlZCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgdmFyIGRpc2FibGVkID0gJHNjb3BlLmN1cnJlbnRQYWdlID09PSAwID8gJ2Rpc2FibGVkJyA6ICcnO1xuICAgICAgICAgICAgICAgICAgICByZXR1cm4gZGlzYWJsZWQ7XG4gICAgICAgICAgICAgICAgfTtcblxuICAgICAgICAgICAgICAgICRzY29wZS5uZXh0UGFnZSA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgaWYgKCRzY29wZS5jdXJyZW50UGFnZSA8ICRzY29wZS5wYWdlQ291bnQgLSAxKSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUuY3VycmVudFBhZ2UrKztcbiAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUubmV4dFBhZ2VEaXNhYmxlZCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgdmFyIGRpc2FibGVkID0gJHNjb3BlLmN1cnJlbnRQYWdlID09PSAkc2NvcGUucGFnZUNvdW50IC0gMSA/ICdkaXNhYmxlZCcgOiAnJztcbiAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGRpc2FibGVkO1xuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUucGFnZURpc2FibGVkID0gZnVuY3Rpb24gKG4pIHtcbiAgICAgICAgICAgICAgICAgICAgdmFyIGRpc2FibGVkID0gJHNjb3BlLmN1cnJlbnRQYWdlID09PSBuO1xuICAgICAgICAgICAgICAgICAgICByZXR1cm4gZGlzYWJsZWQ7XG4gICAgICAgICAgICAgICAgfTtcblxuICAgICAgICAgICAgICAgICRzY29wZS5nb3RvUGFnZSA9IGZ1bmN0aW9uIChuKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5jdXJyZW50UGFnZSA9IG47XG4gICAgICAgICAgICAgICAgfTtcbiAgICAgICAgICAgIH1dXG4gICAgICAgIH07XG4gICAgfVxuXSk7XG5cblxuXG4vLyBXRUJQQUNLIEZPT1RFUiAvL1xuLy8gLi9tZXNzYWdpbmcvanMvZ2VuZXJhbC9kaXJlY3RpdmVzLmpzIiwiJ3VzZSBzdHJpY3QnO1xuXG52YXIgYXBwID0gYW5ndWxhci5tb2R1bGUoJ2dlbmVyYWwuZmlsdGVycycsIFtdKTtcblxuYXBwLmZpbHRlcigncmF3JywgW1xuICAgICckc2NlJyxcbiAgICBmdW5jdGlvbiAoJHNjZSkge1xuICAgICAgICByZXR1cm4gZnVuY3Rpb24gKHVudHJ1c3RlZCkge1xuICAgICAgICAgICAgcmV0dXJuICRzY2UudHJ1c3RBc0h0bWwodW50cnVzdGVkKTtcbiAgICAgICAgfTtcbiAgICB9XG5dKTtcblxuXG5cbi8vIFdFQlBBQ0sgRk9PVEVSIC8vXG4vLyAuL21lc3NhZ2luZy9qcy9nZW5lcmFsL2ZpbHRlcnMuanMiLCIndXNlIHN0cmljdCc7XG5cbnZhciBhcHAgPSBhbmd1bGFyLm1vZHVsZSgnZ2VuZXJhbC5zZXJ2aWNlcycsIFtdKTtcblxuYXBwLnNlcnZpY2UoJ2dlbmVyaWNTcnYnLCBbXG4gICAgJyRodHRwJywgJyRxJyxcbiAgICBmdW5jdGlvbiAoJGh0dHAsICRxKSB7XG4gICAgICAgIHRoaXMuZ2VuZXJpY0dldCA9IGZ1bmN0aW9uICh1cmwpIHtcbiAgICAgICAgICAgIHJldHVybiB0aGlzLl9nZW5lcmljVmVyYignZ2V0JywgdXJsLCB7fSk7XG4gICAgICAgIH07XG5cbiAgICAgICAgdGhpcy5nZW5lcmljUG9zdCA9IGZ1bmN0aW9uICh1cmwsIGRhdGEpIHtcbiAgICAgICAgICAgIHJldHVybiB0aGlzLl9nZW5lcmljVmVyYigncG9zdCcsIHVybCwgZGF0YSk7XG4gICAgICAgIH07XG5cbiAgICAgICAgdGhpcy5fZ2VuZXJpY1ZlcmIgPSBmdW5jdGlvbiAodmVyYiwgdXJsLCBkYXRhKSB7XG4gICAgICAgICAgICB2YXIgZGVmZXJyZWQgPSAkcS5kZWZlcigpO1xuICAgICAgICAgICAgJGh0dHBbdmVyYl0odXJsLCBkYXRhKS5cbiAgICAgICAgICAgICAgICBzdWNjZXNzKGZ1bmN0aW9uIChkKSB7XG4gICAgICAgICAgICAgICAgICAgIGRlZmVycmVkLnJlc29sdmUoZCk7XG4gICAgICAgICAgICAgICAgfSkuXG4gICAgICAgICAgICAgICAgZXJyb3IoZnVuY3Rpb24gKGQpIHtcbiAgICAgICAgICAgICAgICAgICAgZGVmZXJyZWQucmVqZWN0KGQpO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgcmV0dXJuIGRlZmVycmVkLnByb21pc2U7XG4gICAgICAgIH07XG4gICAgfVxuXSk7XG5cbmFwcC5zZXJ2aWNlKCdtZXNzYWdlU3J2JywgZnVuY3Rpb24gKCkge1xuICAgIHRoaXMubWVzc2FnZXMgPSB7fTtcbiAgICB0aGlzLmNvbGxlY3QgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgIHZhciByZXR2YWwgPSB7fTtcbiAgICAgICAgYW5ndWxhci5jb3B5KHRoaXMubWVzc2FnZXMsIHJldHZhbCk7XG4gICAgICAgIHRoaXMubWVzc2FnZXMgPSB7fTtcbiAgICAgICAgcmV0dXJuIHJldHZhbDtcbiAgICB9O1xufSk7XG5cblxuXG4vLyBXRUJQQUNLIEZPT1RFUiAvL1xuLy8gLi9tZXNzYWdpbmcvanMvZ2VuZXJhbC9zZXJ2aWNlcy5qcyIsIid1c2Ugc3RyaWN0JztcblxudmFyIGFwcCA9IGFuZ3VsYXIubW9kdWxlKCdub3RpZmljYXRpb25zQXBwJywgW1xuICAgICdub3RpZmljYXRpb25zQXBwLmNvbnRyb2xsZXJzJyxcbiAgICAnbm90aWZpY2F0aW9uc0FwcC5zZXJ2aWNlcycsXG4gICAgJ2dlbmVyYWwuZGlyZWN0aXZlcycsXG4gICAgJ2dlbmVyYWwuZmlsdGVycycsXG4gICAgJ2dlbmVyYWwuc2VydmljZXMnLFxuICAgICduZ1JvdXRlJyxcbiAgICAnbmdTYW5pdGl6ZSdcbl0pO1xuXG5hcHAuY29uc3RhbnQoJ0NPTkZJRycsIHdpbmRvdy5DT05GSUcpO1xuZGVsZXRlIHdpbmRvdy5DT05GSUc7XG5cbmFwcC5jb25maWcoW1xuICAgICckcm91dGVQcm92aWRlcicsICckaHR0cFByb3ZpZGVyJyxcbiAgICBmdW5jdGlvbiAoJHJvdXRlUHJvdmlkZXIsICRodHRwUHJvdmlkZXIpIHtcbiAgICAgICAgJGh0dHBQcm92aWRlci5kZWZhdWx0cy54c3JmQ29va2llTmFtZSA9ICdjc3JmdG9rZW4nO1xuICAgICAgICAkaHR0cFByb3ZpZGVyLmRlZmF1bHRzLnhzcmZIZWFkZXJOYW1lID0gJ1gtQ1NSRlRva2VuJztcbiAgICAgICAgJGh0dHBQcm92aWRlci5kZWZhdWx0cy5oZWFkZXJzLmNvbW1vblsnWC1SZXF1ZXN0ZWQtV2l0aCddID0gJ1hNTEh0dHBSZXF1ZXN0JztcbiAgICAgICAgJHJvdXRlUHJvdmlkZXIuXG4gICAgICAgICAgICB3aGVuKCcvJywge1xuICAgICAgICAgICAgICAgIHRlbXBsYXRlVXJsOiBVcmxzWydtZXNzYWdpbmdfYXBpOnBhcnRpYWxfYmFzZSddKCkgKyAncm91dGUvbGlzdE5vdGlmaWNhdGlvbnMnLFxuICAgICAgICAgICAgICAgIGNvbnRyb2xsZXI6ICdsaXN0Tm90aWZpY2F0aW9uc0N0cmwnXG4gICAgICAgICAgICB9KS5cbiAgICAgICAgICAgIG90aGVyd2lzZSh7XG4gICAgICAgICAgICAgICAgcmVkaXJlY3RUbzogJy8nXG4gICAgICAgICAgICB9KTtcbiAgICB9XG5dKTtcblxuXG5cbi8vIFdFQlBBQ0sgRk9PVEVSIC8vXG4vLyAuL21lc3NhZ2luZy9qcy9ub3RpZmljYXRpb25zL2FuZ3VsYXItYXBwLmpzIiwiJ3VzZSBzdHJpY3QnO1xuXG52YXIgYXBwID0gYW5ndWxhci5tb2R1bGUoJ25vdGlmaWNhdGlvbnNBcHAuY29udHJvbGxlcnMnLCBbXSk7XG5cbmFwcC5jb250cm9sbGVyKCdsaXN0Tm90aWZpY2F0aW9uc0N0cmwnLCBbXG4gICAgJyRzY29wZScsICckdGltZW91dCcsICckd2luZG93JywgJ2dlbmVyaWNTcnYnLCAnbWVzc2FnZVNydicsICdDT05GSUcnLFxuICAgIGZ1bmN0aW9uICgkc2NvcGUsICR0aW1lb3V0LCAkd2luZG93LCBnZW5lcmljU3J2LCBtZXNzYWdlU3J2LCBjb25maWcpIHtcbiAgICAgICAgJHNjb3BlLnBlclBhZ2UgPSA2O1xuICAgICAgICAkc2NvcGUubm90aWZpY2F0aW9ucyA9IG51bGw7XG4gICAgICAgICRzY29wZS50b3RhbCA9IDA7XG4gICAgICAgICRzY29wZS5jdXJyZW50UGFnZSA9IDA7XG4gICAgICAgICRzY29wZS50aW1lb3V0UHJvbWlzZSA9IG51bGw7XG4gICAgICAgICRzY29wZS5tZXNzYWdlcyA9IG1lc3NhZ2VTcnYuY29sbGVjdCgpO1xuICAgICAgICAkc2NvcGUuc2hvd01lc3NhZ2VJdGVtSWRzID0gY29uZmlnLnNob3dNZXNzYWdlSXRlbUlkcztcbiAgICAgICAgJHNjb3BlLmZpcnN0VGltZSA9IHRydWU7XG5cbiAgICAgICAgJHNjb3BlLmdldFBhZ2VPZk5vdGlmaWNhdGlvbnMgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICB2YXIgdXJsID0gVXJsc1snbWVzc2FnaW5nX2FwaTpnZXRfbm90aWZpY2F0aW9ucyddKCkgK1xuICAgICAgICAgICAgICAgICc/cGFnZT0nICsgJHNjb3BlLmN1cnJlbnRQYWdlICtcbiAgICAgICAgICAgICAgICAnJnBlcl9wYWdlPScgKyAkc2NvcGUucGVyUGFnZTtcbiAgICAgICAgICAgICR0aW1lb3V0LmNhbmNlbCgkc2NvcGUudGltZW91dFByb21pc2UpO1xuICAgICAgICAgICAgZ2VuZXJpY1Nydi5nZW5lcmljR2V0KHVybCkuXG4gICAgICAgICAgICAgICAgdGhlbihmdW5jdGlvbiAoZGF0YSkge1xuICAgICAgICAgICAgICAgICAgICAkc2NvcGUubm90aWZpY2F0aW9ucyA9IGRhdGEubm90aWZpY2F0aW9ucztcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnRvdGFsID0gZGF0YS50b3RhbDtcbiAgICAgICAgICAgICAgICAgICAgaWYgKCRzY29wZS5maXJzdFRpbWUgJiYgJHNjb3BlLnRvdGFsID09PSAwKSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUuZmlyc3RUaW1lID0gZmFsc2U7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUubWVzc2FnZXMuaW5mbyA9IGNvbmZpZy50cmFucy5ub19ub3RpZmljYXRpb25zO1xuICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgfSwgZnVuY3Rpb24gKGVycm9yKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5ub3RpZmljYXRpb25zID0gbnVsbDtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnRvdGFsID0gMDtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLm1lc3NhZ2VzLmRhbmdlciA9IGVycm9yLmVycm9yTWVzc2FnZTtcbiAgICAgICAgICAgICAgICB9KS5cbiAgICAgICAgICAgICAgICBmaW5hbGx5KGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnRpbWVvdXRQcm9taXNlID0gJHRpbWVvdXQoZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgICAgICAgICAgICAgJHNjb3BlLmdldFBhZ2VPZk5vdGlmaWNhdGlvbnMoJHNjb3BlLmN1cnJlbnRQYWdlKTtcbiAgICAgICAgICAgICAgICAgICAgfSwgMTAwMDApO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS5jbGlja05vdGlmaWNhdGlvbiA9IGZ1bmN0aW9uIChub3RpZmljYXRpb24pIHtcbiAgICAgICAgICAgIHZhciB1cmwgPSBVcmxzWydtZXNzYWdpbmdfYXBpOm1hcmtfbm90aWZpY2F0aW9uX3JlYWQnXSgpICsgJz9taWlkPScgKyBub3RpZmljYXRpb24uaWQ7XG4gICAgICAgICAgICBnZW5lcmljU3J2LmdlbmVyaWNHZXQodXJsKS5cbiAgICAgICAgICAgICAgICB0aGVuKGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgJHdpbmRvdy5sb2NhdGlvbi5ocmVmID0gbm90aWZpY2F0aW9uLnVybDtcbiAgICAgICAgICAgICAgICB9LCBmdW5jdGlvbiAoZXJyb3IpIHtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLm1lc3NhZ2VzLmRhbmdlciA9IGVycm9yLmVycm9yTWVzc2FnZTtcbiAgICAgICAgICAgICAgICB9KTtcbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUub3Blbk1vZGFsID0gZnVuY3Rpb24gKCRldmVudCwgdWlkLCBtaWlkKSB7XG4gICAgICAgICAgICAkZXZlbnQuc3RvcFByb3BhZ2F0aW9uKCk7XG4gICAgICAgICAgICAkdGltZW91dC5jYW5jZWwoJHNjb3BlLnRpbWVvdXRQcm9taXNlKTtcbiAgICAgICAgICAgICRzY29wZS5taWlkID0gbWlpZDtcbiAgICAgICAgICAgIGpRdWVyeSgnIycgKyB1aWQpLm1vZGFsKHt9KTtcbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUuY2FuY2VsRGVsZXRlTm90aWZpY2F0aW9uID0gZnVuY3Rpb24gKHVpZCkge1xuICAgICAgICAgICAgdmFyIGVsZW0gPSBqUXVlcnkoJyMnICsgdWlkKTtcbiAgICAgICAgICAgIGVsZW0ub2ZmKCdoaWRkZW4uYnMubW9kYWwnKTtcbiAgICAgICAgICAgIGVsZW0ub24oJ2hpZGRlbi5icy5tb2RhbCcsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAkc2NvcGUuZ2V0UGFnZU9mTm90aWZpY2F0aW9ucygkc2NvcGUuY3VycmVudFBhZ2UpO1xuICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICBlbGVtLm1vZGFsKCdoaWRlJyk7XG4gICAgICAgIH07XG5cbiAgICAgICAgJHNjb3BlLmRlbGV0ZU5vdGlmaWNhdGlvbiA9IGZ1bmN0aW9uICh1aWQpIHtcbiAgICAgICAgICAgIHZhciB1cmwsXG4gICAgICAgICAgICAgICAgZWxlbSA9IGpRdWVyeSgnIycgKyB1aWQpO1xuICAgICAgICAgICAgZWxlbS5vZmYoJ2hpZGRlbi5icy5tb2RhbCcpO1xuICAgICAgICAgICAgZWxlbS5vbignaGlkZGVuLmJzLm1vZGFsJywgZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgICAgIHZhciBtaWlkID0gJHNjb3BlLm1paWQ7XG4gICAgICAgICAgICAgICAgJHNjb3BlLm1paWQgPSBudWxsO1xuICAgICAgICAgICAgICAgIGlmICghbWlpZCkge1xuICAgICAgICAgICAgICAgICAgICByZXR1cm47XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIHVybCA9IFVybHNbJ21lc3NhZ2luZ19hcGk6ZGVsZXRlX21lc3NhZ2VfaXRlbSddKCkgKyAnP21paWQ9JyArIG1paWQ7XG4gICAgICAgICAgICAgICAgZ2VuZXJpY1Nydi5nZW5lcmljR2V0KHVybCkuXG4gICAgICAgICAgICAgICAgICAgIHRoZW4oZnVuY3Rpb24gKGRhdGEpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5tZXNzYWdlcy5zdWNjZXNzID0gZGF0YS5zdWNjZXNzTWVzc2FnZTtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5jdXJyZW50UGFnZSA9IDA7XG4gICAgICAgICAgICAgICAgICAgIH0sIGZ1bmN0aW9uIChlcnJvcikge1xuICAgICAgICAgICAgICAgICAgICAgICAgJHNjb3BlLm1lc3NhZ2VzW2Vycm9yLnR5cGVdID0gZXJyb3IuZXJyb3JNZXNzYWdlO1xuICAgICAgICAgICAgICAgICAgICB9KS5cbiAgICAgICAgICAgICAgICAgICAgZmluYWxseShmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUuZ2V0UGFnZU9mTm90aWZpY2F0aW9ucygkc2NvcGUuY3VycmVudFBhZ2UpO1xuICAgICAgICAgICAgICAgICAgICB9KTtcbiAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgZWxlbS5tb2RhbCgnaGlkZScpO1xuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS4kd2F0Y2goJ2N1cnJlbnRQYWdlJywgZnVuY3Rpb24gKG5ld1ZhbHVlKSB7XG4gICAgICAgICAgICAkc2NvcGUuZ2V0UGFnZU9mTm90aWZpY2F0aW9ucyhuZXdWYWx1ZSk7XG4gICAgICAgIH0pO1xuXG4gICAgICAgICRzY29wZS4kb24oJyRkZXN0cm95JywgZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgJHRpbWVvdXQuY2FuY2VsKCRzY29wZS50aW1lb3V0UHJvbWlzZSk7XG4gICAgICAgIH0pO1xuICAgIH1cbl0pO1xuXG5cblxuLy8gV0VCUEFDSyBGT09URVIgLy9cbi8vIC4vbWVzc2FnaW5nL2pzL25vdGlmaWNhdGlvbnMvY29udHJvbGxlcnMuanMiLCIndXNlIHN0cmljdCc7XG5cbmFuZ3VsYXIubW9kdWxlKCdub3RpZmljYXRpb25zQXBwLnNlcnZpY2VzJywgW10pO1xuXG5cblxuLy8gV0VCUEFDSyBGT09URVIgLy9cbi8vIC4vbWVzc2FnaW5nL2pzL25vdGlmaWNhdGlvbnMvc2VydmljZXMuanMiLCIndXNlIHN0cmljdCc7XG5cbmltcG9ydCAnLi9hbmd1bGFyLWFwcCc7XG5pbXBvcnQgJy4vY29udHJvbGxlcnMnO1xuaW1wb3J0ICcuL3NlcnZpY2VzJztcbmltcG9ydCAnLi4vZ2VuZXJhbC9kaXJlY3RpdmVzJztcbmltcG9ydCAnLi4vZ2VuZXJhbC9maWx0ZXJzJztcbmltcG9ydCAnLi4vZ2VuZXJhbC9zZXJ2aWNlcyc7XG5cblxuXG4vLyBXRUJQQUNLIEZPT1RFUiAvL1xuLy8gLi9tZXNzYWdpbmcvanMvbm90aWZpY2F0aW9ucy9hcHAuanMiXSwic291cmNlUm9vdCI6IiJ9