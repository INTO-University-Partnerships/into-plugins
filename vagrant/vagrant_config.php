<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

# $CFG->dbtype    = 'pgsql';
$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'localhost';
# $CFG->dbport    = 5432;
$CFG->dbname    = 'plugins_moodle';
# $CFG->dbuser    = 'postgres';
$CFG->dbuser    = 'root';
$CFG->dbpass    = 'W0mb4t666!';
$CFG->prefix    = 'mdl_';

$CFG->dboptions = [
    'dbpersist' => 0,
    'dbport'    => '5432',
    'dbsocket'  => '',
];

$CFG->wwwroot  = 'http://10.0.0.10';
$CFG->djangowwwroot  = 'http://10.0.0.10:8000';
$CFG->dataroot = '/vagrant/moodledata';
$CFG->admin    = 'admin';

$CFG->directorypermissions = 0777;
$CFG->noemailever = true;

$CFG->phpunit_prefix = 'phpu_';
$CFG->phpunit_dataroot = '/vagrant/phpu_moodledata';

$CFG->django_notification_basic_auth = ['plugins', 'W0mb4t666!'];
$CFG->django_vle_sync_basic_auth = ['plugins', 'W0mb4t666!'];

$CFG->django_urls = [
    'send_notification'     => '/messaging/send/notification/',
    'create_course'         => '/vle/create/course/',
    'update_course'         => '/vle/update/course/',
    'delete_course'         => '/vle/delete/course/',
    'add_course_members'    => '/vle/add/course/members/',
    'remove_course_members' => '/vle/remove/course/members/',
    'add_tutor'             => '/vle/add/tutor/',
    'remove_tutor'          => '/vle/remove/tutor/',
    'create_group'          => '/vle/create/group/',
    'update_group'          => '/vle/update/group/',
    'delete_group'          => '/vle/delete/group/',
    'add_group_members'     => '/vle/add/group/members/',
    'remove_group_members'  => '/vle/remove/group/members/',
];

require_once(dirname(__FILE__) . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
