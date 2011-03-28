From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: does not set persistence state by rfkill_init_sw_state
Date: Mon, 28 Mar 2011 16:52:02 +0800
Message-ID: <1301302322-5233-1-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:56806 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753210Ab1C1Iyx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2011 04:54:53 -0400
Received: by gwaa18 with SMTP id a18so1090391gwa.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Mar 2011 01:54:53 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, =?utf-8?q?Old=C5=99ich=20Jedli=C4=8Dka?= <oldium.pro@seznam.cz>, Johannes Berg <johannes@sipsolutions.net>

Acer BIOS keeps devices state when system reboot, but reset to default
device states (Wlan on, Bluetooth off, wwan on) if system cold boot.
That means BIOS's initial state is not always real persistence.

So, removed rfkill_init_sw_state because it sets initial state to
persistence then replicate to other new killswitch when rfkill-input
enabled.
After removed it, acer-wmi set initial soft-block state after rfkill
register, and doesn't allow set_block until rfkill initial finished.

Reference: bko#31002
	https://bugzilla.kernel.org/show_bug.cgi?id=3D31002

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Old=C5=99ich Jedli=C4=8Dka <oldium.pro@seznam.cz>
Cc: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |   19 ++++++++++++++-----
 1 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index 5839fac..5b38ae4 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -222,6 +222,7 @@ struct acer_debug {
 static struct rfkill *wireless_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *threeg_rfkill;
+static bool rfkill_inited;
=20
 /* Each low-level interface must define at least some of the following=
 */
 struct wmi_interface {
@@ -1162,9 +1163,13 @@ static int acer_rfkill_set(void *data, bool bloc=
ked)
 {
 	acpi_status status;
 	u32 cap =3D (unsigned long)data;
-	status =3D set_u32(!blocked, cap);
-	if (ACPI_FAILURE(status))
-		return -ENODEV;
+
+	if (rfkill_inited) {
+		status =3D set_u32(!blocked, cap);
+		if (ACPI_FAILURE(status))
+			return -ENODEV;
+	}
+
 	return 0;
 }
=20
@@ -1188,14 +1193,16 @@ static struct rfkill *acer_rfkill_register(stru=
ct device *dev,
 		return ERR_PTR(-ENOMEM);
=20
 	status =3D get_device_status(&state, cap);
-	if (ACPI_SUCCESS(status))
-		rfkill_init_sw_state(rfkill_dev, !state);
=20
 	err =3D rfkill_register(rfkill_dev);
 	if (err) {
 		rfkill_destroy(rfkill_dev);
 		return ERR_PTR(err);
 	}
+
+	if (ACPI_SUCCESS(status))
+		rfkill_set_sw_state(rfkill_dev, !state);
+
 	return rfkill_dev;
 }
=20
@@ -1230,6 +1237,8 @@ static int acer_rfkill_init(struct device *dev)
 		}
 	}
=20
+	rfkill_inited =3D true;
+
 	schedule_delayed_work(&acer_rfkill_work, round_jiffies_relative(HZ));
=20
 	return 0;
--=20
1.6.0.2
