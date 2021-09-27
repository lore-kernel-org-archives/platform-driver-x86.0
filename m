Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CBCC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 21:06:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DBEA60EE7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 21:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236836AbhI0VIN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 17:08:13 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:42003 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230046AbhI0VIN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 17:08:13 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id CFF193200F3B;
        Mon, 27 Sep 2021 17:06:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 27 Sep 2021 17:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=x8eRrzL7opllZChZZMdtzrM1pN1paz/esAz92QX77sI=; b=P4uvb4Kv
        X0Tplu2qc/qvWEGW644kQCPJbC4BfXC+zvrPxkdxyv87YnSM2i4Otsnt4Jxzkvr1
        UsANp4IvglB5a4nQdUAxjpwP7K3UFcZLhmJtkN+aN50Tflagtv6ks3Z7V+Gl+tg2
        GqP0aF9HLNdVxvwMuBn2FYqxHxKgdh+lm8UlkN9pEk98eiIs2o4nFZIbsqWM1Mti
        YUf85gU7ziGlV36TKPVhdqIuYHai62QbqYlN9MQIo1HYY1fdukl5+X1TT+udizsU
        aki7Cr8FbKkrf35XUCie5GukixHKf+qHfjZ9WDP4ldHQi9C3zrYXPTvQZefr7hdt
        YEsSW8nSMLL+2w==
X-ME-Sender: <xms:WjJSYQeRbusae1gjyi1Pc_RUy_U2_Nw8qIc3HBT74NL7a4eg2wHOGQ>
    <xme:WjJSYSMmyqBvEH9Lrypf1jx1r3WWsl4K_dVK9QEai6xBQAKvPnlIz2j__-y8s07Mz
    kPiNGpODjSNtssOlQ>
X-ME-Received: <xmr:WjJSYRgH-o38e2-EZDHOd3HVjwPwZ7w-MJAWD7Jnc7M7RMn3wqGyzaF6PgUcpRLwjCr21XIlMZCrhQAMWdLRXwqNrCcqObSjixUXm74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhimhcu
    vehrrgiffhhorhguuceothgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeifeelvdfgueeiteefheeghfeiudelleffgeetkeejudeugfek
    ueehkefhhefftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:WjJSYV8B2LTuG96j1pKB72fQRmNoCM7-v92qT6Y0bJvTvR0KTjDq7Q>
    <xmx:WjJSYcuzC_MRxXEfWCoOVM5OGixZFNZ_COpzPpjNxsz8CdL3w1QTbw>
    <xmx:WjJSYcGLjknPQqzg-Xlg2ux6ILcsXiomQxeOEzy3bJyYgysBPIuXdw>
    <xmx:WjJSYZU5xMeLb4R4bVij5aDvHNIpvQGn8Gkw91Vz4O269PbEytc5Cw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 17:06:34 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com, Jeremy Soller <jeremy@system76.com>
Subject: [PATCH 2/3] platform/x86: system76_acpi: Replace Fn+F2 function for OLED models
Date:   Mon, 27 Sep 2021 15:06:28 -0600
Message-Id: <20210927210629.37966-3-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210927210629.37966-1-tcrawford@system76.com>
References: <20210927210629.37966-1-tcrawford@system76.com>
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
 drivers/platform/x86/system76_acpi.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index 11f0e42386ba..06f6509980e2 100644
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
 
@@ -514,6 +528,23 @@ static int system76_add(struct acpi_device *acpi_dev)
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
+	set_bit(EV_KEY, data->input->evbit);
+	set_bit(KEY_SCREENLOCK, data->input->keybit);
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

