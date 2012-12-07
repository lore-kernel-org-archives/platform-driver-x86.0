From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v3 05/12] msi-laptop: Add missing ABI documentation
Date: Fri,  7 Dec 2012 15:49:15 +0200
Message-ID: <1354888162-12109-6-git-send-email-maxtram95@gmail.com>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62343 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030475Ab2LGNt7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Dec 2012 08:49:59 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so289080eek.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Dec 2012 05:49:59 -0800 (PST)
In-Reply-To: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Add ABI documentation for all sysfs files exposed by msi-laptop driver.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 .../ABI/testing/sysfs-platform-msi-laptop          | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-msi-laptop

diff --git a/Documentation/ABI/testing/sysfs-platform-msi-laptop b/Documentation/ABI/testing/sysfs-platform-msi-laptop
new file mode 100644
index 0000000..307a247
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-msi-laptop
@@ -0,0 +1,83 @@
+What:		/sys/devices/platform/msi-laptop-pf/lcd_level
+Date:		Oct 2006
+KernelVersion:	2.6.19
+Contact:	"Lennart Poettering <mzxreary@0pointer.de>"
+Description:
+		Screen brightness: contains a single integer in the range 0..8.
+
+What:		/sys/devices/platform/msi-laptop-pf/auto_brightness
+Date:		Oct 2006
+KernelVersion:	2.6.19
+Contact:	"Lennart Poettering <mzxreary@0pointer.de>"
+Description:
+		Enable automatic brightness control: contains either 0 or 1. If
+		set to 1 the hardware adjusts the screen brightness
+		automatically when the power cord is plugged/unplugged.
+
+What:		/sys/devices/platform/msi-laptop-pf/wlan
+Date:		Oct 2006
+KernelVersion:	2.6.19
+Contact:	"Lennart Poettering <mzxreary@0pointer.de>"
+Description:
+		WLAN subsystem enabled: contains either 0 or 1.
+
+What:		/sys/devices/platform/msi-laptop-pf/bluetooth
+Date:		Oct 2006
+KernelVersion:	2.6.19
+Contact:	"Lennart Poettering <mzxreary@0pointer.de>"
+Description:
+		Bluetooth subsystem enabled: contains either 0 or 1. Please
+		note that this file is constantly 0 if no Bluetooth hardware is
+		available.
+
+What:		/sys/devices/platform/msi-laptop-pf/touchpad
+Date:		Nov 2012
+KernelVersion:	3.8
+Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
+Description:
+		Contains either 0 or 1 and indicates if touchpad is turned on.
+		Touchpad state can only be toggled by pressing Fn+F3.
+
+What:		/sys/devices/platform/msi-laptop-pf/turbo_mode
+Date:		Nov 2012
+KernelVersion:	3.8
+Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
+Description:
+		Contains either 0 or 1 and indicates if turbo mode is turned
+		on. In turbo mode power LED is orange and processor is
+		overclocked. Turbo mode is available only if charging. It is
+		only possible to toggle turbo mode state by pressing Fn+F10,
+		and there is a few seconds cooldown between subsequent toggles.
+		If user presses Fn+F10 too frequent, turbo mode state is not
+		changed.
+
+What:		/sys/devices/platform/msi-laptop-pf/eco_mode
+Date:		Nov 2012
+KernelVersion:	3.8
+Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
+Description:
+		Contains either 0 or 1 and indicates if ECO mode is turned on.
+		In ECO mode power LED is green and userspace should do some
+		powersaving actions. ECO mode is available only on battery
+		power. ECO mode can only be toggled by pressing Fn+F10.
+
+What:		/sys/devices/platform/msi-laptop-pf/turbo_cooldown
+Date:		Nov 2012
+KernelVersion:	3.8
+Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
+Description:
+		Contains value in range 0..3:
+			* 0 -> Turbo mode is off
+			* 1 -> Turbo mode is on, cannot be turned off yet
+			* 2 -> Turbo mode is off, cannot be turned on yet
+			* 3 -> Turbo mode is on
+
+What:		/sys/devices/platform/msi-laptop-pf/auto_fan
+Date:		Nov 2012
+KernelVersion:	3.8
+Contact:	"Maxim Mikityanskiy <maxtram95@gmail.com>"
+Description:
+		Contains either 0 or 1 and indicates if fan speed is controlled
+		automatically (1) or fan runs at maximal speed (0). Can be
+		toggled in software.
+
-- 
1.8.0.1
