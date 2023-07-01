Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8000BEB64DA
	for <platform-driver-x86@archiver.kernel.org>; Sat,  1 Jul 2023 00:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjGAAno (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Jun 2023 20:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjGAAnn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Jun 2023 20:43:43 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5023C3C02
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Jun 2023 17:43:42 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5ED0A3200952;
        Fri, 30 Jun 2023 20:43:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 30 Jun 2023 20:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1688172220; x=1688258620; bh=qnct9qxDQk
        IWrpMnVZY13A/TzgVRygoA+Eajrxbv22M=; b=F86VEFkP2bKs/hPUq0P7CRknTb
        pI8S/ZAp3dTMomS3vkR/5DOJWK66Mmd+FGE/5Dsb9dwIRVQfWGo3f6/xERN/UeYi
        ykkgH9ZrbheSkV4W5OuK08mpdQHGQZ3Lsg2kybD8n1wKaqdA2dG5JsEU3tdbN9Qg
        MTC5Ue752706yVghEIrJ5BpxjRy7DiIFBSrAqOLY3sVtXmEM8ElKwohA3mgJH/RP
        G+Eg1/PE2P7LU1pQK0+iYSE6SZTfLkIa4Ich0CPjoxjfHCM1sxYzDm400+PuXjdf
        JRy5Ed1kz4T5WkupLlHojrquzn6ga4lZamYQwqHQ3YocCLQAT0KXQN3KoFVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1688172220; x=1688258620; bh=qnct9qxDQkIWr
        pMnVZY13A/TzgVRygoA+Eajrxbv22M=; b=YSJ9hJ4ZbuVgkT8+/PHbnno8XWRCn
        2wzQu71LmF8+/iC2ACBd+y/HxyWIqTpfbgRJcWlyY1V0PBq4ghQyzvlkxr+Qhfpp
        EPBAcb3dUtnyTtPAVKWw1dMJBCTriHVWMaBRXqka3FwNcxxq1qMptUt3L77NFQ32
        7vd1DWXzv1e1jtru5vCMkGyt14mc/JJmGzKeW0Pr45g5eVFPk5R840pcMu2cONKh
        0KJBHPGaUvw9J6FVPXi/twwYgzr1jB3EN7D5JO231pRM293/liKDUqdKR6mxhAQE
        XyYiqt719dQbh4g2v9N2dgrtXRFF1G5jpEXRnSFj2Lphur8r+QxRNfMsA==
X-ME-Sender: <xms:vHafZAPvYZyMfJHR13g2sSBzF1DaHKjVZ6JvA8HLwSC3PoMqqhzATA>
    <xme:vHafZG-SKcuKTBcITuYHnJTZhFZnQ3VyHwaY0OJZymScfSshUFwNUhairwc6Q5PgB
    aFP7fPaYz9gQed99w>
X-ME-Received: <xmr:vHafZHRr9xFDUH4CHDSN96Qc-gldrJ3rxoO9pVz-VhA2YDvq3C2aHfc12qHnWBUyxiZ2JHc0w6O6ImcrDrXFSsp9AuQUqW7hwrubVakkag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdejgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhrugesshih
    shhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeegvdefgeehhfffvdfgkeelff
    dvgfetvdeffeevfedugfevgeetffekfefhudffkeenucffohhmrghinhepghhithhhuhgs
    rdgtohhmpdgtohhrvggsohhothdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtgho
    mh
X-ME-Proxy: <xmx:vHafZItkttyeWBSQtj8T1kOtlvyYe7JgVquvK1-qyDFaM9siCHQh4g>
    <xmx:vHafZId1ZU5n9JwG-L_tT87PgqSLr6Sb_4H5s5qCgQbAPBuOZl-lzw>
    <xmx:vHafZM3wJHTKexDwSriRKkopt1uooIBel7JNpZExkGhdDIxg-f_SwA>
    <xmx:vHafZEFWY7SewGP4U5tQMga7GSWQve3Y-Ozu3Me_h-5hgpDmNWu07Q>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 20:43:40 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com, Tim Crawford <tcrawford@system76.com>
Subject: [PATCH] platform/x86: system76: Handle new KBLED ACPI methods
Date:   Fri, 30 Jun 2023 18:43:29 -0600
Message-ID: <20230701004329.88288-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

System76 EC since system76/ec@9ac513128ad9 detects if the keyboard is
white or RGB backlit via `RGBKB-DET#` at run-time instead of being set
at compile-time. As part of this, the brightness of white-only backlit
keyboards was also changed to behave more like the RGB-backlit
keyboards: a value between 0 and 255 instead of a firmware-defined
level.

The EC ACPI methods in coreboot have been updated for this new
functionality only, removing the old behavior.

This should preserve behavior as we roll out new firmware with these
changes included and users update to it.

Ref: https://github.com/system76/ec/pull/357
Ref: https://review.coreboot.org/c/coreboot/+/76152
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 drivers/platform/x86/system76_acpi.c | 84 ++++++++++++++++++++++------
 1 file changed, 67 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index fc4708fa6ebe..a172769f5172 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -2,7 +2,7 @@
 /*
  * System76 ACPI Driver
  *
- * Copyright (C) 2019 System76
+ * Copyright (C) 2023 System76
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -24,6 +24,12 @@
 
 #include <acpi/battery.h>
 
+enum kbled_type {
+	KBLED_NONE,
+	KBLED_WHITE,
+	KBLED_RGB,
+};
+
 struct system76_data {
 	struct acpi_device *acpi_dev;
 	struct led_classdev ap_led;
@@ -36,6 +42,7 @@ struct system76_data {
 	union acpi_object *ntmp;
 	struct input_dev *input;
 	bool has_open_ec;
+	enum kbled_type kbled_type;
 };
 
 static const struct acpi_device_id device_ids[] = {
@@ -51,7 +58,7 @@ static const enum led_brightness kb_levels[] = {
 	96,
 	144,
 	192,
-	255
+	255,
 };
 
 // Array of keyboard LED colors in 24-bit RGB format
@@ -62,7 +69,7 @@ static const int kb_colors[] = {
 	0xFF00FF,
 	0x00FF00,
 	0x00FFFF,
-	0xFFFF00
+	0xFFFF00,
 };
 
 // Get a System76 ACPI device value by name
@@ -327,7 +334,11 @@ static int kb_led_set(struct led_classdev *led, enum led_brightness value)
 
 	data = container_of(led, struct system76_data, kb_led);
 	data->kb_brightness = value;
-	return system76_set(data, "SKBL", (int)data->kb_brightness);
+	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "GKBK")) {
+		return system76_set(data, "SKBB", (int)data->kb_brightness);
+	} else {
+		return system76_set(data, "SKBL", (int)data->kb_brightness);
+	}
 }
 
 // Get the last set keyboard LED color
@@ -399,7 +410,12 @@ static void kb_led_hotkey_hardware(struct system76_data *data)
 {
 	int value;
 
-	value = system76_get(data, "GKBL");
+	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "GKBK")) {
+		value = system76_get(data, "GKBB");
+	} else {
+		value = system76_get(data, "GKBL");
+	}
+
 	if (value < 0)
 		return;
 	data->kb_brightness = value;
@@ -683,20 +699,54 @@ static int system76_add(struct acpi_device *acpi_dev)
 	if (err)
 		return err;
 
-	data->kb_led.name = "system76_acpi::kbd_backlight";
-	data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
-	data->kb_led.brightness_get = kb_led_get;
-	data->kb_led.brightness_set_blocking = kb_led_set;
-	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
-		data->kb_led.max_brightness = 255;
-		data->kb_led.groups = system76_kb_led_color_groups;
-		data->kb_toggle_brightness = 72;
-		data->kb_color = 0xffffff;
-		system76_set(data, "SKBC", data->kb_color);
+	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "GKBK")) {
+		// Use the new ACPI methods
+		data->kbled_type = system76_get(data, "GKBK");
+
+		switch (data->kbled_type) {
+		case KBLED_NONE:
+			data->kb_led.max_brightness = 0;
+			data->kb_color = -1;
+			break;
+		case KBLED_WHITE:
+			data->kb_led.name = "system76_acpi::kbd_backlight";
+			data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
+			data->kb_led.brightness_get = kb_led_get;
+			data->kb_led.brightness_set_blocking = kb_led_set;
+			data->kb_led.max_brightness = 255;
+			data->kb_toggle_brightness = 72;
+			data->kb_color = 0xffffff;
+			break;
+		case KBLED_RGB:
+			data->kb_led.name = "system76_acpi::kbd_backlight";
+			data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
+			data->kb_led.brightness_get = kb_led_get;
+			data->kb_led.brightness_set_blocking = kb_led_set;
+			data->kb_led.max_brightness = 255;
+			data->kb_led.groups = system76_kb_led_color_groups;
+			data->kb_toggle_brightness = 72;
+			data->kb_color = 0xffffff;
+			system76_set(data, "SKBC", data->kb_color);
+			break;
+		}
 	} else {
-		data->kb_led.max_brightness = 5;
-		data->kb_color = -1;
+		// Use the old ACPI methods
+		data->kb_led.name = "system76_acpi::kbd_backlight";
+		data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
+		data->kb_led.brightness_get = kb_led_get;
+		data->kb_led.brightness_set_blocking = kb_led_set;
+		if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
+			data->kb_led.max_brightness = 255;
+			data->kb_led.groups = system76_kb_led_color_groups;
+			data->kb_toggle_brightness = 72;
+			data->kb_color = 0xffffff;
+			system76_set(data, "SKBC", data->kb_color);
+		} else {
+			data->kb_led.max_brightness = 5;
+			data->kb_color = -1;
+		}
 	}
+
 	err = devm_led_classdev_register(&acpi_dev->dev, &data->kb_led);
 	if (err)
 		return err;
-- 
2.41.0

