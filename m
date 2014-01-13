From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH RESEND] hp_accel: Add a new PnP ID HPQ6007 for new HP laptops
Date: Mon, 13 Jan 2014 12:32:44 +0100
Message-ID: <1389612764-21495-1-git-send-email-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58407 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751461AbaAMLcp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Jan 2014 06:32:45 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Eric Piel <eric.piel@tremplin-utc.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

The DriveGuard chips on the new HP laptops are with a new PnP ID
"HPQ6007".  It should be compatible with older chips.

Acked-by: =C3=89ric Piel <eric.piel@tremplin-utc.net>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Matthew, this seems to be forgotten for ages,
  https://lkml.org/lkml/2013/3/5/308

Could you pick up, please?  Thanks.


Takashi


 drivers/platform/x86/hp_accel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_=
accel.c
index a8e43cf70fac..0ed96df20162 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -77,6 +77,7 @@ static inline void delayed_sysfs_set(struct led_class=
dev *led_cdev,
 static struct acpi_device_id lis3lv02d_device_ids[] =3D {
 	{"HPQ0004", 0}, /* HP Mobile Data Protection System PNP */
 	{"HPQ6000", 0}, /* HP Mobile Data Protection System PNP */
+	{"HPQ6007", 0}, /* HP Mobile Data Protection System PNP */
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, lis3lv02d_device_ids);
--=20
1.8.5.2
