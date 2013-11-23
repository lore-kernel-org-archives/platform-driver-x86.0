From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/5] hwmon updates for x86 platform drivers
Date: Sat, 23 Nov 2013 11:03:16 -0800
Message-ID: <1385233401-21517-1-git-send-email-linux@roeck-us.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:36078 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751519Ab3KWTD0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 23 Nov 2013 14:03:26 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, lm-sensors@lm-sensors.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

Common changes:
- Convert to new hwmon API to simplify code and avoid race conditions
  due to late sysfs attribute registration.
  With this change, hwmon sysfs attributes are now always attached
  to the hwmon device and no longer to its parent device (where this
  was the case).
- Replace SENSOR_DEVICE_ATTR with DEVICE_ATTR where appropriate,
  ie if the additional parameter provided by SENSOR_DEVICE_ATTR
  was not used.
- Use devm_kzalloc() instead of kzalloc() where appropriate to reduce
  code size and simplify error path.

All patches were compile tested only. Unfortunately, I don't have
the necessary hardware to test on real systems.
