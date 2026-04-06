<?php
    /* 发送手机验证码API（注册/找回密码） */
    
    list($uid, $json) = app_check('xva', ['phone']);
    if (! (intval($json['phone']) && strlen($json['phone']) == 11)) {
        api_callback(0, '你的手机号不对劲呢~');
    }
    
    $count = sql_query_count('SELECT id FROM phoneVerify WHERE (phone = ? OR userIP LIKE ?) AND sendTime >= ?', [intval($json['phone']), app_getUserIP(), strtotime(date('Y-m-d')) * 1000]);
    $limit = c::$SMS_VERIFY_CONFIG['sendLimitPerDay'];
    if ($count >= $limit) {
        api_callback(0, '你今天发送验证码太多次（已经' . $count . '次啦）了呢~');
    }
    
    $phoneVerifyId = sql_newId('phoneVerify');
    $smsResult = sms_send_verify_code($json['phone'], $phoneVerifyId);
    if (! $smsResult['status']) {
        api_callback(0, app_sms_error_message($smsResult, 'send'));
    }
    $result = sql_exec_count('INSERT INTO phoneVerify (id, phone, verifyCode, sendTime, userIP, userUA) VALUES (?, ?, ?, ?, ?, ?)', [$phoneVerifyId, intval($json['phone']), 0, time_microtime(), app_getUserIP(), app_getUserUA()]);
    if (! $result) {
        api_callback(0, '操作数据失败~');
    }
    
    api_callback(1, '发送手机验证码成功！请注意查收，你每天只能发送' . $limit . '次验证码哦~');
?>