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
    $scope.sendToChoicesCount = $scope.sendToChoicesMax = 0;
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
                recipients: $scope.msg.recipients
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
        $scope.sendToChoicesMax = data.max;
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

},{}],7:[function(require,module,exports){
'use strict';

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

},{}]},{},[5]);
