From: Giedrius Statkevicius <giedriuswork@gmail.com>
Subject: [PATCH] platform: hp_accel: Add SERIO_I8042 as a dependency since it now includes i8042.h/serio.h
Date: Mon, 10 Nov 2014 20:59:42 +0200
Message-ID: <1415645982-9472-1-git-send-email-giedriuswork@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:65080 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752101AbaKJTAq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Nov 2014 14:00:46 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jim.epost@gmail.com, =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedriuswork@gmail.com>

Make hp_accel dependent on SERIO_I8042 in the Kconfig because since com=
mit
a4c724d0723b078e4ab4670e557cda1795036a7a ('platform: hp_accel: add a i8=
042
filter to remove HPQ6000 data from kb bus stream') hp_accel includes i8=
042.h
and serio.h.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 4dcfb71..7d146e68 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -202,6 +202,7 @@ config TC1100_WMI
 config HP_ACCEL
 	tristate "HP laptop accelerometer"
 	depends on INPUT && ACPI
+        depends on SERIO_I8042
 	select SENSORS_LIS3LV02D
 	select NEW_LEDS
 	select LEDS_CLASS
--=20
2.1.3
