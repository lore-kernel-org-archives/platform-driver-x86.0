Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD8DC433FE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Nov 2022 22:49:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiKTWtb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 20 Nov 2022 17:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKTWtb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Nov 2022 17:49:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681A225EBD
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Nov 2022 14:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cs/CScwDFSY1xCrkuND+30EfyDTBWRMsz+oh+auzFi8=;
        b=bY5PvcX2GhIREwB6qoUtxUzQg8+CAl8KEgmg903qm1tVtPY6OGcjZS6jmGmTaRGos29oaY
        1hrALeBqh08Y3uOx3Dz67D3e5gLTstL4pFiHe2Fe49rlHb7bH0vJ4pgntGwwCIda0e69pp
        JuD90OJHtyUufJCdLsRph5UEsD1WhL0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-20dy24oIMUWqAjcwIkkBpA-1; Sun, 20 Nov 2022 17:48:31 -0500
X-MC-Unique: 20dy24oIMUWqAjcwIkkBpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FAA71C0691D;
        Sun, 20 Nov 2022 22:48:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9AE662027062;
        Sun, 20 Nov 2022 22:48:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/intel/hid: Add module-params for 5 button array + SW_TABLET_MODE reporting
Date:   Sun, 20 Nov 2022 23:48:20 +0100
Message-Id: <20221120224820.746478-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The driver has DMI-quirk tables for force-enabling 5 button array support
and for 2 different ways of enabling SW_TABLET_MODE reporting.

Add module parameters to allow user to enable the driver behavior currently
only available through DMI quirks.

This is useful for users to test this in bug-reports and for users to use
as a workaround while new DMI quirks find their way upstream.

Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/822
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/hid.c | 36 +++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index b6313ecd190c..b6c06b37862e 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -16,6 +16,25 @@
 #include <linux/suspend.h>
 #include "../dual_accel_detect.h"
 
+enum intel_hid_tablet_sw_mode {
+	TABLET_SW_AUTO = -1,
+	TABLET_SW_OFF  = 0,
+	TABLET_SW_AT_EVENT,
+	TABLET_SW_AT_PROBE,
+};
+
+static bool enable_5_button_array;
+module_param(enable_5_button_array, bool, 0444);
+MODULE_PARM_DESC(enable_5_button_array,
+	"Enable 5 Button Array support. "
+	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+
+static int enable_sw_tablet_mode = TABLET_SW_AUTO;
+module_param(enable_sw_tablet_mode, int, 0444);
+MODULE_PARM_DESC(enable_sw_tablet_mode,
+	"Enable SW_TABLET_MODE reporting -1:auto 0:off 1:at-first-event 2:at-probe. "
+	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+
 /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
 #define TABLET_MODE_FLAG BIT(6)
 
@@ -157,7 +176,6 @@ struct intel_hid_priv {
 	struct input_dev *array;
 	struct input_dev *switches;
 	bool wakeup_mode;
-	bool auto_add_switch;
 };
 
 #define HID_EVENT_FILTER_UUID	"eeec56b3-4442-408f-a792-4edd4d758054"
@@ -487,7 +505,8 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	 * SW_TABLET_MODE report, in these cases we enable support when receiving
 	 * the first event instead of during driver setup.
 	 */
-	if (!priv->switches && priv->auto_add_switch && (event == 0xcc || event == 0xcd)) {
+	if (!priv->switches && enable_sw_tablet_mode == TABLET_SW_AT_EVENT &&
+	    (event == 0xcc || event == 0xcd)) {
 		dev_info(&device->dev, "switch event received, enable switches supports\n");
 		err = intel_hid_switches_setup(device);
 		if (err)
@@ -592,7 +611,7 @@ static bool button_array_present(struct platform_device *device)
 			return true;
 	}
 
-	if (dmi_check_system(button_array_table))
+	if (enable_5_button_array || dmi_check_system(button_array_table))
 		return true;
 
 	return false;
@@ -629,7 +648,14 @@ static int intel_hid_probe(struct platform_device *device)
 	dev_set_drvdata(&device->dev, priv);
 
 	/* See dual_accel_detect.h for more info on the dual_accel check. */
-	priv->auto_add_switch = dmi_check_system(dmi_auto_add_switch) && !dual_accel_detect();
+	if (enable_sw_tablet_mode == TABLET_SW_AUTO) {
+		if (dmi_check_system(dmi_vgbs_allow_list))
+			enable_sw_tablet_mode = TABLET_SW_AT_PROBE;
+		else if (dmi_check_system(dmi_auto_add_switch) && !dual_accel_detect())
+			enable_sw_tablet_mode = TABLET_SW_AT_EVENT;
+		else
+			enable_sw_tablet_mode = TABLET_SW_OFF;
+	}
 
 	err = intel_hid_input_setup(device);
 	if (err) {
@@ -646,7 +672,7 @@ static int intel_hid_probe(struct platform_device *device)
 	}
 
 	/* Setup switches for devices that we know VGBS return correctly */
-	if (dmi_check_system(dmi_vgbs_allow_list)) {
+	if (enable_sw_tablet_mode == TABLET_SW_AT_PROBE) {
 		dev_info(&device->dev, "platform supports switches\n");
 		err = intel_hid_switches_setup(device);
 		if (err)
-- 
2.38.1

