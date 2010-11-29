From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 06/10] eeepc-wmi: fix confusion between ctrl_param and retval
Date: Mon, 29 Nov 2010 08:14:10 +0100
Message-ID: <1291014854-17961-7-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:48451 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754873Ab0K2HPI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:08 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 57BEE862B0
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:07 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |   34 +++++++++++++++++-----------------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 253070a..78306be 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -164,7 +164,7 @@ static void eeepc_wmi_input_exit(struct eeepc_wmi *eeepc)
 	eeepc->inputdev = NULL;
 }
 
-static acpi_status eeepc_wmi_get_devstate(u32 dev_id, u32 *ctrl_param)
+static acpi_status eeepc_wmi_get_devstate(u32 dev_id, u32 *retval)
 {
 	struct acpi_buffer input = { (acpi_size)sizeof(u32), &dev_id };
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -184,8 +184,8 @@ static acpi_status eeepc_wmi_get_devstate(u32 dev_id, u32 *ctrl_param)
 	else
 		tmp = 0;
 
-	if (ctrl_param)
-		*ctrl_param = tmp;
+	if (retval)
+		*retval = tmp;
 
 	kfree(obj);
 
@@ -266,14 +266,14 @@ static void tpd_led_set(struct led_classdev *led_cdev,
 
 static int read_tpd_state(struct eeepc_wmi *eeepc)
 {
-	static u32 ctrl_param;
+	static u32 retval;
 	acpi_status status;
 
-	status = eeepc_wmi_get_devstate(EEEPC_WMI_DEVID_TPDLED, &ctrl_param);
+	status = eeepc_wmi_get_devstate(EEEPC_WMI_DEVID_TPDLED, &retval);
 
 	if (ACPI_FAILURE(status))
 		return -1;
-	else if (!ctrl_param || ctrl_param == 0x00060000)
+	else if (!retval || retval == 0x00060000)
 		/*
 		 * if touchpad led is present, DSTS will set some bits,
 		 * usually 0x00020000.
@@ -282,7 +282,7 @@ static int read_tpd_state(struct eeepc_wmi *eeepc)
 		return -ENODEV;
 	else
 		/* Status is stored in the first bit */
-		return ctrl_param & 0x1;
+		return retval & 0x1;
 }
 
 static enum led_brightness tpd_led_get(struct led_classdev *led_cdev)
@@ -343,15 +343,15 @@ static int eeepc_rfkill_set(void *data, bool blocked)
 static void eeepc_rfkill_query(struct rfkill *rfkill, void *data)
 {
 	int dev_id = (unsigned long)data;
-	u32 ctrl_param;
+	u32 retval;
 	acpi_status status;
 
-	status = eeepc_wmi_get_devstate(dev_id, &ctrl_param);
+	status = eeepc_wmi_get_devstate(dev_id, &retval);
 
 	if (ACPI_FAILURE(status))
 		return ;
 
-	rfkill_set_sw_state(rfkill, !(ctrl_param & 0x1));
+	rfkill_set_sw_state(rfkill, !(retval & 0x1));
 }
 
 static const struct rfkill_ops eeepc_rfkill_ops = {
@@ -365,10 +365,10 @@ static int eeepc_new_rfkill(struct eeepc_wmi *eeepc,
 			    enum rfkill_type type, int dev_id)
 {
 	int result;
-	u32 ctrl_param;
+	u32 retval;
 	acpi_status status;
 
-	status = eeepc_wmi_get_devstate(dev_id, &ctrl_param);
+	status = eeepc_wmi_get_devstate(dev_id, &retval);
 
 	if (ACPI_FAILURE(status))
 		return -1;
@@ -379,7 +379,7 @@ static int eeepc_new_rfkill(struct eeepc_wmi *eeepc,
 	 * 0x00020000 - 0100000000000000000 - device supported
 	 * 0x00010000 - 0010000000000000000 - not supported / special mode ?
 	 */
-	if (!ctrl_param || ctrl_param == 0x00060000)
+	if (!retval || retval == 0x00060000)
 		return -ENODEV;
 
 	*rfkill = rfkill_alloc(name, &eeepc->platform_device->dev, type,
@@ -388,7 +388,7 @@ static int eeepc_new_rfkill(struct eeepc_wmi *eeepc,
 	if (!*rfkill)
 		return -EINVAL;
 
-	rfkill_init_sw_state(*rfkill, !(ctrl_param & 0x1));
+	rfkill_init_sw_state(*rfkill, !(retval & 0x1));
 	result = rfkill_register(*rfkill);
 	if (result) {
 		rfkill_destroy(*rfkill);
@@ -457,15 +457,15 @@ exit:
  */
 static int read_brightness(struct backlight_device *bd)
 {
-	static u32 ctrl_param;
+	static u32 retval;
 	acpi_status status;
 
-	status = eeepc_wmi_get_devstate(EEEPC_WMI_DEVID_BACKLIGHT, &ctrl_param);
+	status = eeepc_wmi_get_devstate(EEEPC_WMI_DEVID_BACKLIGHT, &retval);
 
 	if (ACPI_FAILURE(status))
 		return -1;
 	else
-		return ctrl_param & 0xFF;
+		return retval & 0xFF;
 }
 
 static int update_bl_status(struct backlight_device *bd)
-- 
1.7.3.2
