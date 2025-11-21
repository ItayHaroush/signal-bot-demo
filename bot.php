<?php

$botNumber = "+972547566508"; // תחליף למספר שלך

function sendMessage($msg, $to) {
    global $botNumber;
    shell_exec("signal-cli -u $botNumber send -m \"$msg\" $to");
}

$output = shell_exec("signal-cli -u $botNumber receive");
$lines = explode("\n", $output);

foreach ($lines as $line) {
    if (strpos($line, "envelope from") !== false) {
        preg_match('/envelope from (.+?),/', $line, $m);
        $from = trim($m[1]);

        sendMessage("היי אחי ✌️\nבחר:\n1. שעות פעילות\n2. תמיכה\n3. דבר עם נציג", $from);
    }
}
