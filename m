Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18369C0015E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 Jul 2023 18:13:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjGSSNm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 Jul 2023 14:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjGSSNl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Jul 2023 14:13:41 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A9D11C
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Jul 2023 11:13:39 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 5FD9A320094D;
        Wed, 19 Jul 2023 14:13:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 19 Jul 2023 14:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1689790416; x=1689876816; bh=0ocv+VX2eI
        MQZlAgrOXMYx/iRT0SKtAykHpSJ9jxZTI=; b=Ch5rPDaLj8UoC04twsKOPzruzr
        /sgyHzg0mquwtgelsxhC6xVhgg382ucl/7NSyDjrYc3r9cY8MErhwKBlD4Q7K9nx
        +cP7I/bYnsA2qNveZE/bCR6HzFlkMWGkFh1soE1rhx4oNHwwtT2jUa17ZhwwOYMa
        o+qibqhr0PrFURoff3nVd5QIUoWxVKjT9Uo9Tm9zGZ5xEYCYyrxyeB4e0/o70/zT
        RoLtsiHXvkMg+x+6KKABZLAL9o04APtEPlI7lYRvBM0XR/3QjW681ZPDfy0ADkJv
        UmgEf3H36yc2vJVtySRAlQQ/uxPcHueEqqf+LX0wlvVsgBS0Whm5V7YZs5Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1689790416; x=1689876816; bh=0ocv+VX2eIMQZ
        lAgrOXMYx/iRT0SKtAykHpSJ9jxZTI=; b=Hd/ZrOZm5t0+/Xjr0Z8Mq8gB/WhDV
        zcLJbp+1XpJlRR7I9Qpg6Q4krKisRKxOIO+vLBpr7fQ5O4BmgLz/42ZywUk+OjZ+
        7a5rMyor5PHl3SqsGIhTw9003ckk/N5kzYUiBlyqKrsBU6aQEkXDUa7C/t149w++
        D1k/lTJiAddCaVwl8tULTJi/iLDTYeiuBGUtud5FCNFKHGumByDF8kq13SMM54BS
        DGgEEJOptlE5tmwDUlZPcy0XjvVQ8NvGfmV0WkSRpvcRkRCvkJij8iPlN16SWBNY
        5Y1MECKS2nD8EcUlm8Scofxfp0D9KNiB0i7aD0sd++wsFrHZ+QVgQD4IA==
X-ME-Sender: <xms:0Ce4ZPkm0zGZE_y_ayH88vb9hFeRfc2LSFdChgX0uXRcLYwBySl0Sw>
    <xme:0Ce4ZC1qbQ97hRSyub8z1JIj-F5_9Omf1Wf8ccb_JNIm5jsqsgKsIVqG8P-3-N6eS
    PxvruBON7ni5Nh2WQ>
X-ME-Received: <xmr:0Ce4ZFr71r149W0jG7QJK5xINKtIJ3KqAsxb-XKqjL8ILZ8k7kYbhxjfeGLEFIIwMePuDPvEV2er-jnw0L55D9k4zLMw4x9hP3dk2vM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeekgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
    hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepgedvfeeghefhffdvgfekle
    ffvdfgtedvfeefveefudfgveegteffkeefhfduffeknecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhdptghorhgvsghoohhtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgt
    ohhm
X-ME-Proxy: <xmx:0Ce4ZHlNNwKhWvrEUA_7YM22usdSEWyz9-nrfgQS16IpscahqVUFEA>
    <xmx:0Ce4ZN129jb3gF-eC280SQTXMv1i64QLqalnqakSO2zcvwLZQsNW9A>
    <xmx:0Ce4ZGvGXZBUoqkjhhk5qRgs2L106ujRIk4sLg_Lj--1wYGoEv-dHg>
    <xmx:0Ce4ZO8uExe35UAvAd_A4gBYYmPLUIP_Vwgd1EdBBUAwQqZntFzY4A>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jul 2023 14:13:36 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com, Tim Crawford <tcrawford@system76.com>
Subject: [PATCH v2] platform/x86: system76: Handle new KBLED ACPI methods
Date:   Wed, 19 Jul 2023 12:13:24 -0600
Message-ID: <20230719181324.47035-1-tcrawford@system76.com>
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
 drivers/platform/x86/system76_acpi.c | 74 ++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index fc4708fa6ebe..3da753b3d00d 100644
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
@@ -459,8 +475,9 @@ static void kb_led_hotkey_color(struct system76_data *data)
 {
 	int i;
 
-	if (data->kb_color < 0)
+	if (data->kbled_type != KBLED_RGB)
 		return;
+
 	if (data->kb_brightness > 0) {
 		for (i = 0; i < ARRAY_SIZE(kb_colors); i++) {
 			if (kb_colors[i] == data->kb_color)
@@ -687,19 +704,46 @@ static int system76_add(struct acpi_device *acpi_dev)
 	data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
 	data->kb_led.brightness_get = kb_led_get;
 	data->kb_led.brightness_set_blocking = kb_led_set;
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
+			// Nothing to do: Device will not be registered.
+			break;
+		case KBLED_WHITE:
+			data->kb_led.max_brightness = 255;
+			data->kb_toggle_brightness = 72;
+			break;
+		case KBLED_RGB:
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
+		if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
+			data->kbled_type = KBLED_RGB;
+			data->kb_led.max_brightness = 255;
+			data->kb_led.groups = system76_kb_led_color_groups;
+			data->kb_toggle_brightness = 72;
+			data->kb_color = 0xffffff;
+			system76_set(data, "SKBC", data->kb_color);
+		} else {
+			data->kbled_type = KBLED_WHITE;
+			data->kb_led.max_brightness = 5;
+		}
+	}
+
+	if (data->kbled_type != KBLED_NONE) {
+		err = devm_led_classdev_register(&acpi_dev->dev, &data->kb_led);
+		if (err)
+			return err;
 	}
-	err = devm_led_classdev_register(&acpi_dev->dev, &data->kb_led);
-	if (err)
-		return err;
 
 	data->input = devm_input_allocate_device(&acpi_dev->dev);
 	if (!data->input)
-- 
2.41.0

