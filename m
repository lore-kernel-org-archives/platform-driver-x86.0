Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC02C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 459B961A40
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhJAQKE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Oct 2021 12:10:04 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50429 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231675AbhJAQKE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Oct 2021 12:10:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id E3D6432023A3;
        Fri,  1 Oct 2021 12:08:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 01 Oct 2021 12:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=b69Pkba++yGYo7ZiQMmCRh47E3KbZp/+PNG1bWff/Cc=; b=YLElXbsw
        JYnIfevr3M4Or16b6IdijmCCy0MYSreksGPok0pkQsjI/8M1i73vsQIEZJid2q3g
        CdKQwa+Rd9NDhy4j+1ylg/k3dxYKlaULwx5vNSs/sm57uI0DRv8gLL7hXLVP4WuZ
        YCq7n2JVbvS9e+RttZ+Yet9x2BjwXHtFKAoybUgQuNQ/HDh+abiVuXjfAoTCG0jx
        B6CCYRj5hGD5L8HXwbI82Xiz78C37vJQglDmGTvkx0pwpBqZ4oDvmxSYVagkC92D
        2lXHlu+GXkj89Gq09dc48aRqGZvDwmg+NXv+p9putQ04fkjB0r+T3oFFYreRFT6T
        h644rpjdGbPAaA==
X-ME-Sender: <xms:czJXYe6WcHcmwC0PpeKwUu3n3jqmINltTCoCIvwldXg7dvlJWHMVnA>
    <xme:czJXYX4z6NFfMjgwucY9L9JD8g_xobauT2bfPu6iqbcucghu4gSTJIsxk7Ol73bet
    9ZvyTv3FRAK-XAStA>
X-ME-Received: <xmr:czJXYdd4qbHFPd16TCsPTPUzd-EEmVJV5wfBlSuDCrQH2JHiFZ6bBjuUaaW2O3EUihhDZuf_dC7-DuPHQznXIYfUzFGG2G4OUi1Xwq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhruges
    shihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeeifeelvdfgueeiteefhe
    eghfeiudelleffgeetkeejudeugfekueehkefhhefftdenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehttghrrgiffhhorhgusehshihsthgvmh
    ejiedrtghomh
X-ME-Proxy: <xmx:czJXYbIJ0QSkqi_ug03SnqKpC1Gmy-Jfo7rlkf2bOQ6rj2tEnsWYNA>
    <xmx:czJXYSLREmSsh43bq6NAc7vVzUXavY_TQc7tJxeYif3e_EBHoOw4tg>
    <xmx:czJXYcwzJkw1a3RepBnrSNKsQP4WdPGMOS7z5t_vJZ0NoFJuw0zs2A>
    <xmx:czJXYcw5RlGE8wrqm7yLQxl4rkqIHjIBZc-irNI38uRuCJGeGA56yw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Oct 2021 12:08:19 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH 4/4] platform/x86: system76_acpi: Use DEV_ATTR macro for kb_led_color
Date:   Fri,  1 Oct 2021 10:08:12 -0600
Message-Id: <20211001160812.22535-5-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001160812.22535-1-tcrawford@system76.com>
References: <20211001160812.22535-1-tcrawford@system76.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update kb_led_color to use the attr macro instead of manually making the
struct. While touching it, also change its show method to use
sysfs_emit() instead of sprintf().

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 drivers/platform/x86/system76_acpi.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index 5c525c242211..dd00eb2663d6 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -354,7 +354,7 @@ static ssize_t kb_led_color_show(
 
 	led = (struct led_classdev *)dev->driver_data;
 	data = container_of(led, struct system76_data, kb_led);
-	return sprintf(buf, "%06X\n", data->kb_color);
+	return sysfs_emit(buf, "%06X\n", data->kb_color);
 }
 
 // Set the keyboard LED color
@@ -382,14 +382,7 @@ static ssize_t kb_led_color_store(
 	return size;
 }
 
-static const struct device_attribute kb_led_color_dev_attr = {
-	.attr = {
-		.name = "color",
-		.mode = 0644,
-	},
-	.show = kb_led_color_show,
-	.store = kb_led_color_store,
-};
+static DEVICE_ATTR_RW(kb_led_color);
 
 // Notify that the keyboard LED was changed by hardware
 static void kb_led_notify(struct system76_data *data)
@@ -669,10 +662,7 @@ static int system76_add(struct acpi_device *acpi_dev)
 		return err;
 
 	if (data->kb_color >= 0) {
-		err = device_create_file(
-			data->kb_led.dev,
-			&kb_led_color_dev_attr
-		);
+		err = device_create_file(data->kb_led.dev, &dev_attr_kb_led_color);
 		if (err)
 			return err;
 	}
@@ -716,7 +706,7 @@ static int system76_remove(struct acpi_device *acpi_dev)
 	system76_battery_exit();
 
 	if (data->kb_color >= 0)
-		device_remove_file(data->kb_led.dev, &kb_led_color_dev_attr);
+		device_remove_file(data->kb_led.dev, &dev_attr_kb_led_color);
 
 	devm_led_classdev_unregister(&acpi_dev->dev, &data->ap_led);
 	devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
-- 
2.31.1

