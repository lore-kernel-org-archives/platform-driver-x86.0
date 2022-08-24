Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1321C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 15:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238827AbiHXPL7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 11:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238039AbiHXPL6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 11:11:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762EA92F67
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661353916;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=JjvEvWpVQObDEctpZ5deFovSJx3NuM3FBCCpU6Q01x0=;
        b=bARDjTF4ysAyYeBESL1h1FzbMnLDhoVOQaWGxMt9aTcbYsSIh4MMfDiC2ow8lAlvwgEsgT
        AYJwbWRwDp92gF5/03RcnltAhtmAVyWzB7e4xDRJsExU3Tk64v4/flRjhI/l7AWYD7cZ/z
        uE1rc3Oevbb+5orDn0qt47eUA0gE+sE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-Pri-FbsqPreoFtb_M1n-6A-1; Wed, 24 Aug 2022 11:11:55 -0400
X-MC-Unique: Pri-FbsqPreoFtb_M1n-6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B3B03815D48;
        Wed, 24 Aug 2022 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BF0911121315;
        Wed, 24 Aug 2022 15:11:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        "Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH 1/2] platform/x86: asus-wmi: Simplify tablet-mode-switch probing
Date:   Wed, 24 Aug 2022 17:11:44 +0200
Message-Id: <20220824151145.1448010-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The 3 different tablet-mode-switch initialization paths repeat a lot
of the same code. Add a helper function for this.

This also makes the error-handling for the kbd_dock_devid case consistent
with the other 2 cases.

Cc: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 55 +++++++++++++--------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 5352055848d0..d71daa024752 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -484,13 +484,28 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
 }
 
 /* Input **********************************************************************/
+static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event_code)
+{
+	struct device *dev = &asus->platform_device->dev;
+	int result;
+
+	result = asus_wmi_get_devstate_simple(asus, dev_id);
+	if (result < 0)
+		asus->driver->quirks->tablet_switch_mode = asus_wmi_no_tablet_switch;
+	if (result >= 0) {
+		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
+		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
+	} else if (result == -ENODEV) {
+		dev_err(dev, "This device has tablet-mode-switch quirk but got ENODEV checking it. This is a bug.");
+	} else {
+		dev_err(dev, "Error checking for tablet-mode-switch: %d\n", result);
+	}
+}
 
 static int asus_wmi_input_init(struct asus_wmi *asus)
 {
-	struct device *dev;
-	int err, result;
-
-	dev = &asus->platform_device->dev;
+	struct device *dev = &asus->platform_device->dev;
+	int err;
 
 	asus->inputdev = input_allocate_device();
 	if (!asus->inputdev)
@@ -510,39 +525,13 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 	case asus_wmi_no_tablet_switch:
 		break;
 	case asus_wmi_kbd_dock_devid:
-		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
-		if (result >= 0) {
-			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
-			input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
-		} else if (result != -ENODEV) {
-			dev_err(dev, "Error checking for keyboard-dock: %d\n", result);
-		}
+		asus_wmi_tablet_sw_init(asus, ASUS_WMI_DEVID_KBD_DOCK, NOTIFY_KBD_DOCK_CHANGE);
 		break;
 	case asus_wmi_lid_flip_devid:
-		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
-		if (result < 0)
-			asus->driver->quirks->tablet_switch_mode = asus_wmi_no_tablet_switch;
-		if (result >= 0) {
-			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
-			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
-		} else if (result == -ENODEV) {
-			dev_err(dev, "This device has lid_flip quirk but got ENODEV checking it. This is a bug.");
-		} else {
-			dev_err(dev, "Error checking for lid-flip: %d\n", result);
-		}
+		asus_wmi_tablet_sw_init(asus, ASUS_WMI_DEVID_LID_FLIP, NOTIFY_LID_FLIP);
 		break;
 	case asus_wmi_lid_flip_rog_devid:
-		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP_ROG);
-		if (result < 0)
-			asus->driver->quirks->tablet_switch_mode = asus_wmi_no_tablet_switch;
-		if (result >= 0) {
-			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
-			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
-		} else if (result == -ENODEV) {
-			dev_err(dev, "This device has lid-flip-rog quirk but got ENODEV checking it. This is a bug.");
-		} else {
-			dev_err(dev, "Error checking for lid-flip: %d\n", result);
-		}
+		asus_wmi_tablet_sw_init(asus, ASUS_WMI_DEVID_LID_FLIP_ROG, NOTIFY_LID_FLIP_ROG);
 		break;
 	}
 
-- 
2.37.2

