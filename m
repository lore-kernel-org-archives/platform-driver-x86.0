Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2399AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Dec 2021 18:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344913AbhLVSwB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Dec 2021 13:52:01 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39379 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344899AbhLVSv7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Dec 2021 13:51:59 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 6B34332009BB;
        Wed, 22 Dec 2021 13:51:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 22 Dec 2021 13:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gph2mbXCduLI/3nj1
        N+O5b/iHj7DwDeHoD3bXmY4/Yo=; b=Q7idIIZde4LzZx8RkTd5Ogm1/IN2LRoaw
        Ny2lRj0BWGaoh9oq0h0k6iD3BEAK+izwNomydfkM+KlZO9yiT/IwpogjsAfRIa5h
        ku01RvXLwxBT6pxyYbCLfs2yEyEelMDSPianmhlqcghCMAzjEuUnAnKYXBn1WxXl
        pErWgDM0y8ZI+n1EeSWU5OOKhkI47GiptJegCPTpSUsYwiiKkXwu93V5LaXwiYLY
        3A8cYrceotLcHxyV3UJgKvfVEjeYzDx64xqr3ZQDr3n8ONfonNY8t3FHXirhvFuA
        K3qnsPQBuMiFBcQIPaWOd6+BSZOcCMf4KIr3ILcEDdxA+WOW7B9qA==
X-ME-Sender: <xms:zHPDYbgVJzwfFxYTPbyKgx-r8IYnLQSseieqGVryvSuJCzGO8n9p7w>
    <xme:zHPDYYCrvZd5bCWgDEmGFVJqxUJ3HMiXN1n5du6kAiHh05cslecKOG-Sn7BNOGA_c
    HEtbm3kdHL8Fllm0A>
X-ME-Received: <xmr:zHPDYbFdNxWe358R8ngBxeATUK0PoHgez9o7g3aQ_OYTaqDDAXxtuAVYtCtDgxSB253i3jraPhvmYClTV0L0l9WmlSQAJ0OaW8kJ_iU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtiedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
    hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepgeeugffhieegledvuddtge
    dtieetvdffkeeltdejhfejvefgtefgleetteehfefgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmje
    eirdgtohhm
X-ME-Proxy: <xmx:zHPDYYRWz-iwUCMZ3FzoqKMHLL-B4wX-E0uQzEzrcjlaOpN-aetBcw>
    <xmx:zHPDYYwy9t0tPCIsZOJ17M03bM2yQ3J0r0o-dwlohNliEZvVKbiI_w>
    <xmx:zHPDYe7pMzU07xcnfk22zZcxlPkyZaMx85WAT2WWCKZaTVjGkok21A>
    <xmx:zHPDYeYfNsH7vD1r0sbEQcuX9egOxx1B6XpWHdAnQgpFUcDUGPPY5w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Dec 2021 13:51:56 -0500 (EST)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH] platform/x86: system76_acpi: Guard System76 EC specific functionality
Date:   Wed, 22 Dec 2021 11:51:54 -0700
Message-Id: <20211222185154.4560-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Certain functionality or its implementation in System76 EC firmware may
be different to the proprietary ODM EC firmware. Introduce a new bool,
`has_open_ec`, to guard our specific logic. Detect the use of this by
looking for a custom ACPI method name used in System76 firmware.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 drivers/platform/x86/system76_acpi.c | 58 ++++++++++++++--------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index 8b292ee95a14..7299ad08c838 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -35,6 +35,7 @@ struct system76_data {
 	union acpi_object *nfan;
 	union acpi_object *ntmp;
 	struct input_dev *input;
+	bool has_open_ec;
 };
 
 static const struct acpi_device_id device_ids[] = {
@@ -279,20 +280,12 @@ static struct acpi_battery_hook system76_battery_hook = {
 
 static void system76_battery_init(void)
 {
-	acpi_handle handle;
-
-	handle = ec_get_handle();
-	if (handle && acpi_has_method(handle, "GBCT"))
-		battery_hook_register(&system76_battery_hook);
+	battery_hook_register(&system76_battery_hook);
 }
 
 static void system76_battery_exit(void)
 {
-	acpi_handle handle;
-
-	handle = ec_get_handle();
-	if (handle && acpi_has_method(handle, "GBCT"))
-		battery_hook_unregister(&system76_battery_hook);
+	battery_hook_unregister(&system76_battery_hook);
 }
 
 // Get the airplane mode LED brightness
@@ -673,6 +666,10 @@ static int system76_add(struct acpi_device *acpi_dev)
 	acpi_dev->driver_data = data;
 	data->acpi_dev = acpi_dev;
 
+	// Some models do not run open EC firmware. Check for an ACPI method
+	// that only exists on open EC to guard functionality specific to it.
+	data->has_open_ec = acpi_has_method(acpi_device_handle(data->acpi_dev), "NFAN");
+
 	err = system76_get(data, "INIT");
 	if (err)
 		return err;
@@ -718,27 +715,31 @@ static int system76_add(struct acpi_device *acpi_dev)
 	if (err)
 		goto error;
 
-	err = system76_get_object(data, "NFAN", &data->nfan);
-	if (err)
-		goto error;
+	if (data->has_open_ec) {
+		err = system76_get_object(data, "NFAN", &data->nfan);
+		if (err)
+			goto error;
 
-	err = system76_get_object(data, "NTMP", &data->ntmp);
-	if (err)
-		goto error;
+		err = system76_get_object(data, "NTMP", &data->ntmp);
+		if (err)
+			goto error;
 
-	data->therm = devm_hwmon_device_register_with_info(&acpi_dev->dev,
-		"system76_acpi", data, &thermal_chip_info, NULL);
-	err = PTR_ERR_OR_ZERO(data->therm);
-	if (err)
-		goto error;
+		data->therm = devm_hwmon_device_register_with_info(&acpi_dev->dev,
+			"system76_acpi", data, &thermal_chip_info, NULL);
+		err = PTR_ERR_OR_ZERO(data->therm);
+		if (err)
+			goto error;
 
-	system76_battery_init();
+		system76_battery_init();
+	}
 
 	return 0;
 
 error:
-	kfree(data->ntmp);
-	kfree(data->nfan);
+	if (data->has_open_ec) {
+		kfree(data->ntmp);
+		kfree(data->nfan);
+	}
 	return err;
 }
 
@@ -749,14 +750,15 @@ static int system76_remove(struct acpi_device *acpi_dev)
 
 	data = acpi_driver_data(acpi_dev);
 
-	system76_battery_exit();
+	if (data->has_open_ec) {
+		system76_battery_exit();
+		kfree(data->nfan);
+		kfree(data->ntmp);
+	}
 
 	devm_led_classdev_unregister(&acpi_dev->dev, &data->ap_led);
 	devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
 
-	kfree(data->nfan);
-	kfree(data->ntmp);
-
 	system76_get(data, "FINI");
 
 	return 0;
-- 
2.33.1

