From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 5/9] asus-laptop: add rfkill interfaces for wlan and wwan
Date: Thu, 15 Dec 2011 08:27:35 +0100
Message-ID: <1323934059-1221-6-git-send-email-corentincj@iksaif.net>
References: <1323934059-1221-1-git-send-email-corentincj@iksaif.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323934059-1221-1-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Corentin Chary <corentincj@iksaif.net>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Corentin Chary <corentin.chary@gmail.com>

But don't try to do than on pegatron tablets to avoid any
conflict.

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-laptop.c |   24 +++++++++++++++++++++++-
 1 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 43c74ed..0bdd966 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -282,6 +282,7 @@ struct asus_laptop {
 	struct asus_rfkill wlan;
 	struct asus_rfkill bluetooth;
 	struct asus_rfkill wwan;
+	struct asus_rfkill wimax;
 	struct asus_rfkill gps;
 
 	acpi_handle handle;	/* the handle of the hotk device */
@@ -1291,6 +1292,10 @@ static int asus_rfkill_set(void *data, bool blocked)
 		return asus_wlan_set(asus, !blocked);
 	else if (rfk->control_id == BT_RSTS)
 		return asus_bluetooth_set(asus, !blocked);
+	else if (rfk->control_id == WM_RSTS)
+		return asus_wimax_set(asus, !blocked);
+	else if (rfk->control_id == WW_RSTS)
+		return asus_wwan_set(asus, !blocked);
 
 	return -EINVAL;
 }
@@ -1343,6 +1348,9 @@ static int asus_rfkill_init(struct asus_laptop *asus)
 {
 	int result = 0;
 
+	if (asus->is_pega_lucid)
+		return -ENODEV;
+
 	if (!acpi_check_handle(asus->handle, METHOD_GPS_ON, NULL) &&
 	    !acpi_check_handle(asus->handle, METHOD_GPS_OFF, NULL) &&
 	    !acpi_check_handle(asus->handle, METHOD_GPS_STATUS, NULL))
@@ -1368,6 +1376,20 @@ static int asus_rfkill_init(struct asus_laptop *asus)
 	if (result)
 		goto exit;
 
+	if (!acpi_check_handle(asus->handle, METHOD_WWAN, NULL))
+		result = asus_rfkill_setup(asus, &asus->wwan, "asus-wwan",
+					   WW_RSTS, RFKILL_TYPE_WWAN,
+					   &asus_rfkill_ops);
+	if (result)
+		goto exit;
+
+	if (!acpi_check_handle(asus->handle, METHOD_WIMAX, NULL))
+		result = asus_rfkill_setup(asus, &asus->wimax, "asus-wimax",
+					   WM_RSTS, RFKILL_TYPE_WIMAX,
+					   &asus_rfkill_ops);
+	if (result)
+		goto exit;
+
 exit:
 	if (result)
 		asus_rfkill_exit(asus);
@@ -1859,7 +1881,7 @@ static int __devinit asus_acpi_add(struct acpi_device *device)
 		goto fail_led;
 
 	result = asus_rfkill_init(asus);
-	if (result)
+	if (result && result != -ENODEV)
 		goto fail_rfkill;
 
 	result = pega_accel_init(asus);
-- 
1.7.5.4
