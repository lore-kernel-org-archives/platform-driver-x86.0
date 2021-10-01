Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4753C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB5F361881
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbhJAQKC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Oct 2021 12:10:02 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:40305 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231675AbhJAQKB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Oct 2021 12:10:01 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5D72A3202361;
        Fri,  1 Oct 2021 12:08:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 01 Oct 2021 12:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=NV0OUlxYNqBxwOoaKydoxgcuPzHJXyOCjnoVYi1fj5A=; b=U0ltJJZW
        wmJ/Ajmyuv01j7/VFv5NT93nnaY2qdCN9d0TmoJ3IQefFwKhYE4kJK29KVmUJLod
        Jyjw6f8p3ekA9a8+2Mams0EXSoTUU5mm9oBNSzB1W9BiLY0DqDcceqZITtRPIpv4
        KUn35sJS3/HoUJppDK8I8L/plk9Z6yxuCY96uEO6n0GqfTT1VUxhvcNduDxKJ6lq
        Burt0T962OfVGVx5PpUmRujO/cgLo9Z4zuH9pDGx194rcoRBdtdiVWRTMu4XzM9J
        AKp4pNtAp0XpSpmAY2vasn+IvG4x11s0wap6kUa7F4fJE9mh94DDmjCVlSPmWSE3
        1SGwHt4d96J38A==
X-ME-Sender: <xms:cDJXYRRtqJJ5seyjhCuwGpmr70DyfKaKI3SjdDTu2Y-LKMD58mfnbw>
    <xme:cDJXYayFHPL7xB3KOxlypGwLFog9qPmOSPiT68dfI87TjfqD7ud1mJY5D-DBfY5iJ
    juEhSqyUyDGdMLzsg>
X-ME-Received: <xmr:cDJXYW3KLRC9PiwZ13GxbRd6cowS9c5pHvigtPZf1D7jGjlqXri8copcewnWwGhvHPvqtzYDuyhebOUid64ycIsN_HJG4DAciN5kMCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvihhmucev
    rhgrfihfohhrugcuoehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomheqnecugg
    ftrfgrthhtvghrnhepieefledvgfeuieetfeehgefhieduleelffegteekjeduuefgkeeu
    heekhfehffdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:cDJXYZCKvG6jsRiozXqvua_Hw5pA25w3fREct8kS5pQPKy6NLvFC2w>
    <xmx:cDJXYagjyGMFWa1WMXoNLgMx2Cpa1pqM7MuGYcKLNUlKIhloZruxww>
    <xmx:cDJXYdq6BlxRWD5CMkni9MW4iaMVtvYVF3cw6x_N4UOm1k-dmkXiZg>
    <xmx:cDJXYeZXhPJU9sn0Ncns0pySC6cKdwYDCEUuA7RuflES5tXdGryOaA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Oct 2021 12:08:16 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com, Jeremy Soller <jeremy@system76.com>
Subject: [PATCH 2/4] platform/x86: system76_acpi: Replace Fn+F2 function for OLED models
Date:   Fri,  1 Oct 2021 10:08:10 -0600
Message-Id: <20211001160812.22535-3-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001160812.22535-1-tcrawford@system76.com>
References: <20211001160812.22535-1-tcrawford@system76.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Jeremy Soller <jeremy@system76.com>

System76 laptops models with OLED displays do not support the default
Fn+F2 behavior of turning the embedded display on and off. Some models
instead introduce a new notify event that is used to lock the screen so
the OS will put the display in a low power state.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 drivers/platform/x86/system76_acpi.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index 11f0e42386ba..e7c86b543930 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -13,6 +13,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -29,6 +30,7 @@ struct system76_data {
 	struct device *therm;
 	union acpi_object *nfan;
 	union acpi_object *ntmp;
+	struct input_dev *input;
 };
 
 static const struct acpi_device_id device_ids[] = {
@@ -430,6 +432,15 @@ static const struct hwmon_chip_info thermal_chip_info = {
 	.info = thermal_channel_info,
 };
 
+static void input_key(struct system76_data *data, unsigned int code)
+{
+	input_report_key(data->input, code, 1);
+	input_sync(data->input);
+
+	input_report_key(data->input, code, 0);
+	input_sync(data->input);
+}
+
 // Handle ACPI notification
 static void system76_notify(struct acpi_device *acpi_dev, u32 event)
 {
@@ -452,6 +463,9 @@ static void system76_notify(struct acpi_device *acpi_dev, u32 event)
 	case 0x84:
 		kb_led_hotkey_color(data);
 		break;
+	case 0x85:
+		input_key(data, KEY_SCREENLOCK);
+		break;
 	}
 }
 
@@ -514,6 +528,22 @@ static int system76_add(struct acpi_device *acpi_dev)
 	if (IS_ERR(data->therm))
 		return PTR_ERR(data->therm);
 
+	data->input = devm_input_allocate_device(&acpi_dev->dev);
+	if (!data->input)
+		return -ENOMEM;
+
+	data->input->name = "System76 ACPI Hotkeys";
+	data->input->phys = "system76_acpi/input0";
+	data->input->id.bustype = BUS_HOST;
+	data->input->dev.parent = &acpi_dev->dev;
+	input_set_capability(data->input, EV_KEY, KEY_SCREENLOCK);
+
+	err = input_register_device(data->input);
+	if (err) {
+		input_free_device(data->input);
+		return err;
+	}
+
 	return 0;
 }
 
-- 
2.31.1

