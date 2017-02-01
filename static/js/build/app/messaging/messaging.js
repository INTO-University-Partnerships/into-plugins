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


var app = angular.module('messagingApp', ['messagingApp.controllers', 'messagingApp.services', 'general.directives', 'general.filters', 'general.services', 'ngRoute', 'ngSanitize']);

app.constant('CONFIG', window.CONFIG);
delete window.CONFIG;

app.config(['$routeProvider', '$httpProvider', function ($routeProvider, $httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
    $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
    $routeProvider.when('/', {
        templateUrl: Urls['messaging_api:partial_base']() + 'route/listMessages',
        controller: 'listMessagesCtrl'
    }).when('/compose', {
        templateUrl: Urls['messaging_api:partial_base']() + 'route/composeMessage',
        controller: 'composeMessageCtrl'
    }).when('/reply/:id', {
        templateUrl: Urls['messaging_api:partial_base']() + 'route/composeMessage',
        controller: 'composeMessageCtrl'
    }).when('/read/:id', {
        templateUrl: Urls['messaging_api:partial_base']() + 'route/readThread',
        controller: 'readThreadCtrl'
    }).otherwise({
        redirectTo: '/'
    });
}]);

/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var app = angular.module('messagingApp.controllers', []);

app.controller('listMessagesCtrl', ['$scope', '$timeout', 'genericSrv', 'messageSrv', 'inboxSortSrv', 'CONFIG', function ($scope, $timeout, genericSrv, messageSrv, inboxSortSrv, config) {
    $scope.perPage = 10;
    $scope.inbox = null;
    $scope.total = 0;
    $scope.currentPage = 0;
    $scope.timeoutPromise = null;
    $scope.messages = messageSrv.collect();
    $scope.sort = inboxSortSrv.toFlags();
    $scope.showMessageItemIds = config.showMessageItemIds;
    $scope.firstTime = true;

    $scope.getPageOfInbox = function () {
        var url = Urls['messaging_api:get_inbox']() + '?page=' + $scope.currentPage + '&per_page=' + $scope.perPage + '&sort_field=' + inboxSortSrv.sortField + '&sort_dir=' + inboxSortSrv.sortDirection;
        $timeout.cancel($scope.timeoutPromise);
        genericSrv.genericGet(url).then(function (data) {
            $scope.inbox = data.messages;
            $scope.total = data.total;
            if ($scope.firstTime && $scope.total === 0) {
                $scope.firstTime = false;
                $scope.messages.info = config.trans.empty_inbox;
            }
        }, function (error) {
            $scope.inbox = null;
            $scope.total = 0;
            $scope.messages.danger = error.errorMessage;
        }).finally(function () {
            $scope.timeoutPromise = $timeout(function () {
                $scope.getPageOfInbox($scope.currentPage);
            }, 10000);
        });
    };

    $scope.setSort = function (field) {
        if (field === inboxSortSrv.sortField) {
            inboxSortSrv.toggleSortDirection();
        } else {
            inboxSortSrv.sortField = field;
        }
        $scope.sort = inboxSortSrv.toFlags();
        $scope.getPageOfInbox($scope.currentPage);
    };

    $scope.$watch('currentPage', function (newValue) {
        $scope.getPageOfInbox(newValue);
    });

    $scope.$on('$destroy', function () {
        $timeout.cancel($scope.timeoutPromise);
    });
}]);

app.controller('composeMessageCtrl', ['$scope', '$timeout', '$location', '$routeParams', 'genericSrv', 'messageSrv', 'CONFIG', function ($scope, $timeout, $location, $routeParams, genericSrv, messageSrv, config) {
    $scope.timeoutPromise = $scope.sendTo = $scope.sendToChoices = null;
    $scope.currentPage = $scope.pageCount = $scope.sendToChoicesCount = 0;
    $scope.pages = [];
    $scope.messages = messageSrv.collect();
    $scope.searching = false;
    $scope.minSearchChars = config.minSearchChars;
    $scope.isSuperUser = config.isSuperUser;
    $scope.replySender = null;
    $scope.replyTo = $scope.replyBody = '';
    $scope.newMessage = false;
    $scope.msg = {
        recipients: [],
        targetAll: false,
        subject: '',
        body: '',
        miid: $routeParams.id ? $routeParams.id : 0
    };

    if ($scope.msg.miid) {
        var url = Urls['messaging_api:get_reply_info']() + '?miid=' + $scope.msg.miid;
        genericSrv.genericGet(url).then(function (data) {
            $scope.msg.recipients = data.recipients;
            $scope.msg.subject = data.subject;
            $scope.replySender = data.recipients[0];
            $scope.replyTo = data.sender;
            $scope.replyBody = data.body;
        }, function (error) {
            messageSrv.messages[error.type] = error.errorMessage;
            $location.path('/read/' + $scope.msg.miid);
        });
    } else {
        $scope.newMessage = true;
    }

    $scope.sendToKeyUp = function () {
        $timeout.cancel($scope.timeoutPromise);
        $scope.timeoutPromise = $timeout(function () {
            $scope.searchRecipient();
        }, 500);
    };

    $scope.searchRecipient = function () {
        var d;
        if (!$scope.sendTo) {
            return;
        }
        if ($scope.sendTo.length >= $scope.minSearchChars) {
            $scope.searching = true;
            d = {
                q: $scope.sendTo,
                recipients: $scope.msg.recipients,
                page: $scope.currentPage
            };
            genericSrv.genericPost(Urls['messaging_api:search_recipient'](), d).then(function (data) {
                $scope.addChoices(data);
            }, function (error) {
                $scope.messages.danger = error.errorMessage;
                $scope.sendToChoices = null;
            }).finally(function () {
                $scope.searching = false;
            });
        } else if ($scope.sendTo.length < $scope.minSearchChars) {
            $scope.sendToChoices = null;
        }
    };

    $scope.addRecipient = function (choice) {
        $scope.msg.recipients.push(choice);
        $scope.removeChoice(choice);
        $scope.searchRecipient();
    };

    $scope.removeRecipient = function (recipient) {
        $scope.msg.recipients = $scope.msg.recipients.filter(function (value) {
            return value.id !== recipient.id;
        });
        $scope.searchRecipient();
    };

    $scope.addChoices = function (data) {
        var j;
        $scope.sendToChoices = data.searchResults.filter(function (value) {
            var i, count;
            for (i = 0, count = $scope.msg.recipients.length; i < count; ++i) {
                if ($scope.msg.recipients[i].id === value.id) {
                    return false;
                }
            }
            return true;
        });
        $scope.sendToChoicesCount = data.count;
        $scope.pageCount = Math.ceil(data.count / data.perPage);
        $scope.pages = [];
        for (j = 1; j <= $scope.pageCount; ++j) {
            $scope.pages.push(j);
        }
    };

    $scope.removeChoice = function (choice) {
        $scope.sendToChoices = $scope.sendToChoices.filter(function (value) {
            return value.id !== choice.id;
        });
    };

    $scope.targetAllChanged = function () {
        if ($scope.msg && $scope.msg.targetAll) {
            $scope.sendTo = '';
            $scope.sendToChoices = [];
            $scope.msg.recipients = [];
        }
    };

    $scope.sendMessage = function () {
        genericSrv.genericPost(Urls['messaging_api:send_message'](), $scope.msg).then(function (data) {
            messageSrv.messages.success = data.successMessage;
            if ($scope.msg.miid) {
                $location.path('/read/' + $scope.msg.miid);
            } else {
                $location.path('/');
            }
        }, function (error) {
            messageSrv.messages[error.type] = error.errorMessage;
            $location.path('/');
        });
    };

    $scope.isSender = function (recipient) {
        if (!$scope.msg.miid || !$scope.replySender) {
            return false;
        }
        return recipient.id === $scope.replySender.id;
    };

    $scope.$on('$destroy', function () {
        $timeout.cancel($scope.timeoutPromise);
    });

    $scope.prevPage = function () {
        if ($scope.currentPage > 0) {
            --$scope.currentPage;
            $scope.searchRecipient();
        }
    };

    $scope.prevPageDisabled = function () {
        var disabled = $scope.currentPage === 0 ? 'disabled' : '';
        return disabled;
    };

    $scope.nextPage = function () {
        if ($scope.currentPage < $scope.pageCount - 1) {
            $scope.currentPage++;
            $scope.searchRecipient();
        }
    };

    $scope.nextPageDisabled = function () {
        var disabled = $scope.currentPage === $scope.pageCount - 1 ? 'disabled' : '';
        return disabled;
    };

    $scope.pageDisabled = function (n) {
        return $scope.currentPage === n;
    };

    $scope.gotoPage = function (n) {
        $scope.currentPage = n;
        $scope.searchRecipient();
    };
}]);

app.controller('readThreadCtrl', ['$scope', '$timeout', '$location', '$routeParams', 'genericSrv', 'messageSrv', 'CONFIG', function ($scope, $timeout, $location, $routeParams, genericSrv, messageSrv, config) {
    $scope.messageItemId = $routeParams.id;
    $scope.messages = messageSrv.collect();
    $scope.timeoutPromise = null;
    $scope.showMessageItemIds = config.showMessageItemIds;
    $scope.unread = [];

    $scope.getThread = function () {
        var url = Urls['messaging_api:get_thread']() + '?miid=' + $routeParams.id;
        $timeout.cancel($scope.timeoutPromise);
        genericSrv.genericGet(url).then(function (data) {
            $scope.subject = data.subject;
            $scope.thread = data.messages;
            $scope.storeUnread();
            $scope.total = data.total;
            if ($scope.total === 0) {
                $scope.messages.info = config.trans.empty_thread;
            }
            $scope.timeoutPromise = $timeout(function () {
                $scope.getThread();
            }, 10000);
        }, function (error) {
            messageSrv.messages[error.type] = error.errorMessage;
            $location.path('/');
        });
    };

    $scope.getThread();

    $scope.storeUnread = function () {
        var i, count;
        for (i = 0, count = $scope.thread.length; i < count; ++i) {
            if (!$scope.thread[i].read && $scope.unread.indexOf($scope.thread[i].id) === -1) {
                $scope.unread.push($scope.thread[i].id);
            }
        }
    };

    $scope.isRead = function (email) {
        return $scope.unread.indexOf(email.id) === -1;
    };

    $scope.openModal = function (uid, miid) {
        $timeout.cancel($scope.timeoutPromise);
        $scope.miid = miid;
        jQuery('#' + uid).modal({});
    };

    $scope.cancelDeleteMessage = function (uid) {
        var elem = jQuery('#' + uid);
        elem.off('hidden.bs.modal');
        elem.on('hidden.bs.modal', function () {
            $scope.getThread();
        });
        elem.modal('hide');
    };

    $scope.deleteOne = function (uid) {
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
            }, function (error) {
                $scope.messages[error.type] = error.errorMessage;
            }).finally(function () {
                $scope.getThread();
            });
        });
        elem.modal('hide');
    };

    $scope.deleteAll = function (uid) {
        var url,
            elem = jQuery('#' + uid);
        elem.off('hidden.bs.modal');
        elem.on('hidden.bs.modal', function () {
            if (!$scope.total) {
                return;
            }
            url = Urls['messaging_api:delete_message_item']() + '?miid=' + $scope.thread[0].id + '&thread';
            genericSrv.genericGet(url).then(function (data) {
                messageSrv.messages.success = data.successMessage;
                $location.path('/');
            }, function (error) {
                $scope.messages[error.type] = error.errorMessage;
                $scope.getThread();
            });
        });
        elem.modal('hide');
    };

    $scope.$on('$destroy', function () {
        $timeout.cancel($scope.timeoutPromise);
    });
}]);

/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var app = angular.module('messagingApp.services', []);

app.service('inboxSortSrv', function () {
    this.sortField = 'date';
    this.sortDirection = 'desc';

    this.toFlags = function () {
        return {
            sender: this.sortField === 'sender',
            senderAsc: this.sortField === 'sender' && this.sortDirection === 'asc',
            senderDesc: this.sortField === 'sender' && this.sortDirection === 'desc',
            date: this.sortField === 'date',
            dateAsc: this.sortField === 'date' && this.sortDirection === 'asc',
            dateDesc: this.sortField === 'date' && this.sortDirection === 'desc'
        };
    };

    this.toggleSortDirection = function () {
        if (this.sortDirection === 'asc') {
            this.sortDirection = 'desc';
        } else {
            this.sortDirection = 'asc';
        }
    };
});

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
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vd2VicGFjay9ib290c3RyYXAgZjEzNmExMTYyMWY2MzI1MmZmMjgiLCJ3ZWJwYWNrOi8vLy4vbWVzc2FnaW5nL2pzL2dlbmVyYWwvZGlyZWN0aXZlcy5qcyIsIndlYnBhY2s6Ly8vLi9tZXNzYWdpbmcvanMvZ2VuZXJhbC9maWx0ZXJzLmpzIiwid2VicGFjazovLy8uL21lc3NhZ2luZy9qcy9nZW5lcmFsL3NlcnZpY2VzLmpzIiwid2VicGFjazovLy8uL21lc3NhZ2luZy9qcy9tZXNzYWdpbmcvYW5ndWxhci1hcHAuanMiLCJ3ZWJwYWNrOi8vLy4vbWVzc2FnaW5nL2pzL21lc3NhZ2luZy9jb250cm9sbGVycy5qcyIsIndlYnBhY2s6Ly8vLi9tZXNzYWdpbmcvanMvbWVzc2FnaW5nL3NlcnZpY2VzLmpzIiwid2VicGFjazovLy8uL21lc3NhZ2luZy9qcy9tZXNzYWdpbmcvYXBwLmpzIl0sIm5hbWVzIjpbImFwcCIsImFuZ3VsYXIiLCJtb2R1bGUiLCJkaXJlY3RpdmUiLCJyZXN0cmljdCIsInNjb3BlIiwibWVzc2FnZXMiLCJ0ZW1wbGF0ZVVybCIsIlVybHMiLCJsaW5rIiwiZWxlbWVudCIsImZpbmQiLCJiaW5kIiwiJGFwcGx5IiwiY2xhc3MiLCJtc2ciLCJjb250cm9sbGVyIiwiJHNjb3BlIiwic2V0TWVzc2FnZSIsInN0YXR1cyIsImZvckVhY2giLCIkd2F0Y2giLCJ1aWQiLCJ0aXRsZSIsImJvZHkiLCJjYW5jZWwiLCJjb25maXJtIiwicGVyUGFnZSIsImN1cnJlbnRQYWdlIiwidG90YWwiLCJmZXRjaFBhZ2UiLCJwYWdlQ291bnQiLCJwYWdlcyIsImNhbGN1bGF0ZVBhZ2VDb3VudCIsIk1hdGgiLCJjZWlsIiwiY2FsY3VsYXRlUGFnZXMiLCJmcm9tIiwidG8iLCJpIiwicHVzaCIsInByZXZQYWdlIiwicHJldlBhZ2VEaXNhYmxlZCIsImRpc2FibGVkIiwibmV4dFBhZ2UiLCJuZXh0UGFnZURpc2FibGVkIiwicGFnZURpc2FibGVkIiwibiIsImdvdG9QYWdlIiwiZmlsdGVyIiwiJHNjZSIsInVudHJ1c3RlZCIsInRydXN0QXNIdG1sIiwic2VydmljZSIsIiRodHRwIiwiJHEiLCJnZW5lcmljR2V0IiwidXJsIiwiX2dlbmVyaWNWZXJiIiwiZ2VuZXJpY1Bvc3QiLCJkYXRhIiwidmVyYiIsImRlZmVycmVkIiwiZGVmZXIiLCJzdWNjZXNzIiwiZCIsInJlc29sdmUiLCJlcnJvciIsInJlamVjdCIsInByb21pc2UiLCJjb2xsZWN0IiwicmV0dmFsIiwiY29weSIsImNvbnN0YW50Iiwid2luZG93IiwiQ09ORklHIiwiY29uZmlnIiwiJHJvdXRlUHJvdmlkZXIiLCIkaHR0cFByb3ZpZGVyIiwiZGVmYXVsdHMiLCJ4c3JmQ29va2llTmFtZSIsInhzcmZIZWFkZXJOYW1lIiwiaGVhZGVycyIsImNvbW1vbiIsIndoZW4iLCJvdGhlcndpc2UiLCJyZWRpcmVjdFRvIiwiJHRpbWVvdXQiLCJnZW5lcmljU3J2IiwibWVzc2FnZVNydiIsImluYm94U29ydFNydiIsImluYm94IiwidGltZW91dFByb21pc2UiLCJzb3J0IiwidG9GbGFncyIsInNob3dNZXNzYWdlSXRlbUlkcyIsImZpcnN0VGltZSIsImdldFBhZ2VPZkluYm94Iiwic29ydEZpZWxkIiwic29ydERpcmVjdGlvbiIsInRoZW4iLCJpbmZvIiwidHJhbnMiLCJlbXB0eV9pbmJveCIsImRhbmdlciIsImVycm9yTWVzc2FnZSIsImZpbmFsbHkiLCJzZXRTb3J0IiwiZmllbGQiLCJ0b2dnbGVTb3J0RGlyZWN0aW9uIiwibmV3VmFsdWUiLCIkb24iLCIkbG9jYXRpb24iLCIkcm91dGVQYXJhbXMiLCJzZW5kVG8iLCJzZW5kVG9DaG9pY2VzIiwic2VuZFRvQ2hvaWNlc0NvdW50Iiwic2VhcmNoaW5nIiwibWluU2VhcmNoQ2hhcnMiLCJpc1N1cGVyVXNlciIsInJlcGx5U2VuZGVyIiwicmVwbHlUbyIsInJlcGx5Qm9keSIsIm5ld01lc3NhZ2UiLCJyZWNpcGllbnRzIiwidGFyZ2V0QWxsIiwic3ViamVjdCIsIm1paWQiLCJpZCIsInNlbmRlciIsInR5cGUiLCJwYXRoIiwic2VuZFRvS2V5VXAiLCJzZWFyY2hSZWNpcGllbnQiLCJsZW5ndGgiLCJxIiwicGFnZSIsImFkZENob2ljZXMiLCJhZGRSZWNpcGllbnQiLCJjaG9pY2UiLCJyZW1vdmVDaG9pY2UiLCJyZW1vdmVSZWNpcGllbnQiLCJyZWNpcGllbnQiLCJ2YWx1ZSIsImoiLCJzZWFyY2hSZXN1bHRzIiwiY291bnQiLCJ0YXJnZXRBbGxDaGFuZ2VkIiwic2VuZE1lc3NhZ2UiLCJzdWNjZXNzTWVzc2FnZSIsImlzU2VuZGVyIiwibWVzc2FnZUl0ZW1JZCIsInVucmVhZCIsImdldFRocmVhZCIsInRocmVhZCIsInN0b3JlVW5yZWFkIiwiZW1wdHlfdGhyZWFkIiwicmVhZCIsImluZGV4T2YiLCJpc1JlYWQiLCJlbWFpbCIsIm9wZW5Nb2RhbCIsImpRdWVyeSIsIm1vZGFsIiwiY2FuY2VsRGVsZXRlTWVzc2FnZSIsImVsZW0iLCJvZmYiLCJvbiIsImRlbGV0ZU9uZSIsImRlbGV0ZUFsbCIsInNlbmRlckFzYyIsInNlbmRlckRlc2MiLCJkYXRlIiwiZGF0ZUFzYyIsImRhdGVEZXNjIl0sIm1hcHBpbmdzIjoiO0FBQUE7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7O0FBR0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0EsbURBQTJDLGNBQWM7O0FBRXpEO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsYUFBSztBQUNMO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsbUNBQTJCLDBCQUEwQixFQUFFO0FBQ3ZELHlDQUFpQyxlQUFlO0FBQ2hEO0FBQ0E7QUFDQTs7QUFFQTtBQUNBLDhEQUFzRCwrREFBK0Q7O0FBRXJIO0FBQ0E7O0FBRUE7QUFDQTs7Ozs7Ozs7QUNoRUE7O0FBRUEsSUFBSUEsTUFB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NkIsS0FBS0MsYUFBTCxLQUF1QixLQUwxRDtBQU1IMkUsc0JBQVUsS0FBSzVFLFNBQUwsS0FBbUIsTUFBbkIsSUFBNkIsS0FBS0MsYUFBTCxLQUF1QjtBQU4zRCxTQUFQO0FBUUgsS0FURDs7QUFXQSxTQUFLVSxtQkFBTCxHQUEyQixZQUFZO0FBQ25DLFlBQUksS0FBS1YsYUFBTCxLQUF1QixLQUEzQixFQUFrQztBQUM5QixpQkFBS0EsYUFBTCxHQUFxQixNQUFyQjtBQUNILFNBRkQsTUFFTztBQUNILGlCQUFLQSxhQUFMLEdBQXFCLEtBQXJCO0FBQ0g7QUFDSixLQU5EO0FBT0gsQ0F0QkQsRTs7Ozs7OztBQ0pBOztBQUVBOztBQUNBOztBQUNBOztBQUNBOztBQUNBOztBQUNBLHVCIiwiZmlsZSI6Im1lc3NhZ2luZy5qcyIsInNvdXJjZXNDb250ZW50IjpbIiBcdC8vIFRoZSBtb2R1bGUgY2FjaGVcbiBcdHZhciBpbnN0YWxsZWRNb2R1bGVzID0ge307XG5cbiBcdC8vIFRoZSByZXF1aXJlIGZ1bmN0aW9uXG4gXHRmdW5jdGlvbiBfX3dlYnBhY2tfcmVxdWlyZV9fKG1vZHVsZUlkKSB7XG5cbiBcdFx0Ly8gQ2hlY2sgaWYgbW9kdWxlIGlzIGluIGNhY2hlXG4gXHRcdGlmKGluc3RhbGxlZE1vZHVsZXNbbW9kdWxlSWRdKVxuIFx0XHRcdHJldHVybiBpbnN0YWxsZWRNb2R1bGVzW21vZHVsZUlkXS5leHBvcnRzO1xuXG4gXHRcdC8vIENyZWF0ZSBhIG5ldyBtb2R1bGUgKGFuZCBwdXQgaXQgaW50byB0aGUgY2FjaGUpXG4gXHRcdHZhciBtb2R1bGUgPSBpbnN0YWxsZWRNb2R1bGVzW21vZHVsZUlkXSA9IHtcbiBcdFx0XHRpOiBtb2R1bGVJZCxcbiBcdFx0XHRsOiBmYWxzZSxcbiBcdFx0XHRleHBvcnRzOiB7fVxuIFx0XHR9O1xuXG4gXHRcdC8vIEV4ZWN1dGUgdGhlIG1vZHVsZSBmdW5jdGlvblxuIFx0XHRtb2R1bGVzW21vZHVsZUlkXS5jYWxsKG1vZHVsZS5leHBvcnRzLCBtb2R1bGUsIG1vZHVsZS5leHBvcnRzLCBfX3dlYnBhY2tfcmVxdWlyZV9fKTtcblxuIFx0XHQvLyBGbGFnIHRoZSBtb2R1bGUgYXMgbG9hZGVkXG4gXHRcdG1vZHVsZS5sID0gdHJ1ZTtcblxuIFx0XHQvLyBSZXR1cm4gdGhlIGV4cG9ydHMgb2YgdGhlIG1vZHVsZVxuIFx0XHRyZXR1cm4gbW9kdWxlLmV4cG9ydHM7XG4gXHR9XG5cblxuIFx0Ly8gZXhwb3NlIHRoZSBtb2R1bGVzIG9iamVjdCAoX193ZWJwYWNrX21vZHVsZXNfXylcbiBcdF9fd2VicGFja19yZXF1aXJlX18ubSA9IG1vZHVsZXM7XG5cbiBcdC8vIGV4cG9zZSB0aGUgbW9kdWxlIGNhY2hlXG4gXHRfX3dlYnBhY2tfcmVxdWlyZV9fLmMgPSBpbnN0YWxsZWRNb2R1bGVzO1xuXG4gXHQvLyBpZGVudGl0eSBmdW5jdGlvbiBmb3IgY2FsbGluZyBoYXJtb255IGltcG9ydHMgd2l0aCB0aGUgY29ycmVjdCBjb250ZXh0XG4gXHRfX3dlYnBhY2tfcmVxdWlyZV9fLmkgPSBmdW5jdGlvbih2YWx1ZSkgeyByZXR1cm4gdmFsdWU7IH07XG5cbiBcdC8vIGRlZmluZSBnZXR0ZXIgZnVuY3Rpb24gZm9yIGhhcm1vbnkgZXhwb3J0c1xuIFx0X193ZWJwYWNrX3JlcXVpcmVfXy5kID0gZnVuY3Rpb24oZXhwb3J0cywgbmFtZSwgZ2V0dGVyKSB7XG4gXHRcdGlmKCFfX3dlYnBhY2tfcmVxdWlyZV9fLm8oZXhwb3J0cywgbmFtZSkpIHtcbiBcdFx0XHRPYmplY3QuZGVmaW5lUHJvcGVydHkoZXhwb3J0cywgbmFtZSwge1xuIFx0XHRcdFx0Y29uZmlndXJhYmxlOiBmYWxzZSxcbiBcdFx0XHRcdGVudW1lcmFibGU6IHRydWUsXG4gXHRcdFx0XHRnZXQ6IGdldHRlclxuIFx0XHRcdH0pO1xuIFx0XHR9XG4gXHR9O1xuXG4gXHQvLyBnZXREZWZhdWx0RXhwb3J0IGZ1bmN0aW9uIGZvciBjb21wYXRpYmlsaXR5IHdpdGggbm9uLWhhcm1vbnkgbW9kdWxlc1xuIFx0X193ZWJwYWNrX3JlcXVpcmVfXy5uID0gZnVuY3Rpb24obW9kdWxlKSB7XG4gXHRcdHZhciBnZXR0ZXIgPSBtb2R1bGUgJiYgbW9kdWxlLl9fZXNNb2R1bGUgP1xuIFx0XHRcdGZ1bmN0aW9uIGdldERlZmF1bHQoKSB7IHJldHVybiBtb2R1bGVbJ2RlZmF1bHQnXTsgfSA6XG4gXHRcdFx0ZnVuY3Rpb24gZ2V0TW9kdWxlRXhwb3J0cygpIHsgcmV0dXJuIG1vZHVsZTsgfTtcbiBcdFx0X193ZWJwYWNrX3JlcXVpcmVfXy5kKGdldHRlciwgJ2EnLCBnZXR0ZXIpO1xuIFx0XHRyZXR1cm4gZ2V0dGVyO1xuIFx0fTtcblxuIFx0Ly8gT2JqZWN0LnByb3RvdHlwZS5oYXNPd25Qcm9wZXJ0eS5jYWxsXG4gXHRfX3dlYnBhY2tfcmVxdWlyZV9fLm8gPSBmdW5jdGlvbihvYmplY3QsIHByb3BlcnR5KSB7IHJldHVybiBPYmplY3QucHJvdG90eXBlLmhhc093blByb3BlcnR5LmNhbGwob2JqZWN0LCBwcm9wZXJ0eSk7IH07XG5cbiBcdC8vIF9fd2VicGFja19wdWJsaWNfcGF0aF9fXG4gXHRfX3dlYnBhY2tfcmVxdWlyZV9fLnAgPSBcIlwiO1xuXG4gXHQvLyBMb2FkIGVudHJ5IG1vZHVsZSBhbmQgcmV0dXJuIGV4cG9ydHNcbiBcdHJldHVybiBfX3dlYnBhY2tfcmVxdWlyZV9fKF9fd2VicGFja19yZXF1aXJlX18ucyA9IDYpO1xuXG5cblxuLy8gV0VCUEFDSyBGT09URVIgLy9cbi8vIHdlYnBhY2svYm9vdHN0cmFwIGYxMzZhMTE2MjFmNjMyNTJmZjI4IiwiJ3VzZSBzdHJpY3QnO1xuXG52YXIgYXBwID0gYW5ndWxhci5tb2R1bGUoJ2dlbmVyYWwuZGlyZWN0aXZlcycsIFtdKTtcblxuYXBwLmRpcmVjdGl2ZSgnYWxlcnRzJywgW1xuICAgIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgcmV0dXJuIHtcbiAgICAgICAgICAgIHJlc3RyaWN0OiAnRScsXG4gICAgICAgICAgICBzY29wZToge1xuICAgICAgICAgICAgICAgIG1lc3NhZ2VzOiAnPSdcbiAgICAgICAgICAgIH0sXG4gICAgICAgICAgICB0ZW1wbGF0ZVVybDogVXJsc1snbWVzc2FnaW5nX2FwaTpwYXJ0aWFsX2Jhc2UnXSgpICsgJ2RpcmVjdGl2ZS9hbGVydHMnLFxuICAgICAgICAgICAgbGluazogZnVuY3Rpb24gKHNjb3BlLCBlbGVtZW50KSB7XG4gICAgICAgICAgICAgICAgZWxlbWVudC5maW5kKCdidXR0b24nKS5iaW5kKCdjbGljaycsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgc2NvcGUuJGFwcGx5KGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgIHNjb3BlLmNsYXNzID0gJyc7XG4gICAgICAgICAgICAgICAgICAgICAgICBzY29wZS5tc2cgPSAnJztcbiAgICAgICAgICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICB9LFxuICAgICAgICAgICAgY29udHJvbGxlcjogWyckc2NvcGUnLCBmdW5jdGlvbiAoJHNjb3BlKSB7XG4gICAgICAgICAgICAgICAgJHNjb3BlLmNsYXNzID0gJyc7XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUuc2V0TWVzc2FnZSA9IGZ1bmN0aW9uIChzdGF0dXMpIHtcbiAgICAgICAgICAgICAgICAgICAgaWYgKCRzY29wZS5tZXNzYWdlc1tzdGF0dXNdKSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUubXNnID0gJHNjb3BlLm1lc3NhZ2VzW3N0YXR1c107XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUuY2xhc3MgPSAnYWxlcnQtJyArIHN0YXR1cztcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5tZXNzYWdlcyA9IHt9O1xuICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgfTtcblxuICAgICAgICAgICAgICAgIGFuZ3VsYXIuZm9yRWFjaChbJ3N1Y2Nlc3MnLCAnZGFuZ2VyJywgJ3dhcm5pbmcnLCAnaW5mbyddLCBmdW5jdGlvbiAoc3RhdHVzKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS4kd2F0Y2goJ21lc3NhZ2VzLicgKyBzdGF0dXMsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5zZXRNZXNzYWdlKHN0YXR1cyk7XG4gICAgICAgICAgICAgICAgICAgIH0sIHRydWUpO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgfV1cbiAgICAgICAgfTtcbiAgICB9XG5dKTtcblxuYXBwLmRpcmVjdGl2ZSgnbW9kYWxDb25maXJtJywgW1xuICAgIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgcmV0dXJuIHtcbiAgICAgICAgICAgIHJlc3RyaWN0OiAnRScsXG4gICAgICAgICAgICBzY29wZToge1xuICAgICAgICAgICAgICAgIHVpZDogJ0AnLFxuICAgICAgICAgICAgICAgIHRpdGxlOiAnQCcsXG4gICAgICAgICAgICAgICAgYm9keTogJ0AnLFxuICAgICAgICAgICAgICAgIGNhbmNlbDogJyYnLFxuICAgICAgICAgICAgICAgIGNvbmZpcm06ICcmJ1xuICAgICAgICAgICAgfSxcbiAgICAgICAgICAgIHRlbXBsYXRlVXJsOiBVcmxzWydtZXNzYWdpbmdfYXBpOnBhcnRpYWxfYmFzZSddKCkgKyAnZGlyZWN0aXZlL21vZGFsQ29uZmlybSdcbiAgICAgICAgfTtcbiAgICB9XG5dKTtcblxuYXBwLmRpcmVjdGl2ZSgncGFnaW5hdGlvbicsIFtcbiAgICBmdW5jdGlvbiAoKSB7XG4gICAgICAgIHJldHVybiB7XG4gICAgICAgICAgICByZXN0cmljdDogJ0UnLFxuICAgICAgICAgICAgc2NvcGU6IHtcbiAgICAgICAgICAgICAgICBwZXJQYWdlOiAnQCcsXG4gICAgICAgICAgICAgICAgY3VycmVudFBhZ2U6ICc9JyxcbiAgICAgICAgICAgICAgICB0b3RhbDogJz0nLFxuICAgICAgICAgICAgICAgIGZldGNoUGFnZTogJyYnXG4gICAgICAgICAgICB9LFxuICAgICAgICAgICAgdGVtcGxhdGVVcmw6IFVybHNbJ21lc3NhZ2luZ19hcGk6cGFydGlhbF9iYXNlJ10oKSArICdkaXJlY3RpdmUvcGFnaW5hdGlvbicsXG4gICAgICAgICAgICBjb250cm9sbGVyOiBbJyRzY29wZScsIGZ1bmN0aW9uICgkc2NvcGUpIHtcbiAgICAgICAgICAgICAgICAkc2NvcGUuY3VycmVudFBhZ2UgPSAwO1xuICAgICAgICAgICAgICAgICRzY29wZS5wYWdlQ291bnQgPSAwO1xuICAgICAgICAgICAgICAgICRzY29wZS5wYWdlcyA9IFtdO1xuXG4gICAgICAgICAgICAgICAgJHNjb3BlLmNhbGN1bGF0ZVBhZ2VDb3VudCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgaWYgKCRzY29wZS50b3RhbCA9PT0gMCkge1xuICAgICAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnBhZ2VDb3VudCA9IDE7XG4gICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUucGFnZUNvdW50ID0gTWF0aC5jZWlsKCRzY29wZS50b3RhbCAvICRzY29wZS5wZXJQYWdlKTtcbiAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUuY2FsY3VsYXRlUGFnZXMgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgIHZhciBmcm9tLCB0bywgaTtcbiAgICAgICAgICAgICAgICAgICAgZnJvbSA9IDE7XG4gICAgICAgICAgICAgICAgICAgIHRvID0gJHNjb3BlLnBhZ2VDb3VudDtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnBhZ2VzID0gW107XG4gICAgICAgICAgICAgICAgICAgIGZvciAoaSA9IGZyb207IGkgPD0gdG87ICsraSkge1xuICAgICAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnBhZ2VzLnB1c2goaSk7XG4gICAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICB9O1xuXG4gICAgICAgICAgICAgICAgJHNjb3BlLiR3YXRjaCgnY3VycmVudFBhZ2UnLCBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5jYWxjdWxhdGVQYWdlcygpO1xuICAgICAgICAgICAgICAgIH0pO1xuXG4gICAgICAgICAgICAgICAgJHNjb3BlLiR3YXRjaCgndG90YWwnLCBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5jYWxjdWxhdGVQYWdlQ291bnQoKTtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLmNhbGN1bGF0ZVBhZ2VzKCk7XG4gICAgICAgICAgICAgICAgfSk7XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUucHJldlBhZ2UgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgIGlmICgkc2NvcGUuY3VycmVudFBhZ2UgPiAwKSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAtLSRzY29wZS5jdXJyZW50UGFnZTtcbiAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUucHJldlBhZ2VEaXNhYmxlZCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgdmFyIGRpc2FibGVkID0gJHNjb3BlLmN1cnJlbnRQYWdlID09PSAwID8gJ2Rpc2FibGVkJyA6ICcnO1xuICAgICAgICAgICAgICAgICAgICByZXR1cm4gZGlzYWJsZWQ7XG4gICAgICAgICAgICAgICAgfTtcblxuICAgICAgICAgICAgICAgICRzY29wZS5uZXh0UGFnZSA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgaWYgKCRzY29wZS5jdXJyZW50UGFnZSA8ICRzY29wZS5wYWdlQ291bnQgLSAxKSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUuY3VycmVudFBhZ2UrKztcbiAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUubmV4dFBhZ2VEaXNhYmxlZCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgdmFyIGRpc2FibGVkID0gJHNjb3BlLmN1cnJlbnRQYWdlID09PSAkc2NvcGUucGFnZUNvdW50IC0gMSA/ICdkaXNhYmxlZCcgOiAnJztcbiAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGRpc2FibGVkO1xuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICAkc2NvcGUucGFnZURpc2FibGVkID0gZnVuY3Rpb24gKG4pIHtcbiAgICAgICAgICAgICAgICAgICAgdmFyIGRpc2FibGVkID0gJHNjb3BlLmN1cnJlbnRQYWdlID09PSBuO1xuICAgICAgICAgICAgICAgICAgICByZXR1cm4gZGlzYWJsZWQ7XG4gICAgICAgICAgICAgICAgfTtcblxuICAgICAgICAgICAgICAgICRzY29wZS5nb3RvUGFnZSA9IGZ1bmN0aW9uIChuKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5jdXJyZW50UGFnZSA9IG47XG4gICAgICAgICAgICAgICAgfTtcbiAgICAgICAgICAgIH1dXG4gICAgICAgIH07XG4gICAgfVxuXSk7XG5cblxuXG4vLyBXRUJQQUNLIEZPT1RFUiAvL1xuLy8gLi9tZXNzYWdpbmcvanMvZ2VuZXJhbC9kaXJlY3RpdmVzLmpzIiwiJ3VzZSBzdHJpY3QnO1xuXG52YXIgYXBwID0gYW5ndWxhci5tb2R1bGUoJ2dlbmVyYWwuZmlsdGVycycsIFtdKTtcblxuYXBwLmZpbHRlcigncmF3JywgW1xuICAgICckc2NlJyxcbiAgICBmdW5jdGlvbiAoJHNjZSkge1xuICAgICAgICByZXR1cm4gZnVuY3Rpb24gKHVudHJ1c3RlZCkge1xuICAgICAgICAgICAgcmV0dXJuICRzY2UudHJ1c3RBc0h0bWwodW50cnVzdGVkKTtcbiAgICAgICAgfTtcbiAgICB9XG5dKTtcblxuXG5cbi8vIFdFQlBBQ0sgRk9PVEVSIC8vXG4vLyAuL21lc3NhZ2luZy9qcy9nZW5lcmFsL2ZpbHRlcnMuanMiLCIndXNlIHN0cmljdCc7XG5cbnZhciBhcHAgPSBhbmd1bGFyLm1vZHVsZSgnZ2VuZXJhbC5zZXJ2aWNlcycsIFtdKTtcblxuYXBwLnNlcnZpY2UoJ2dlbmVyaWNTcnYnLCBbXG4gICAgJyRodHRwJywgJyRxJyxcbiAgICBmdW5jdGlvbiAoJGh0dHAsICRxKSB7XG4gICAgICAgIHRoaXMuZ2VuZXJpY0dldCA9IGZ1bmN0aW9uICh1cmwpIHtcbiAgICAgICAgICAgIHJldHVybiB0aGlzLl9nZW5lcmljVmVyYignZ2V0JywgdXJsLCB7fSk7XG4gICAgICAgIH07XG5cbiAgICAgICAgdGhpcy5nZW5lcmljUG9zdCA9IGZ1bmN0aW9uICh1cmwsIGRhdGEpIHtcbiAgICAgICAgICAgIHJldHVybiB0aGlzLl9nZW5lcmljVmVyYigncG9zdCcsIHVybCwgZGF0YSk7XG4gICAgICAgIH07XG5cbiAgICAgICAgdGhpcy5fZ2VuZXJpY1ZlcmIgPSBmdW5jdGlvbiAodmVyYiwgdXJsLCBkYXRhKSB7XG4gICAgICAgICAgICB2YXIgZGVmZXJyZWQgPSAkcS5kZWZlcigpO1xuICAgICAgICAgICAgJGh0dHBbdmVyYl0odXJsLCBkYXRhKS5cbiAgICAgICAgICAgICAgICBzdWNjZXNzKGZ1bmN0aW9uIChkKSB7XG4gICAgICAgICAgICAgICAgICAgIGRlZmVycmVkLnJlc29sdmUoZCk7XG4gICAgICAgICAgICAgICAgfSkuXG4gICAgICAgICAgICAgICAgZXJyb3IoZnVuY3Rpb24gKGQpIHtcbiAgICAgICAgICAgICAgICAgICAgZGVmZXJyZWQucmVqZWN0KGQpO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgcmV0dXJuIGRlZmVycmVkLnByb21pc2U7XG4gICAgICAgIH07XG4gICAgfVxuXSk7XG5cbmFwcC5zZXJ2aWNlKCdtZXNzYWdlU3J2JywgZnVuY3Rpb24gKCkge1xuICAgIHRoaXMubWVzc2FnZXMgPSB7fTtcbiAgICB0aGlzLmNvbGxlY3QgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgIHZhciByZXR2YWwgPSB7fTtcbiAgICAgICAgYW5ndWxhci5jb3B5KHRoaXMubWVzc2FnZXMsIHJldHZhbCk7XG4gICAgICAgIHRoaXMubWVzc2FnZXMgPSB7fTtcbiAgICAgICAgcmV0dXJuIHJldHZhbDtcbiAgICB9O1xufSk7XG5cblxuXG4vLyBXRUJQQUNLIEZPT1RFUiAvL1xuLy8gLi9tZXNzYWdpbmcvanMvZ2VuZXJhbC9zZXJ2aWNlcy5qcyIsIid1c2Ugc3RyaWN0JztcblxudmFyIGFwcCA9IGFuZ3VsYXIubW9kdWxlKCdtZXNzYWdpbmdBcHAnLCBbXG4gICAgJ21lc3NhZ2luZ0FwcC5jb250cm9sbGVycycsXG4gICAgJ21lc3NhZ2luZ0FwcC5zZXJ2aWNlcycsXG4gICAgJ2dlbmVyYWwuZGlyZWN0aXZlcycsXG4gICAgJ2dlbmVyYWwuZmlsdGVycycsXG4gICAgJ2dlbmVyYWwuc2VydmljZXMnLFxuICAgICduZ1JvdXRlJyxcbiAgICAnbmdTYW5pdGl6ZSdcbl0pO1xuXG5hcHAuY29uc3RhbnQoJ0NPTkZJRycsIHdpbmRvdy5DT05GSUcpO1xuZGVsZXRlIHdpbmRvdy5DT05GSUc7XG5cbmFwcC5jb25maWcoW1xuICAgICckcm91dGVQcm92aWRlcicsICckaHR0cFByb3ZpZGVyJyxcbiAgICBmdW5jdGlvbiAoJHJvdXRlUHJvdmlkZXIsICRodHRwUHJvdmlkZXIpIHtcbiAgICAgICAgJGh0dHBQcm92aWRlci5kZWZhdWx0cy54c3JmQ29va2llTmFtZSA9ICdjc3JmdG9rZW4nO1xuICAgICAgICAkaHR0cFByb3ZpZGVyLmRlZmF1bHRzLnhzcmZIZWFkZXJOYW1lID0gJ1gtQ1NSRlRva2VuJztcbiAgICAgICAgJGh0dHBQcm92aWRlci5kZWZhdWx0cy5oZWFkZXJzLmNvbW1vblsnWC1SZXF1ZXN0ZWQtV2l0aCddID0gJ1hNTEh0dHBSZXF1ZXN0JztcbiAgICAgICAgJHJvdXRlUHJvdmlkZXIuXG4gICAgICAgICAgICB3aGVuKCcvJywge1xuICAgICAgICAgICAgICAgIHRlbXBsYXRlVXJsOiBVcmxzWydtZXNzYWdpbmdfYXBpOnBhcnRpYWxfYmFzZSddKCkgKyAncm91dGUvbGlzdE1lc3NhZ2VzJyxcbiAgICAgICAgICAgICAgICBjb250cm9sbGVyOiAnbGlzdE1lc3NhZ2VzQ3RybCdcbiAgICAgICAgICAgIH0pLlxuICAgICAgICAgICAgd2hlbignL2NvbXBvc2UnLCB7XG4gICAgICAgICAgICAgICAgdGVtcGxhdGVVcmw6IFVybHNbJ21lc3NhZ2luZ19hcGk6cGFydGlhbF9iYXNlJ10oKSArICdyb3V0ZS9jb21wb3NlTWVzc2FnZScsXG4gICAgICAgICAgICAgICAgY29udHJvbGxlcjogJ2NvbXBvc2VNZXNzYWdlQ3RybCdcbiAgICAgICAgICAgIH0pLlxuICAgICAgICAgICAgd2hlbignL3JlcGx5LzppZCcsIHtcbiAgICAgICAgICAgICAgICB0ZW1wbGF0ZVVybDogVXJsc1snbWVzc2FnaW5nX2FwaTpwYXJ0aWFsX2Jhc2UnXSgpICsgJ3JvdXRlL2NvbXBvc2VNZXNzYWdlJyxcbiAgICAgICAgICAgICAgICBjb250cm9sbGVyOiAnY29tcG9zZU1lc3NhZ2VDdHJsJ1xuICAgICAgICAgICAgfSkuXG4gICAgICAgICAgICB3aGVuKCcvcmVhZC86aWQnLCB7XG4gICAgICAgICAgICAgICAgdGVtcGxhdGVVcmw6IFVybHNbJ21lc3NhZ2luZ19hcGk6cGFydGlhbF9iYXNlJ10oKSArICdyb3V0ZS9yZWFkVGhyZWFkJyxcbiAgICAgICAgICAgICAgICBjb250cm9sbGVyOiAncmVhZFRocmVhZEN0cmwnXG4gICAgICAgICAgICB9KS5cbiAgICAgICAgICAgIG90aGVyd2lzZSh7XG4gICAgICAgICAgICAgICAgcmVkaXJlY3RUbzogJy8nXG4gICAgICAgICAgICB9KTtcbiAgICB9XG5dKTtcblxuXG5cbi8vIFdFQlBBQ0sgRk9PVEVSIC8vXG4vLyAuL21lc3NhZ2luZy9qcy9tZXNzYWdpbmcvYW5ndWxhci1hcHAuanMiLCIndXNlIHN0cmljdCc7XG5cbnZhciBhcHAgPSBhbmd1bGFyLm1vZHVsZSgnbWVzc2FnaW5nQXBwLmNvbnRyb2xsZXJzJywgW10pO1xuXG5hcHAuY29udHJvbGxlcignbGlzdE1lc3NhZ2VzQ3RybCcsIFtcbiAgICAnJHNjb3BlJywgJyR0aW1lb3V0JywgJ2dlbmVyaWNTcnYnLCAnbWVzc2FnZVNydicsICdpbmJveFNvcnRTcnYnLCAnQ09ORklHJyxcbiAgICBmdW5jdGlvbiAoJHNjb3BlLCAkdGltZW91dCwgZ2VuZXJpY1NydiwgbWVzc2FnZVNydiwgaW5ib3hTb3J0U3J2LCBjb25maWcpIHtcbiAgICAgICAgJHNjb3BlLnBlclBhZ2UgPSAxMDtcbiAgICAgICAgJHNjb3BlLmluYm94ID0gbnVsbDtcbiAgICAgICAgJHNjb3BlLnRvdGFsID0gMDtcbiAgICAgICAgJHNjb3BlLmN1cnJlbnRQYWdlID0gMDtcbiAgICAgICAgJHNjb3BlLnRpbWVvdXRQcm9taXNlID0gbnVsbDtcbiAgICAgICAgJHNjb3BlLm1lc3NhZ2VzID0gbWVzc2FnZVNydi5jb2xsZWN0KCk7XG4gICAgICAgICRzY29wZS5zb3J0ID0gaW5ib3hTb3J0U3J2LnRvRmxhZ3MoKTtcbiAgICAgICAgJHNjb3BlLnNob3dNZXNzYWdlSXRlbUlkcyA9IGNvbmZpZy5zaG93TWVzc2FnZUl0ZW1JZHM7XG4gICAgICAgICRzY29wZS5maXJzdFRpbWUgPSB0cnVlO1xuXG4gICAgICAgICRzY29wZS5nZXRQYWdlT2ZJbmJveCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgIHZhciB1cmwgPSBVcmxzWydtZXNzYWdpbmdfYXBpOmdldF9pbmJveCddKCkgK1xuICAgICAgICAgICAgICAgICc/cGFnZT0nICsgJHNjb3BlLmN1cnJlbnRQYWdlICtcbiAgICAgICAgICAgICAgICAnJnBlcl9wYWdlPScgKyAkc2NvcGUucGVyUGFnZSArXG4gICAgICAgICAgICAgICAgJyZzb3J0X2ZpZWxkPScgKyBpbmJveFNvcnRTcnYuc29ydEZpZWxkICtcbiAgICAgICAgICAgICAgICAnJnNvcnRfZGlyPScgKyBpbmJveFNvcnRTcnYuc29ydERpcmVjdGlvbjtcbiAgICAgICAgICAgICR0aW1lb3V0LmNhbmNlbCgkc2NvcGUudGltZW91dFByb21pc2UpO1xuICAgICAgICAgICAgZ2VuZXJpY1Nydi5nZW5lcmljR2V0KHVybCkuXG4gICAgICAgICAgICAgICAgdGhlbihmdW5jdGlvbiAoZGF0YSkge1xuICAgICAgICAgICAgICAgICAgICAkc2NvcGUuaW5ib3ggPSBkYXRhLm1lc3NhZ2VzO1xuICAgICAgICAgICAgICAgICAgICAkc2NvcGUudG90YWwgPSBkYXRhLnRvdGFsO1xuICAgICAgICAgICAgICAgICAgICBpZiAoJHNjb3BlLmZpcnN0VGltZSAmJiAkc2NvcGUudG90YWwgPT09IDApIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5maXJzdFRpbWUgPSBmYWxzZTtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5tZXNzYWdlcy5pbmZvID0gY29uZmlnLnRyYW5zLmVtcHR5X2luYm94O1xuICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgfSwgZnVuY3Rpb24gKGVycm9yKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5pbmJveCA9IG51bGw7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS50b3RhbCA9IDA7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5tZXNzYWdlcy5kYW5nZXIgPSBlcnJvci5lcnJvck1lc3NhZ2U7XG4gICAgICAgICAgICAgICAgfSkuXG4gICAgICAgICAgICAgICAgZmluYWxseShmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS50aW1lb3V0UHJvbWlzZSA9ICR0aW1lb3V0KGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5nZXRQYWdlT2ZJbmJveCgkc2NvcGUuY3VycmVudFBhZ2UpO1xuICAgICAgICAgICAgICAgICAgICB9LCAxMDAwMCk7XG4gICAgICAgICAgICAgICAgfSk7XG4gICAgICAgIH07XG5cbiAgICAgICAgJHNjb3BlLnNldFNvcnQgPSBmdW5jdGlvbiAoZmllbGQpIHtcbiAgICAgICAgICAgIGlmIChmaWVsZCA9PT0gaW5ib3hTb3J0U3J2LnNvcnRGaWVsZCkge1xuICAgICAgICAgICAgICAgIGluYm94U29ydFNydi50b2dnbGVTb3J0RGlyZWN0aW9uKCk7XG4gICAgICAgICAgICB9IGVsc2Uge1xuICAgICAgICAgICAgICAgIGluYm94U29ydFNydi5zb3J0RmllbGQgPSBmaWVsZDtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICAgICRzY29wZS5zb3J0ID0gaW5ib3hTb3J0U3J2LnRvRmxhZ3MoKTtcbiAgICAgICAgICAgICRzY29wZS5nZXRQYWdlT2ZJbmJveCgkc2NvcGUuY3VycmVudFBhZ2UpO1xuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS4kd2F0Y2goJ2N1cnJlbnRQYWdlJywgZnVuY3Rpb24gKG5ld1ZhbHVlKSB7XG4gICAgICAgICAgICAkc2NvcGUuZ2V0UGFnZU9mSW5ib3gobmV3VmFsdWUpO1xuICAgICAgICB9KTtcblxuICAgICAgICAkc2NvcGUuJG9uKCckZGVzdHJveScsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICR0aW1lb3V0LmNhbmNlbCgkc2NvcGUudGltZW91dFByb21pc2UpO1xuICAgICAgICB9KTtcbiAgICB9XG5dKTtcblxuYXBwLmNvbnRyb2xsZXIoJ2NvbXBvc2VNZXNzYWdlQ3RybCcsIFtcbiAgICAnJHNjb3BlJywgJyR0aW1lb3V0JywgJyRsb2NhdGlvbicsICckcm91dGVQYXJhbXMnLCAnZ2VuZXJpY1NydicsICdtZXNzYWdlU3J2JywgJ0NPTkZJRycsXG4gICAgZnVuY3Rpb24gKCRzY29wZSwgJHRpbWVvdXQsICRsb2NhdGlvbiwgJHJvdXRlUGFyYW1zLCBnZW5lcmljU3J2LCBtZXNzYWdlU3J2LCBjb25maWcpIHtcbiAgICAgICAgJHNjb3BlLnRpbWVvdXRQcm9taXNlID0gJHNjb3BlLnNlbmRUbyA9ICRzY29wZS5zZW5kVG9DaG9pY2VzID0gbnVsbDtcbiAgICAgICAgJHNjb3BlLmN1cnJlbnRQYWdlID0gJHNjb3BlLnBhZ2VDb3VudCA9ICRzY29wZS5zZW5kVG9DaG9pY2VzQ291bnQgPSAwO1xuICAgICAgICAkc2NvcGUucGFnZXMgPSBbXTtcbiAgICAgICAgJHNjb3BlLm1lc3NhZ2VzID0gbWVzc2FnZVNydi5jb2xsZWN0KCk7XG4gICAgICAgICRzY29wZS5zZWFyY2hpbmcgPSBmYWxzZTtcbiAgICAgICAgJHNjb3BlLm1pblNlYXJjaENoYXJzID0gY29uZmlnLm1pblNlYXJjaENoYXJzO1xuICAgICAgICAkc2NvcGUuaXNTdXBlclVzZXIgPSBjb25maWcuaXNTdXBlclVzZXI7XG4gICAgICAgICRzY29wZS5yZXBseVNlbmRlciA9IG51bGw7XG4gICAgICAgICRzY29wZS5yZXBseVRvID0gJHNjb3BlLnJlcGx5Qm9keSA9ICcnO1xuICAgICAgICAkc2NvcGUubmV3TWVzc2FnZSA9IGZhbHNlO1xuICAgICAgICAkc2NvcGUubXNnID0ge1xuICAgICAgICAgICAgcmVjaXBpZW50czogW10sXG4gICAgICAgICAgICB0YXJnZXRBbGw6IGZhbHNlLFxuICAgICAgICAgICAgc3ViamVjdDogJycsXG4gICAgICAgICAgICBib2R5OiAnJyxcbiAgICAgICAgICAgIG1paWQ6ICRyb3V0ZVBhcmFtcy5pZCA/ICRyb3V0ZVBhcmFtcy5pZCA6IDBcbiAgICAgICAgfTtcblxuICAgICAgICBpZiAoJHNjb3BlLm1zZy5taWlkKSB7XG4gICAgICAgICAgICB2YXIgdXJsID0gVXJsc1snbWVzc2FnaW5nX2FwaTpnZXRfcmVwbHlfaW5mbyddKCkgKyAnP21paWQ9JyArICRzY29wZS5tc2cubWlpZDtcbiAgICAgICAgICAgIGdlbmVyaWNTcnYuZ2VuZXJpY0dldCh1cmwpLlxuICAgICAgICAgICAgICAgIHRoZW4oZnVuY3Rpb24gKGRhdGEpIHtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLm1zZy5yZWNpcGllbnRzID0gZGF0YS5yZWNpcGllbnRzO1xuICAgICAgICAgICAgICAgICAgICAkc2NvcGUubXNnLnN1YmplY3QgPSBkYXRhLnN1YmplY3Q7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS5yZXBseVNlbmRlciA9IGRhdGEucmVjaXBpZW50c1swXTtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnJlcGx5VG8gPSBkYXRhLnNlbmRlcjtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnJlcGx5Qm9keSA9IGRhdGEuYm9keTtcbiAgICAgICAgICAgICAgICB9LCBmdW5jdGlvbiAoZXJyb3IpIHtcbiAgICAgICAgICAgICAgICAgICAgbWVzc2FnZVNydi5tZXNzYWdlc1tlcnJvci50eXBlXSA9IGVycm9yLmVycm9yTWVzc2FnZTtcbiAgICAgICAgICAgICAgICAgICAgJGxvY2F0aW9uLnBhdGgoJy9yZWFkLycgKyAkc2NvcGUubXNnLm1paWQpO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICB9IGVsc2Uge1xuICAgICAgICAgICAgJHNjb3BlLm5ld01lc3NhZ2UgPSB0cnVlO1xuICAgICAgICB9XG5cbiAgICAgICAgJHNjb3BlLnNlbmRUb0tleVVwID0gZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgJHRpbWVvdXQuY2FuY2VsKCRzY29wZS50aW1lb3V0UHJvbWlzZSk7XG4gICAgICAgICAgICAkc2NvcGUudGltZW91dFByb21pc2UgPSAkdGltZW91dChmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgJHNjb3BlLnNlYXJjaFJlY2lwaWVudCgpO1xuICAgICAgICAgICAgfSwgNTAwKTtcbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUuc2VhcmNoUmVjaXBpZW50ID0gZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgdmFyIGQ7XG4gICAgICAgICAgICBpZiAoISRzY29wZS5zZW5kVG8pIHtcbiAgICAgICAgICAgICAgICByZXR1cm47XG4gICAgICAgICAgICB9XG4gICAgICAgICAgICBpZiAoJHNjb3BlLnNlbmRUby5sZW5ndGggPj0gJHNjb3BlLm1pblNlYXJjaENoYXJzKSB7XG4gICAgICAgICAgICAgICAgJHNjb3BlLnNlYXJjaGluZyA9IHRydWU7XG4gICAgICAgICAgICAgICAgZCA9IHtcbiAgICAgICAgICAgICAgICAgICAgcTogJHNjb3BlLnNlbmRUbyxcbiAgICAgICAgICAgICAgICAgICAgcmVjaXBpZW50czogJHNjb3BlLm1zZy5yZWNpcGllbnRzLFxuICAgICAgICAgICAgICAgICAgICBwYWdlOiAkc2NvcGUuY3VycmVudFBhZ2VcbiAgICAgICAgICAgICAgICB9O1xuICAgICAgICAgICAgICAgIGdlbmVyaWNTcnYuZ2VuZXJpY1Bvc3QoVXJsc1snbWVzc2FnaW5nX2FwaTpzZWFyY2hfcmVjaXBpZW50J10oKSwgZCkuXG4gICAgICAgICAgICAgICAgICAgIHRoZW4oZnVuY3Rpb24gKGRhdGEpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5hZGRDaG9pY2VzKGRhdGEpO1xuICAgICAgICAgICAgICAgICAgICB9LCBmdW5jdGlvbiAoZXJyb3IpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5tZXNzYWdlcy5kYW5nZXIgPSBlcnJvci5lcnJvck1lc3NhZ2U7XG4gICAgICAgICAgICAgICAgICAgICAgICAkc2NvcGUuc2VuZFRvQ2hvaWNlcyA9IG51bGw7XG4gICAgICAgICAgICAgICAgICAgIH0pLlxuICAgICAgICAgICAgICAgICAgICBmaW5hbGx5KGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5zZWFyY2hpbmcgPSBmYWxzZTtcbiAgICAgICAgICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICB9IGVsc2UgaWYgKCRzY29wZS5zZW5kVG8ubGVuZ3RoIDwgJHNjb3BlLm1pblNlYXJjaENoYXJzKSB7XG4gICAgICAgICAgICAgICAgJHNjb3BlLnNlbmRUb0Nob2ljZXMgPSBudWxsO1xuICAgICAgICAgICAgfVxuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS5hZGRSZWNpcGllbnQgPSBmdW5jdGlvbiAoY2hvaWNlKSB7XG4gICAgICAgICAgICAkc2NvcGUubXNnLnJlY2lwaWVudHMucHVzaChjaG9pY2UpO1xuICAgICAgICAgICAgJHNjb3BlLnJlbW92ZUNob2ljZShjaG9pY2UpO1xuICAgICAgICAgICAgJHNjb3BlLnNlYXJjaFJlY2lwaWVudCgpO1xuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS5yZW1vdmVSZWNpcGllbnQgPSBmdW5jdGlvbiAocmVjaXBpZW50KSB7XG4gICAgICAgICAgICAkc2NvcGUubXNnLnJlY2lwaWVudHMgPSAkc2NvcGUubXNnLnJlY2lwaWVudHMuZmlsdGVyKGZ1bmN0aW9uICh2YWx1ZSkge1xuICAgICAgICAgICAgICAgIHJldHVybiB2YWx1ZS5pZCAhPT0gcmVjaXBpZW50LmlkO1xuICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICAkc2NvcGUuc2VhcmNoUmVjaXBpZW50KCk7XG4gICAgICAgIH07XG5cbiAgICAgICAgJHNjb3BlLmFkZENob2ljZXMgPSBmdW5jdGlvbiAoZGF0YSkge1xuICAgICAgICAgICAgdmFyIGo7XG4gICAgICAgICAgICAkc2NvcGUuc2VuZFRvQ2hvaWNlcyA9IGRhdGEuc2VhcmNoUmVzdWx0cy5maWx0ZXIoZnVuY3Rpb24gKHZhbHVlKSB7XG4gICAgICAgICAgICAgICAgdmFyIGksIGNvdW50O1xuICAgICAgICAgICAgICAgIGZvciAoaSA9IDAsIGNvdW50ID0gJHNjb3BlLm1zZy5yZWNpcGllbnRzLmxlbmd0aDsgaSA8IGNvdW50OyArK2kpIHtcbiAgICAgICAgICAgICAgICAgICAgaWYgKCRzY29wZS5tc2cucmVjaXBpZW50c1tpXS5pZCA9PT0gdmFsdWUuaWQpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTtcbiAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTtcbiAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgJHNjb3BlLnNlbmRUb0Nob2ljZXNDb3VudCA9IGRhdGEuY291bnQ7XG4gICAgICAgICAgICAkc2NvcGUucGFnZUNvdW50ID0gTWF0aC5jZWlsKGRhdGEuY291bnQgLyBkYXRhLnBlclBhZ2UpO1xuICAgICAgICAgICAgJHNjb3BlLnBhZ2VzID0gW107XG4gICAgICAgICAgICBmb3IgKGogPSAxOyBqIDw9ICRzY29wZS5wYWdlQ291bnQ7ICsraikge1xuICAgICAgICAgICAgICAgICRzY29wZS5wYWdlcy5wdXNoKGopO1xuICAgICAgICAgICAgfVxuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS5yZW1vdmVDaG9pY2UgPSBmdW5jdGlvbiAoY2hvaWNlKSB7XG4gICAgICAgICAgICAkc2NvcGUuc2VuZFRvQ2hvaWNlcyA9ICRzY29wZS5zZW5kVG9DaG9pY2VzLmZpbHRlcihmdW5jdGlvbiAodmFsdWUpIHtcbiAgICAgICAgICAgICAgICByZXR1cm4gdmFsdWUuaWQgIT09IGNob2ljZS5pZDtcbiAgICAgICAgICAgIH0pO1xuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS50YXJnZXRBbGxDaGFuZ2VkID0gZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgaWYgKCRzY29wZS5tc2cgJiYgJHNjb3BlLm1zZy50YXJnZXRBbGwpIHtcbiAgICAgICAgICAgICAgICAkc2NvcGUuc2VuZFRvID0gJyc7XG4gICAgICAgICAgICAgICAgJHNjb3BlLnNlbmRUb0Nob2ljZXMgPSBbXTtcbiAgICAgICAgICAgICAgICAkc2NvcGUubXNnLnJlY2lwaWVudHMgPSBbXTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUuc2VuZE1lc3NhZ2UgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICBnZW5lcmljU3J2LmdlbmVyaWNQb3N0KFVybHNbJ21lc3NhZ2luZ19hcGk6c2VuZF9tZXNzYWdlJ10oKSwgJHNjb3BlLm1zZykuXG4gICAgICAgICAgICAgICAgdGhlbihmdW5jdGlvbiAoZGF0YSkge1xuICAgICAgICAgICAgICAgICAgICBtZXNzYWdlU3J2Lm1lc3NhZ2VzLnN1Y2Nlc3MgPSBkYXRhLnN1Y2Nlc3NNZXNzYWdlO1xuICAgICAgICAgICAgICAgICAgICBpZiAoJHNjb3BlLm1zZy5taWlkKSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkbG9jYXRpb24ucGF0aCgnL3JlYWQvJyArICRzY29wZS5tc2cubWlpZCk7XG4gICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgICAgICAgICAgICAkbG9jYXRpb24ucGF0aCgnLycpO1xuICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgfSwgZnVuY3Rpb24gKGVycm9yKSB7XG4gICAgICAgICAgICAgICAgICAgIG1lc3NhZ2VTcnYubWVzc2FnZXNbZXJyb3IudHlwZV0gPSBlcnJvci5lcnJvck1lc3NhZ2U7XG4gICAgICAgICAgICAgICAgICAgICRsb2NhdGlvbi5wYXRoKCcvJyk7XG4gICAgICAgICAgICAgICAgfSk7XG4gICAgICAgIH07XG5cbiAgICAgICAgJHNjb3BlLmlzU2VuZGVyID0gZnVuY3Rpb24gKHJlY2lwaWVudCkge1xuICAgICAgICAgICAgaWYgKCEkc2NvcGUubXNnLm1paWQgfHwgISRzY29wZS5yZXBseVNlbmRlcikge1xuICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICAgIHJldHVybiByZWNpcGllbnQuaWQgPT09ICRzY29wZS5yZXBseVNlbmRlci5pZDtcbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUuJG9uKCckZGVzdHJveScsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICR0aW1lb3V0LmNhbmNlbCgkc2NvcGUudGltZW91dFByb21pc2UpO1xuICAgICAgICB9KTtcblxuICAgICAgICAkc2NvcGUucHJldlBhZ2UgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICBpZiAoJHNjb3BlLmN1cnJlbnRQYWdlID4gMCkge1xuICAgICAgICAgICAgICAgIC0tJHNjb3BlLmN1cnJlbnRQYWdlO1xuICAgICAgICAgICAgICAgICRzY29wZS5zZWFyY2hSZWNpcGllbnQoKTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUucHJldlBhZ2VEaXNhYmxlZCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgIHZhciBkaXNhYmxlZCA9ICRzY29wZS5jdXJyZW50UGFnZSA9PT0gMCA/ICdkaXNhYmxlZCcgOiAnJztcbiAgICAgICAgICAgIHJldHVybiBkaXNhYmxlZDtcbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUubmV4dFBhZ2UgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICBpZiAoJHNjb3BlLmN1cnJlbnRQYWdlIDwgJHNjb3BlLnBhZ2VDb3VudCAtIDEpIHtcbiAgICAgICAgICAgICAgICAkc2NvcGUuY3VycmVudFBhZ2UrKztcbiAgICAgICAgICAgICAgICAkc2NvcGUuc2VhcmNoUmVjaXBpZW50KCk7XG4gICAgICAgICAgICB9XG4gICAgICAgIH07XG5cbiAgICAgICAgJHNjb3BlLm5leHRQYWdlRGlzYWJsZWQgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICB2YXIgZGlzYWJsZWQgPSAkc2NvcGUuY3VycmVudFBhZ2UgPT09ICRzY29wZS5wYWdlQ291bnQgLSAxID8gJ2Rpc2FibGVkJyA6ICcnO1xuICAgICAgICAgICAgcmV0dXJuIGRpc2FibGVkO1xuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS5wYWdlRGlzYWJsZWQgPSBmdW5jdGlvbiAobikge1xuICAgICAgICAgICAgcmV0dXJuICRzY29wZS5jdXJyZW50UGFnZSA9PT0gbjtcbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUuZ290b1BhZ2UgPSBmdW5jdGlvbiAobikge1xuICAgICAgICAgICAgJHNjb3BlLmN1cnJlbnRQYWdlID0gbjtcbiAgICAgICAgICAgICRzY29wZS5zZWFyY2hSZWNpcGllbnQoKTtcbiAgICAgICAgfTtcbiAgICB9XG5dKTtcblxuYXBwLmNvbnRyb2xsZXIoJ3JlYWRUaHJlYWRDdHJsJywgW1xuICAgICckc2NvcGUnLCAnJHRpbWVvdXQnLCAnJGxvY2F0aW9uJywgJyRyb3V0ZVBhcmFtcycsICdnZW5lcmljU3J2JywgJ21lc3NhZ2VTcnYnLCAnQ09ORklHJyxcbiAgICBmdW5jdGlvbiAoJHNjb3BlLCAkdGltZW91dCwgJGxvY2F0aW9uLCAkcm91dGVQYXJhbXMsIGdlbmVyaWNTcnYsIG1lc3NhZ2VTcnYsIGNvbmZpZykge1xuICAgICAgICAkc2NvcGUubWVzc2FnZUl0ZW1JZCA9ICRyb3V0ZVBhcmFtcy5pZDtcbiAgICAgICAgJHNjb3BlLm1lc3NhZ2VzID0gbWVzc2FnZVNydi5jb2xsZWN0KCk7XG4gICAgICAgICRzY29wZS50aW1lb3V0UHJvbWlzZSA9IG51bGw7XG4gICAgICAgICRzY29wZS5zaG93TWVzc2FnZUl0ZW1JZHMgPSBjb25maWcuc2hvd01lc3NhZ2VJdGVtSWRzO1xuICAgICAgICAkc2NvcGUudW5yZWFkID0gW107XG5cbiAgICAgICAgJHNjb3BlLmdldFRocmVhZCA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgIHZhciB1cmwgPSBVcmxzWydtZXNzYWdpbmdfYXBpOmdldF90aHJlYWQnXSgpICsgJz9taWlkPScgKyAkcm91dGVQYXJhbXMuaWQ7XG4gICAgICAgICAgICAkdGltZW91dC5jYW5jZWwoJHNjb3BlLnRpbWVvdXRQcm9taXNlKTtcbiAgICAgICAgICAgIGdlbmVyaWNTcnYuZ2VuZXJpY0dldCh1cmwpLlxuICAgICAgICAgICAgICAgIHRoZW4oZnVuY3Rpb24gKGRhdGEpIHtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnN1YmplY3QgPSBkYXRhLnN1YmplY3Q7XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS50aHJlYWQgPSBkYXRhLm1lc3NhZ2VzO1xuICAgICAgICAgICAgICAgICAgICAkc2NvcGUuc3RvcmVVbnJlYWQoKTtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnRvdGFsID0gZGF0YS50b3RhbDtcbiAgICAgICAgICAgICAgICAgICAgaWYgKCRzY29wZS50b3RhbCA9PT0gMCkge1xuICAgICAgICAgICAgICAgICAgICAgICAgJHNjb3BlLm1lc3NhZ2VzLmluZm8gPSBjb25maWcudHJhbnMuZW1wdHlfdGhyZWFkO1xuICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgICAgICRzY29wZS50aW1lb3V0UHJvbWlzZSA9ICR0aW1lb3V0KGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5nZXRUaHJlYWQoKTtcbiAgICAgICAgICAgICAgICAgICAgfSwgMTAwMDApO1xuICAgICAgICAgICAgICAgIH0sIGZ1bmN0aW9uIChlcnJvcikge1xuICAgICAgICAgICAgICAgICAgICBtZXNzYWdlU3J2Lm1lc3NhZ2VzW2Vycm9yLnR5cGVdID0gZXJyb3IuZXJyb3JNZXNzYWdlO1xuICAgICAgICAgICAgICAgICAgICAkbG9jYXRpb24ucGF0aCgnLycpO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS5nZXRUaHJlYWQoKTtcblxuICAgICAgICAkc2NvcGUuc3RvcmVVbnJlYWQgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICB2YXIgaSwgY291bnQ7XG4gICAgICAgICAgICBmb3IgKGkgPSAwLCBjb3VudCA9ICRzY29wZS50aHJlYWQubGVuZ3RoOyBpIDwgY291bnQ7ICsraSkge1xuICAgICAgICAgICAgICAgIGlmICghJHNjb3BlLnRocmVhZFtpXS5yZWFkICYmICRzY29wZS51bnJlYWQuaW5kZXhPZigkc2NvcGUudGhyZWFkW2ldLmlkKSA9PT0gLTEpIHtcbiAgICAgICAgICAgICAgICAgICAgJHNjb3BlLnVucmVhZC5wdXNoKCRzY29wZS50aHJlYWRbaV0uaWQpO1xuICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgIH1cbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUuaXNSZWFkID0gZnVuY3Rpb24gKGVtYWlsKSB7XG4gICAgICAgICAgICByZXR1cm4gJHNjb3BlLnVucmVhZC5pbmRleE9mKGVtYWlsLmlkKSA9PT0gLTE7XG4gICAgICAgIH07XG5cbiAgICAgICAgJHNjb3BlLm9wZW5Nb2RhbCA9IGZ1bmN0aW9uICh1aWQsIG1paWQpIHtcbiAgICAgICAgICAgICR0aW1lb3V0LmNhbmNlbCgkc2NvcGUudGltZW91dFByb21pc2UpO1xuICAgICAgICAgICAgJHNjb3BlLm1paWQgPSBtaWlkO1xuICAgICAgICAgICAgalF1ZXJ5KCcjJyArIHVpZCkubW9kYWwoe30pO1xuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS5jYW5jZWxEZWxldGVNZXNzYWdlID0gZnVuY3Rpb24gKHVpZCkge1xuICAgICAgICAgICAgdmFyIGVsZW0gPSBqUXVlcnkoJyMnICsgdWlkKTtcbiAgICAgICAgICAgIGVsZW0ub2ZmKCdoaWRkZW4uYnMubW9kYWwnKTtcbiAgICAgICAgICAgIGVsZW0ub24oJ2hpZGRlbi5icy5tb2RhbCcsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAkc2NvcGUuZ2V0VGhyZWFkKCk7XG4gICAgICAgICAgICB9KTtcbiAgICAgICAgICAgIGVsZW0ubW9kYWwoJ2hpZGUnKTtcbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUuZGVsZXRlT25lID0gZnVuY3Rpb24gKHVpZCkge1xuICAgICAgICAgICAgdmFyIHVybCxcbiAgICAgICAgICAgICAgICBlbGVtID0galF1ZXJ5KCcjJyArIHVpZCk7XG4gICAgICAgICAgICBlbGVtLm9mZignaGlkZGVuLmJzLm1vZGFsJyk7XG4gICAgICAgICAgICBlbGVtLm9uKCdoaWRkZW4uYnMubW9kYWwnLCBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgdmFyIG1paWQgPSAkc2NvcGUubWlpZDtcbiAgICAgICAgICAgICAgICAkc2NvcGUubWlpZCA9IG51bGw7XG4gICAgICAgICAgICAgICAgaWYgKCFtaWlkKSB7XG4gICAgICAgICAgICAgICAgICAgIHJldHVybjtcbiAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgdXJsID0gVXJsc1snbWVzc2FnaW5nX2FwaTpkZWxldGVfbWVzc2FnZV9pdGVtJ10oKSArICc/bWlpZD0nICsgbWlpZDtcbiAgICAgICAgICAgICAgICBnZW5lcmljU3J2LmdlbmVyaWNHZXQodXJsKS5cbiAgICAgICAgICAgICAgICAgICAgdGhlbihmdW5jdGlvbiAoZGF0YSkge1xuICAgICAgICAgICAgICAgICAgICAgICAgJHNjb3BlLm1lc3NhZ2VzLnN1Y2Nlc3MgPSBkYXRhLnN1Y2Nlc3NNZXNzYWdlO1xuICAgICAgICAgICAgICAgICAgICB9LCBmdW5jdGlvbiAoZXJyb3IpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5tZXNzYWdlc1tlcnJvci50eXBlXSA9IGVycm9yLmVycm9yTWVzc2FnZTtcbiAgICAgICAgICAgICAgICAgICAgfSkuXG4gICAgICAgICAgICAgICAgICAgIGZpbmFsbHkoZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgICAgICAgICAgICAgJHNjb3BlLmdldFRocmVhZCgpO1xuICAgICAgICAgICAgICAgICAgICB9KTtcbiAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgZWxlbS5tb2RhbCgnaGlkZScpO1xuICAgICAgICB9O1xuXG4gICAgICAgICRzY29wZS5kZWxldGVBbGwgPSBmdW5jdGlvbiAodWlkKSB7XG4gICAgICAgICAgICB2YXIgdXJsLFxuICAgICAgICAgICAgICAgIGVsZW0gPSBqUXVlcnkoJyMnICsgdWlkKTtcbiAgICAgICAgICAgIGVsZW0ub2ZmKCdoaWRkZW4uYnMubW9kYWwnKTtcbiAgICAgICAgICAgIGVsZW0ub24oJ2hpZGRlbi5icy5tb2RhbCcsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICBpZiAoISRzY29wZS50b3RhbCkge1xuICAgICAgICAgICAgICAgICAgICByZXR1cm47XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIHVybCA9IFVybHNbJ21lc3NhZ2luZ19hcGk6ZGVsZXRlX21lc3NhZ2VfaXRlbSddKCkgKyAnP21paWQ9JyArICRzY29wZS50aHJlYWRbMF0uaWQgKyAnJnRocmVhZCc7XG4gICAgICAgICAgICAgICAgZ2VuZXJpY1Nydi5nZW5lcmljR2V0KHVybCkuXG4gICAgICAgICAgICAgICAgICAgIHRoZW4oZnVuY3Rpb24gKGRhdGEpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgIG1lc3NhZ2VTcnYubWVzc2FnZXMuc3VjY2VzcyA9IGRhdGEuc3VjY2Vzc01lc3NhZ2U7XG4gICAgICAgICAgICAgICAgICAgICAgICAkbG9jYXRpb24ucGF0aCgnLycpO1xuICAgICAgICAgICAgICAgICAgICB9LCBmdW5jdGlvbiAoZXJyb3IpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5tZXNzYWdlc1tlcnJvci50eXBlXSA9IGVycm9yLmVycm9yTWVzc2FnZTtcbiAgICAgICAgICAgICAgICAgICAgICAgICRzY29wZS5nZXRUaHJlYWQoKTtcbiAgICAgICAgICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICB9KTtcbiAgICAgICAgICAgIGVsZW0ubW9kYWwoJ2hpZGUnKTtcbiAgICAgICAgfTtcblxuICAgICAgICAkc2NvcGUuJG9uKCckZGVzdHJveScsIGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICR0aW1lb3V0LmNhbmNlbCgkc2NvcGUudGltZW91dFByb21pc2UpO1xuICAgICAgICB9KTtcbiAgICB9XG5dKTtcblxuXG5cbi8vIFdFQlBBQ0sgRk9PVEVSIC8vXG4vLyAuL21lc3NhZ2luZy9qcy9tZXNzYWdpbmcvY29udHJvbGxlcnMuanMiLCIndXNlIHN0cmljdCc7XG5cbnZhciBhcHAgPSBhbmd1bGFyLm1vZHVsZSgnbWVzc2FnaW5nQXBwLnNlcnZpY2VzJywgW10pO1xuXG5hcHAuc2VydmljZSgnaW5ib3hTb3J0U3J2JywgZnVuY3Rpb24gKCkge1xuICAgIHRoaXMuc29ydEZpZWxkID0gJ2RhdGUnO1xuICAgIHRoaXMuc29ydERpcmVjdGlvbiA9ICdkZXNjJztcblxuICAgIHRoaXMudG9GbGFncyA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgcmV0dXJuIHtcbiAgICAgICAgICAgIHNlbmRlcjogdGhpcy5zb3J0RmllbGQgPT09ICdzZW5kZXInLFxuICAgICAgICAgICAgc2VuZGVyQXNjOiB0aGlzLnNvcnRGaWVsZCA9PT0gJ3NlbmRlcicgJiYgdGhpcy5zb3J0RGlyZWN0aW9uID09PSAnYXNjJyxcbiAgICAgICAgICAgIHNlbmRlckRlc2M6IHRoaXMuc29ydEZpZWxkID09PSAnc2VuZGVyJyAmJiB0aGlzLnNvcnREaXJlY3Rpb24gPT09ICdkZXNjJyxcbiAgICAgICAgICAgIGRhdGU6IHRoaXMuc29ydEZpZWxkID09PSAnZGF0ZScsXG4gICAgICAgICAgICBkYXRlQXNjOiB0aGlzLnNvcnRGaWVsZCA9PT0gJ2RhdGUnICYmIHRoaXMuc29ydERpcmVjdGlvbiA9PT0gJ2FzYycsXG4gICAgICAgICAgICBkYXRlRGVzYzogdGhpcy5zb3J0RmllbGQgPT09ICdkYXRlJyAmJiB0aGlzLnNvcnREaXJlY3Rpb24gPT09ICdkZXNjJ1xuICAgICAgICB9O1xuICAgIH07XG5cbiAgICB0aGlzLnRvZ2dsZVNvcnREaXJlY3Rpb24gPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgIGlmICh0aGlzLnNvcnREaXJlY3Rpb24gPT09ICdhc2MnKSB7XG4gICAgICAgICAgICB0aGlzLnNvcnREaXJlY3Rpb24gPSAnZGVzYyc7XG4gICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICB0aGlzLnNvcnREaXJlY3Rpb24gPSAnYXNjJztcbiAgICAgICAgfVxuICAgIH07XG59KTtcblxuXG5cbi8vIFdFQlBBQ0sgRk9PVEVSIC8vXG4vLyAuL21lc3NhZ2luZy9qcy9tZXNzYWdpbmcvc2VydmljZXMuanMiLCIndXNlIHN0cmljdCc7XG5cbmltcG9ydCAnLi9hbmd1bGFyLWFwcCc7XG5pbXBvcnQgJy4vY29udHJvbGxlcnMnO1xuaW1wb3J0ICcuL3NlcnZpY2VzJztcbmltcG9ydCAnLi4vZ2VuZXJhbC9kaXJlY3RpdmVzJztcbmltcG9ydCAnLi4vZ2VuZXJhbC9maWx0ZXJzJztcbmltcG9ydCAnLi4vZ2VuZXJhbC9zZXJ2aWNlcyc7XG5cblxuXG4vLyBXRUJQQUNLIEZPT1RFUiAvL1xuLy8gLi9tZXNzYWdpbmcvanMvbWVzc2FnaW5nL2FwcC5qcyJdLCJzb3VyY2VSb290IjoiIn0=