From: Giedrius Statkevicius <giedriuswork@gmail.com>
Subject: [PATCH] drivers: platform: change 0x20 to I8042_STR_AUXDATA in i8042 filters
Date: Sat, 18 Oct 2014 02:57:20 +0300
Message-ID: <1413590240-18762-1-git-send-email-giedriuswork@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:50539 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbaJQX5r (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Oct 2014 19:57:47 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: mjg59@srcf.ucam.org, jlee@suse.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

=46rom: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>

Instead of using a magic constant 0x20 in some drivers to get data only
from the KBC port we should use the constant defined in i8042.h with
the same value. Also, this makes these drivers uniform with what
constant the only other filter function uses in=20
drivers/input/misc/ideapad_slidebar.c.

Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>
---
 drivers/platform/x86/dell-laptop.c  | 2 +-
 drivers/platform/x86/msi-laptop.c   | 2 +-
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 233d2ee..60bfc8e 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -564,7 +564,7 @@ static bool dell_laptop_i8042_filter(unsigned char =
data, unsigned char str,
 {
 	static bool extended;
=20
-	if (str & 0x20)
+	if (str & I8042_STR_AUXDATA)
 		return false;
=20
 	if (unlikely(data =3D=3D 0xe0)) {
diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/m=
si-laptop.c
index 62f8030..206a7d9 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -821,7 +821,7 @@ static bool msi_laptop_i8042_filter(unsigned char d=
ata, unsigned char str,
 {
 	static bool extended;
=20
-	if (str & 0x20)
+	if (str & I8042_STR_AUXDATA)
 		return false;
=20
 	/* 0x54 wwan, 0x62 bluetooth, 0x76 wlan, 0xE4 touchpad toggle*/
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86=
/toshiba_acpi.c
index ef3a190..201007b 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1583,7 +1583,7 @@ static umode_t toshiba_sysfs_is_visible(struct ko=
bject *kobj,
 static bool toshiba_acpi_i8042_filter(unsigned char data, unsigned cha=
r str,
 				      struct serio *port)
 {
-	if (str & 0x20)
+	if (str & I8042_STR_AUXDATA)
 		return false;
=20
 	if (unlikely(data =3D=3D 0xe0))
--=20
