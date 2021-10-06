Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C16C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C73FD61152
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhJFUYA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 16:24:00 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39447 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239377AbhJFUYA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 16:24:00 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 630673200B7A;
        Wed,  6 Oct 2021 16:22:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 06 Oct 2021 16:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=aSAfQQ3nS6ZVJNPEeXI/Hl4gzgNj/ptffcJVc91sziU=; b=QFTGD8em
        sgqRct21Jm5kfGmR2omskHFnhrlzfEjLQewk1SA0I97B3aYM8dvOMx/mVMto7vmk
        t03f5/J1gVIWd1iYvNrz2Rc2r0RCex5Uf/y7Vk3Onkq/jS1/Y4LyLEMPWAmFRWlM
        WGovqAek7yQJS6qktZ/qz003vD1xWRhXwP0xuwTbsaYwrJCHKeGrEdrPIrKglhFa
        ZKrNCup9SmGh1V9+4Qr7DdsO5JoUv0ySaAaH8plVgWC7Q/ar+O9+eZfSy2+sMsLP
        HP+F7jq4WaOJb5n3RTd9EmPQFK11YG8lt79709Tz39M3hD9Jf+5uvMom06kpmV/x
        RPsjwC2spFpq1g==
X-ME-Sender: <xms:bgVeYadhCyT-y0wntmHJmhQrvxnYQg4Fyf-hkYjIw7aaI3HMoifW1w>
    <xme:bgVeYUO6frIvPYS6yCl4QebyYkB88WlW_l0-GoL-UfFd15IhgBTKa6MyMiGzh1fPW
    8X7y_NOCm39_EWQ_Q>
X-ME-Received: <xmr:bgVeYbjYcaL9YoU1eewLPVj35PoPZ5HIjRT0Uwau3QdRDKAGY8587OxX9KNrXT4ArMCST0_Ekw-Mw0pY6ic3yLiTgQcXfdUfGKZHheA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeliedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhimhcu
    vehrrgiffhhorhguuceothgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeifeelvdfgueeiteefheeghfeiudelleffgeetkeejudeugfek
    ueehkefhhefftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:bgVeYX8CshFSq7Q4_E9TeXOX6GISgXd4_MUeKchEEmqHgUDo1YTESA>
    <xmx:bgVeYWvuYCJkxGtnTSfyxiMWfidEvVegSUCc3hDlHi5shw2EP5UU5Q>
    <xmx:bgVeYeFBBM8AK2NrGMySnyHZkqBMvcHnny56CCFcQyn-YVsirZs2cw>
    <xmx:bwVeYbU-MTBfa3AaH4jTJFTEd8o9TdWtn2d035yM-I5gdwWAZHMniA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Oct 2021 16:22:06 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com, Jeremy Soller <jeremy@system76.com>
Subject: [PATCH v4 2/4] platform/x86: system76_acpi: Replace Fn+F2 function for OLED models
Date:   Wed,  6 Oct 2021 14:22:00 -0600
Message-Id: <20211006202202.7479-3-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006202202.7479-1-tcrawford@system76.com>
References: <20211006202202.7479-1-tcrawford@system76.com>
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
 drivers/platform/x86/system76_acpi.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index 2a78ac64d689..9e525b51a267 100644
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
@@ -463,6 +465,15 @@ static const struct hwmon_chip_info thermal_chip_info = {
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
@@ -485,6 +496,9 @@ static void system76_notify(struct acpi_device *acpi_dev, u32 event)
 	case 0x84:
 		kb_led_hotkey_color(data);
 		break;
+	case 0x85:
+		input_key(data, KEY_SCREENLOCK);
+		break;
 	}
 }
 
@@ -539,6 +553,20 @@ static int system76_add(struct acpi_device *acpi_dev)
 			return err;
 	}
 
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
+	if (err)
+		goto error;
+
 	err = system76_get_object(data, "NFAN", &data->nfan);
 	if (err)
 		goto error;
@@ -558,6 +586,7 @@ static int system76_add(struct acpi_device *acpi_dev)
 error:
 	kfree(data->ntmp);
 	kfree(data->nfan);
+	input_free_device(data->input);
 	return err;
 }
 
-- 
2.31.1

