From: Rolando Martins <rolando.martins@gmail.com>
Subject: apple_gmux bug
Date: Thu, 24 Jan 2013 00:25:47 -0500
Message-ID: <CABcS5h0iKuJ_wR1N+7e1J6U=M_7HaU6a+bKpzKkRxu-m7zkdnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:44030 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750798Ab3AXFZt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Jan 2013 00:25:49 -0500
Received: by mail-la0-f41.google.com with SMTP id fo12so4187540lab.28
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jan 2013 21:25:48 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Seth Forshee <seth.forshee@canonical.com>

Hi,
I am currently experienced problems with the apple_gmux driver
while using a MBP retina 10,1.
System description & behavior:
-Ubuntu 13.04 with kernel 3.8-rc4.
-dmesg: apple_gmux: Found gmux version 3.2.19 [indexed]
-Under /sys/class/backlight I only have gmux_backlight.
-Under gmux_backlight both actual and max brightness are equal to 2^24
= 16777216,
while brightness value is within [0,1023] (the value can be changed)
-The backlight is dimmed throughout the boot process and remains the same,
without being possible to adjust it.

If the following hack is applied then full brightness can be achieved,
however it remains nonadjustable.

 #define HACK_VALUE 1023
 ...
 In gmux_probe() :
 ...
 props.max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);
 //hack
 props.max_brightness = HACK_VALUE;
 ....
 bdev->props.brightness = gmux_get_brightness(bdev);
 //hack
 bdev->props.brightness = HACK_VALUE;

Does anybody have a clue to solve this problem?

Thanks for the help,
Rolando
