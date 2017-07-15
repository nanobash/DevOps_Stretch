<?php

/**
 * Sets blowfish_secret passphrase on phpMyAdmin /usr/share/phpMyAdmin/config.sample.inc.php file
 *
 * @param int $length
 */
function setBlowfishSecret(int $length = 20) {
    copy('/usr/share/phpMyAdmin/config.sample.inc.php', '/usr/share/phpMyAdmin/config.inc.php');

    $configContent = file_get_contents('/usr/share/phpMyAdmin/config.inc.php');

    $configContent = str_replace('$cfg[\'blowfish_secret\'] = \'\'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */',
        '$cfg[\'blowfish_secret\'] = \'' . md5(generateRandomCharacters($length)) . '\'; /* Generated and specified by bootstrap.php */',
        $configContent)
    ;

    file_put_contents('/usr/share/phpMyAdmin/config.inc.php', $configContent);
}

/**
 * Generates and returns random sequence of characters
 *  of specified length (defaults to 20)
 *
 * @param int $length
 * @return string
 */
function generateRandomCharacters(int $length = 20): string {
    $chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

    $result = '';

    for ($i = 0; $i < $length; ++$i) {
        $result .= $chars[rand(0, strlen($chars) - 1)];
    }

    return $result;
}

/**
 * Below runs executable functions
 */
setBlowfishSecret(100);

/**
 * End of bootstrap.php file
 */
