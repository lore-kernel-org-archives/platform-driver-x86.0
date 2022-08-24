Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC71C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 15:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238845AbiHXPMC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 11:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238039AbiHXPMC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 11:12:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D270892F77
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 08:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661353920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qIsTYsGtRRqqtMPo3U3yKgx0qBsztEG+7HRqvY+0ZP0=;
        b=BnApA1AClCEkyNxQ/SviMMp4zvpeBiugwe4JA6YTRz1kTBJ2iNU0RiWGVSKJTUlIK7e+C2
        2ebudUnHCMNOwBSgrnvf+Jk21fTqG0AaYU1+CC0fVhqXd5cPy9gBKSwc/DKUtUrdnRwmTR
        vJE5wX+GPtuxjPaZdqKb8+P3hHdOQ8w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-e_epLFNtM5WOd_pAjqQdgg-1; Wed, 24 Aug 2022 11:11:56 -0400
X-MC-Unique: e_epLFNtM5WOd_pAjqQdgg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A19131C14D47;
        Wed, 24 Aug 2022 15:11:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CFF861121315;
        Wed, 24 Aug 2022 15:11:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        "Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH 2/2] drivers/platform: asus-wmi: Simplify tablet-mode-switch handling
Date:   Wed, 24 Aug 2022 17:11:45 +0200
Message-Id: <20220824151145.1448010-2-hdegoede@redhat.com>
In-Reply-To: <20220824151145.1448010-1-hdegoede@redhat.com>
References: <20220824151145.1448010-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Simplify tablet-mode-switch handling:
1. The code is the same for all variants, the only difference is the
   dev_id and notify event code. Store the dev_id + code in struct asus_wmi
   and unify the handling
2. Make the new unified asus_wmi_tablet_mode_get_state() check dev_id has
   been set and make it a no-op when not set. This allows calling it
   unconditionally at resume/restore time
3. Simplify the tablet_mode_sw module-param handling, this also allows
   selecting the new lid-flip-rog type through the module-param.

Cc: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 13 +----
 drivers/platform/x86/asus-wmi.c    | 76 ++++++------------------------
 2 files changed, 16 insertions(+), 73 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index d9e7cf6e4a0e..cb8af61d684c 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -504,17 +504,8 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 	else
 		wapf = quirks->wapf;
 
-	switch (tablet_mode_sw) {
-	case 0:
-		quirks->tablet_switch_mode = asus_wmi_no_tablet_switch;
-		break;
-	case 1:
-		quirks->tablet_switch_mode = asus_wmi_kbd_dock_devid;
-		break;
-	case 2:
-		quirks->tablet_switch_mode = asus_wmi_lid_flip_devid;
-		break;
-	}
+	if (tablet_mode_sw != -1)
+		quirks->tablet_switch_mode = tablet_mode_sw;
 
 	if (quirks->i8042_filter) {
 		ret = i8042_install_filter(quirks->i8042_filter);
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index d71daa024752..0f9f79f249c7 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -222,6 +222,9 @@ struct asus_wmi {
 	struct asus_rfkill gps;
 	struct asus_rfkill uwb;
 
+	int tablet_switch_event_code;
+	u32 tablet_switch_dev_id;
+
 	enum fan_type fan_type;
 	int fan_pwm_mode;
 	int agfn_pwm;
@@ -490,11 +493,11 @@ static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event
 	int result;
 
 	result = asus_wmi_get_devstate_simple(asus, dev_id);
-	if (result < 0)
-		asus->driver->quirks->tablet_switch_mode = asus_wmi_no_tablet_switch;
 	if (result >= 0) {
 		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
 		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
+		asus->tablet_switch_dev_id = dev_id;
+		asus->tablet_switch_event_code = event_code;
 	} else if (result == -ENODEV) {
 		dev_err(dev, "This device has tablet-mode-switch quirk but got ENODEV checking it. This is a bug.");
 	} else {
@@ -556,22 +559,14 @@ static void asus_wmi_input_exit(struct asus_wmi *asus)
 
 /* Tablet mode ****************************************************************/
 
-static void lid_flip_tablet_mode_get_state(struct asus_wmi *asus)
+static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
 {
 	int result;
 
-	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
-	if (result >= 0) {
-		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
-		input_sync(asus->inputdev);
-	}
-}
-
-static void lid_flip_rog_tablet_mode_get_state(struct asus_wmi *asus)
-{
-	int result;
+	if (!asus->tablet_switch_dev_id)
+		return;
 
-	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP_ROG);
+	result = asus_wmi_get_devstate_simple(asus, asus->tablet_switch_dev_id);
 	if (result >= 0) {
 		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
 		input_sync(asus->inputdev);
@@ -3020,9 +3015,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
 	unsigned int key_value = 1;
 	bool autorelease = 1;
-	int result, orig_code;
-
-	orig_code = code;
+	int orig_code = code;
 
 	if (asus->driver->key_filter) {
 		asus->driver->key_filter(asus->driver, &code, &key_value,
@@ -3065,27 +3058,8 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	if (asus->driver->quirks->tablet_switch_mode == asus_wmi_kbd_dock_devid &&
-	    code == NOTIFY_KBD_DOCK_CHANGE) {
-		result = asus_wmi_get_devstate_simple(asus,
-						      ASUS_WMI_DEVID_KBD_DOCK);
-		if (result >= 0) {
-			input_report_switch(asus->inputdev, SW_TABLET_MODE,
-					    !result);
-			input_sync(asus->inputdev);
-		}
-		return;
-	}
-
-	if (asus->driver->quirks->tablet_switch_mode == asus_wmi_lid_flip_devid &&
-	    code == NOTIFY_LID_FLIP) {
-		lid_flip_tablet_mode_get_state(asus);
-		return;
-	}
-
-	if (asus->driver->quirks->tablet_switch_mode == asus_wmi_lid_flip_rog_devid &&
-	    code == NOTIFY_LID_FLIP_ROG) {
-		lid_flip_rog_tablet_mode_get_state(asus);
+	if (code == asus->tablet_switch_event_code) {
+		asus_wmi_tablet_mode_get_state(asus);
 		return;
 	}
 
@@ -3714,18 +3688,7 @@ static int asus_hotk_resume(struct device *device)
 	if (asus_wmi_has_fnlock_key(asus))
 		asus_wmi_fnlock_update(asus);
 
-	switch (asus->driver->quirks->tablet_switch_mode) {
-	case asus_wmi_no_tablet_switch:
-	case asus_wmi_kbd_dock_devid:
-		break;
-	case asus_wmi_lid_flip_devid:
-		lid_flip_tablet_mode_get_state(asus);
-		break;
-	case asus_wmi_lid_flip_rog_devid:
-		lid_flip_rog_tablet_mode_get_state(asus);
-		break;
-	}
-
+	asus_wmi_tablet_mode_get_state(asus);
 	return 0;
 }
 
@@ -3765,18 +3728,7 @@ static int asus_hotk_restore(struct device *device)
 	if (asus_wmi_has_fnlock_key(asus))
 		asus_wmi_fnlock_update(asus);
 
-	switch (asus->driver->quirks->tablet_switch_mode) {
-	case asus_wmi_no_tablet_switch:
-	case asus_wmi_kbd_dock_devid:
-		break;
-	case asus_wmi_lid_flip_devid:
-		lid_flip_tablet_mode_get_state(asus);
-		break;
-	case asus_wmi_lid_flip_rog_devid:
-		lid_flip_rog_tablet_mode_get_state(asus);
-		break;
-	}
-
+	asus_wmi_tablet_mode_get_state(asus);
 	return 0;
 }
 
-- 
2.37.2

