<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'pgsql';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'localhost';
$CFG->dbname    = 'plugins_moodle';
$CFG->dbuser    = 'postgres';
$CFG->dbpass    = 'W0mb4t666!';
$CFG->prefix    = 'mdl_';

$CFG->dboptions = [
    'dbpersist' => 0,
    'dbport'    => '5432',
    'dbsocket'  => '',
];

$CFG->wwwroot  = 'http://10.0.0.10';
$CFG->dataroot = '/vagrant/moodledata';
$CFG->admin    = 'admin';

$CFG->directorypermissions = 0777;
$CFG->noemailever = true;

$CFG->phpunit_prefix = 'phpu_';
$CFG->phpunit_dataroot = '/vagrant/phpu_moodledata';

require_once(dirname(__FILE__) . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
