<?php
/**
 * @package Urlaubsmeldung
 * @copyright Copyright 2003-2022 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license https://www.zen-cart-pro.at/license/3_0.txt GNU General Public License V3.0
 * @version $Id: urlaubsmeldung_sanitizer.php 2022-02-27 07:42:51Z webchills $
 */
 
// Wenn Sie in der Urlaubsmeldung HTML verwenden wollen, dann ändern Sie in der folgenden Zeile von false auf true
define('URLAUBSMELDUNG_ALLOW_HTML','false');
//
if (URLAUBSMELDUNG_ALLOW_HTML == 'true') {
$urlaubsmeldung_sanitizer = AdminRequestSanitizer::getInstance();
$urlaubsmeldung_sanitizer->addSimpleSanitization('PRODUCT_DESC_REGEX', array('configuration_value'));
}
