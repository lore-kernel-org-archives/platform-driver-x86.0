Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFE3C38159
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Jan 2023 14:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjATOgF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Jan 2023 09:36:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjATOfz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Jan 2023 09:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9D27ED76
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Jan 2023 06:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674225287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=6hqleG6cuHKDOuz0rY92+EJxuQGEEkGe8XFyfi+2crY=;
        b=i+DwBzoG9AONKKjJuPbMwuB+gON5eJ/hvO7rEsR2V/UD+NORWA/eY6k6Tah7gqTcYyMSQu
        w1vNGInZmRi32Y/KIjiuQ5n2eSSFgI0/XScVBurco0xsx5uJqahuSJe0xbmLtBAQvKl+/L
        +1H4m9Gk1VHF9abedPgQZL+RNKp09rE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-AViiw4hqM3qf9WmjedJs5A-1; Fri, 20 Jan 2023 09:34:44 -0500
X-MC-Unique: AViiw4hqM3qf9WmjedJs5A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82F0D802BEE;
        Fri, 20 Jan 2023 14:34:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.101])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 84602492B02;
        Fri, 20 Jan 2023 14:34:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: Fix kbd_dock_devid tablet-switch reporting
Date:   Fri, 20 Jan 2023 15:34:41 +0100
Message-Id: <20230120143441.527334-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit 1ea0d3b46798 ("platform/x86: asus-wmi: Simplify tablet-mode-switch
handling") unified the asus-wmi tablet-switch handling, but it did not take
into account that the value returned for the kbd_dock_devid WMI method is
inverted where as the other ones are not inverted.

This causes asus-wmi to report an inverted tablet-switch state for devices
which use the kbd_dock_devid, which causes libinput to ignore touchpad
events while the affected T10x model 2-in-1s are docked.

Add inverting of the return value in the kbd_dock_devid case to fix this.

Fixes: 1ea0d3b46798 ("platform/x86: asus-wmi: Simplify tablet-mode-switch handling")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 104188d70988..1038dfdcdd32 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -225,6 +225,7 @@ struct asus_wmi {
 
 	int tablet_switch_event_code;
 	u32 tablet_switch_dev_id;
+	bool tablet_switch_inverted;
 
 	enum fan_type fan_type;
 	enum fan_type gpu_fan_type;
@@ -493,6 +494,13 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
 }
 
 /* Input **********************************************************************/
+static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
+{
+	input_report_switch(asus->inputdev, SW_TABLET_MODE,
+			    asus->tablet_switch_inverted ? !value : value);
+	input_sync(asus->inputdev);
+}
+
 static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event_code)
 {
 	struct device *dev = &asus->platform_device->dev;
@@ -501,7 +509,7 @@ static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event
 	result = asus_wmi_get_devstate_simple(asus, dev_id);
 	if (result >= 0) {
 		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
-		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
+		asus_wmi_tablet_sw_report(asus, result);
 		asus->tablet_switch_dev_id = dev_id;
 		asus->tablet_switch_event_code = event_code;
 	} else if (result == -ENODEV) {
@@ -534,6 +542,7 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 	case asus_wmi_no_tablet_switch:
 		break;
 	case asus_wmi_kbd_dock_devid:
+		asus->tablet_switch_inverted = true;
 		asus_wmi_tablet_sw_init(asus, ASUS_WMI_DEVID_KBD_DOCK, NOTIFY_KBD_DOCK_CHANGE);
 		break;
 	case asus_wmi_lid_flip_devid:
@@ -573,10 +582,8 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
 		return;
 
 	result = asus_wmi_get_devstate_simple(asus, asus->tablet_switch_dev_id);
-	if (result >= 0) {
-		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
-		input_sync(asus->inputdev);
-	}
+	if (result >= 0)
+		asus_wmi_tablet_sw_report(asus, result);
 }
 
 /* dGPU ********************************************************************/
-- 
2.39.0

