Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687D9C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CB6261139
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239483AbhJFUYD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 16:24:03 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50219 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239377AbhJFUYC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 16:24:02 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E827A3200C6B;
        Wed,  6 Oct 2021 16:22:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 06 Oct 2021 16:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=5B+aB5zeoWyLp0dGLCzRlMOfSnPT/Si3deGgo9F926c=; b=EkDoK2FU
        Ac9B5wr2boI9Ula3ZC33sDoAEVx34wIDHr7XC79fe9S+6kevXUy4IPGMdQuNG4VS
        exihzKSYhTcs69aQUJl3movhXIVyKDTe6dpu+MrGW5MdMSF+LFXfDA6ligwwbAks
        2R3kIS2X2+TtUeunCqsbJ44AAYt8Z3Rvif1RZ4JAryAZ3bpR7pbPFnJ0kBUAj+VC
        u8YAjckDNFKRXjt15xPVDCt80mjhTEUpBCtzGd8C/4bGYs+rJdURR7wuSjvRCac/
        HrcMJu8Qj3cObqGz7DhrD15R9syHYSyvBC/yb5RwRmyJysUbxbW6JU03JHxp5lvL
        5K2GNfL14E5VkA==
X-ME-Sender: <xms:cQVeYfrW5aUDXDeTamjuSthYKt6EtaoTC4lo33ro8DhpxugBzA2m9Q>
    <xme:cQVeYZpAb2RcD5sDoc-xZ36M8D8pSrQ53kGycU8-S4VenL1Rv2FyFOqB_LgBILKJe
    JnNqiAxl5QaCikt8A>
X-ME-Received: <xmr:cQVeYcM1wcijGafm5h9lhRUHEf-gxBl8VNX-G12xz-ficL2XpIAWnBwe_SOycBSTTKqpsoHUJ5x51Xypr9CEvw8N-onKZ4Q1YRXsdN4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeliedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgu
    sehshihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepieefledvgfeuieetfe
    ehgefhieduleelffegteekjeduuefgkeeuheekhfehffdtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvg
    hmjeeirdgtohhm
X-ME-Proxy: <xmx:cQVeYS6COP9XPMIJ9h2QsYXhPr4wswvv1WuybS8xyYxaTNQiu5D7Zw>
    <xmx:cQVeYe6FsJKdbCkmcgpxd8TgCnCJ2PYFumQaq8sMtmy46iZOvAHDWQ>
    <xmx:cQVeYah2y2kNMCXmtIWrlp79LwGnav2GoU6R0luvHWPOb0eVsnMIXw>
    <xmx:cQVeYTgoyOstTKNtcwZwdEXLcRdZlLg3IZMkLDcJvIsfcB0m0eQPog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Oct 2021 16:22:09 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH v4 4/4] platform/x86: system76_acpi: Add attribute group for kb_led_color
Date:   Wed,  6 Oct 2021 14:22:02 -0600
Message-Id: <20211006202202.7479-5-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006202202.7479-1-tcrawford@system76.com>
References: <20211006202202.7479-1-tcrawford@system76.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Create the attribute groups for kb_led_color and set the `groups` field
in kb_led. While touching it, also change its show method to use
sysfs_emit() instead of sprintf().

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 drivers/platform/x86/system76_acpi.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index 70d0490e23f5..b3c8178420b1 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -348,7 +348,7 @@ static ssize_t kb_led_color_show(
 
 	led = (struct led_classdev *)dev->driver_data;
 	data = container_of(led, struct system76_data, kb_led);
-	return sprintf(buf, "%06X\n", data->kb_color);
+	return sysfs_emit(buf, "%06X\n", data->kb_color);
 }
 
 // Set the keyboard LED color
@@ -376,7 +376,7 @@ static ssize_t kb_led_color_store(
 	return size;
 }
 
-static const struct device_attribute kb_led_color_dev_attr = {
+static struct device_attribute dev_attr_kb_led_color = {
 	.attr = {
 		.name = "color",
 		.mode = 0644,
@@ -385,6 +385,13 @@ static const struct device_attribute kb_led_color_dev_attr = {
 	.store = kb_led_color_store,
 };
 
+static struct attribute *system76_kb_led_color_attrs[] = {
+	&dev_attr_kb_led_color.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(system76_kb_led_color);
+
 // Notify that the keyboard LED was changed by hardware
 static void kb_led_notify(struct system76_data *data)
 {
@@ -685,6 +692,7 @@ static int system76_add(struct acpi_device *acpi_dev)
 	data->kb_led.brightness_set_blocking = kb_led_set;
 	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
 		data->kb_led.max_brightness = 255;
+		data->kb_led.groups = system76_kb_led_color_groups;
 		data->kb_toggle_brightness = 72;
 		data->kb_color = 0xffffff;
 		system76_set(data, "SKBC", data->kb_color);
@@ -696,15 +704,6 @@ static int system76_add(struct acpi_device *acpi_dev)
 	if (err)
 		return err;
 
-	if (data->kb_color >= 0) {
-		err = device_create_file(
-			data->kb_led.dev,
-			&kb_led_color_dev_attr
-		);
-		if (err)
-			return err;
-	}
-
 	data->input = devm_input_allocate_device(&acpi_dev->dev);
 	if (!data->input)
 		return -ENOMEM;
@@ -753,9 +752,6 @@ static int system76_remove(struct acpi_device *acpi_dev)
 
 	system76_battery_exit();
 
-	if (data->kb_color >= 0)
-		device_remove_file(data->kb_led.dev, &kb_led_color_dev_attr);
-
 	devm_led_classdev_unregister(&acpi_dev->dev, &data->ap_led);
 	devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
 
-- 
2.31.1

