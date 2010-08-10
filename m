From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 1/5] thinkpad-acpi: find ACPI video device by synthetic HID
Date: Mon,  9 Aug 2010 23:48:18 -0300
Message-ID: <1281408502-7757-2-git-send-email-hmh@hmh.eng.br>
References: <1281408502-7757-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:33550 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754656Ab0HJCs3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Aug 2010 22:48:29 -0400
In-Reply-To: <1281408502-7757-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

The Linux ACPI core locates the ACPI video devices for us and marks them
with ACPI_VIDEO_HID.  Use that information to locate the video device
instead of a half-baked hunt for _BCL.

This uncouples the detection of the number of backlight brightness
levels on ThinkPads from the ACPI paths in vid_handle.

With this change, the driver should be able to always detect whether the
ThinkPad uses a 8-level or 16-level brightness scale even on newer
models for which the vid_handle paths have not been updated yet.

It will skip deactivated devices in the ACPI device tree, which is a
change in behaviour.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |   52 ++++++++--------------------------
 1 files changed, 12 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 4bdb137..eb44103 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6149,13 +6149,18 @@ static struct backlight_ops ibm_backlight_data = {
 
 /* --------------------------------------------------------------------- */
 
+/*
+ * Call _BCL method of video device.  On some ThinkPads this will
+ * switch the firmware to the ACPI brightness control mode.
+ */
+
 static int __init tpacpi_query_bcl_levels(acpi_handle handle)
 {
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
 	int rc;
 
-	if (ACPI_SUCCESS(acpi_evaluate_object(handle, NULL, NULL, &buffer))) {
+	if (ACPI_SUCCESS(acpi_evaluate_object(handle, "_BCL", NULL, &buffer))) {
 		obj = (union acpi_object *)buffer.pointer;
 		if (!obj || (obj->type != ACPI_TYPE_PACKAGE)) {
 			printk(TPACPI_ERR "Unknown _BCL data, "
@@ -6172,55 +6177,22 @@ static int __init tpacpi_query_bcl_levels(acpi_handle handle)
 	return rc;
 }
 
-static acpi_status __init tpacpi_acpi_walk_find_bcl(acpi_handle handle,
-					u32 lvl, void *context, void **rv)
-{
-	char name[ACPI_PATH_SEGMENT_LENGTH];
-	struct acpi_buffer buffer = { sizeof(name), &name };
-
-	if (ACPI_SUCCESS(acpi_get_name(handle, ACPI_SINGLE_NAME, &buffer)) &&
-	    !strncmp("_BCL", name, sizeof(name) - 1)) {
-		BUG_ON(!rv || !*rv);
-		**(int **)rv = tpacpi_query_bcl_levels(handle);
-		return AE_CTRL_TERMINATE;
-	} else {
-		return AE_OK;
-	}
-}
 
 /*
  * Returns 0 (no ACPI _BCL or _BCL invalid), or size of brightness map
  */
 static unsigned int __init tpacpi_check_std_acpi_brightness_support(void)
 {
-	int status;
+	acpi_handle video_device;
 	int bcl_levels = 0;
-	void *bcl_ptr = &bcl_levels;
 
-	if (!vid_handle)
-		TPACPI_ACPIHANDLE_INIT(vid);
+	tpacpi_acpi_handle_locate("video", ACPI_VIDEO_HID, &video_device);
+	if (video_device)
+		bcl_levels = tpacpi_query_bcl_levels(video_device);
 
-	if (!vid_handle)
-		return 0;
-
-	/*
-	 * Search for a _BCL method, and execute it.  This is safe on all
-	 * ThinkPads, and as a side-effect, _BCL will place a Lenovo Vista
-	 * BIOS in ACPI backlight control mode.  We do NOT have to care
-	 * about calling the _BCL method in an enabled video device, any
-	 * will do for our purposes.
-	 */
+	tp_features.bright_acpimode = (bcl_levels > 0);
 
-	status = acpi_walk_namespace(ACPI_TYPE_METHOD, vid_handle, 3,
-				     tpacpi_acpi_walk_find_bcl, NULL, NULL,
-				     &bcl_ptr);
-
-	if (ACPI_SUCCESS(status) && bcl_levels > 2) {
-		tp_features.bright_acpimode = 1;
-		return bcl_levels - 2;
-	}
-
-	return 0;
+	return (bcl_levels > 2) ? (bcl_levels - 2) : 0;
 }
 
 /*
-- 
1.7.1
