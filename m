Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ECCC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 22:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F00546139D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 22:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243085AbhI1WRT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 18:17:19 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37673 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243059AbhI1WRQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 18:17:16 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 02D0E3201D50;
        Tue, 28 Sep 2021 18:15:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 28 Sep 2021 18:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=NV0OUlxYNqBxwOoaKydoxgcuPzHJXyOCjnoVYi1fj5A=; b=Nx98D5jv
        YzP3GC4rvXggy7Irm/Rayr2RCDd2nggfggmg/5UnV1U0s4062DVfMvvGQNGa6DAF
        HcSvjxg3qgK4Q2+/DHVM/L1GG9nPa3+1HPBYw+vbfGaCg8LzhUx+UzW7Q7tNH7S8
        55vy7Lub4wUQ8d4aPxJF212Iw5QCKmpELQtMWbCzwWsPjdHzzJp27cFsDZasYN3l
        2XIUoVrHT1vh0F1GLtDnDl8qbSZvAvdxsKu7EavNnQVJtWFnqKb0Cv227RTzt9SJ
        52n/spXOuLjPYVgoo34IyfKXeXfVrR8nr6+ibW47NGJrSwWYIYwAVWjCxM5m0Wuv
        zFprzJM4oq6KAA==
X-ME-Sender: <xms:BZRTYTN92Be52pu38iO9Uslon4VQ2fVtKAbU25TjLWZkEx4UJ1FFgA>
    <xme:BZRTYd88o5RmmIuDJoK2JJaz8pCN8SW9neI-koR-jR2LsYpdGX4ONWDqQJBYGNgiw
    TZ4hYYrGPqCumTrpA>
X-ME-Received: <xmr:BZRTYSSdJWmH8UX1LtzAUm3SkfzlG-bsSl1Nm8dEUBRdqq5y6C3ZfIPKSrOnS5OIR4aRUIF7ha8Kkuzdmpzmk1xvhAqs2kR8DsL4f60>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekuddgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvihhmucev
    rhgrfihfohhrugcuoehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomheqnecugg
    ftrfgrthhtvghrnhepieefledvgfeuieetfeehgefhieduleelffegteekjeduuefgkeeu
    heekhfehffdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:BZRTYXusRepsxaXIwSE6GoYvIHIE6vzywek4tQFl01SmAYwcPB_x2Q>
    <xmx:BZRTYbe2SEAsMR2ggbR2ficpq3lLM_UMGOVdVUcccF6OpCIcHFT5LA>
    <xmx:BZRTYT3SuFa4ip8rIzaKnfLEGswtbQFLbkJhA-hp4uxHaxcnpHUdNA>
    <xmx:BZRTYTGsOeft2tSTXIJ_z7I_Ab3-dKBNx-aj35Pa4yFl5QuhXMT9nQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 18:15:33 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com, Jeremy Soller <jeremy@system76.com>
Subject: [PATCH v2 2/3] platform/x86: system76_acpi: Replace Fn+F2 function for OLED models
Date:   Tue, 28 Sep 2021 16:15:28 -0600
Message-Id: <20210928221529.70176-3-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210928221529.70176-1-tcrawford@system76.com>
References: <20210927210629.37966-1-tcrawford@system76.com>
 <20210928221529.70176-1-tcrawford@system76.com>
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

