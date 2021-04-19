Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8973C433ED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Apr 2021 07:49:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B053261008
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Apr 2021 07:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238020AbhDSHuM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Apr 2021 03:50:12 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:58413 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237989AbhDSHuL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Apr 2021 03:50:11 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 36A811D81;
        Mon, 19 Apr 2021 03:49:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 19 Apr 2021 03:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=H8prxajy+NjvkAHmXrb3c3xWZ+jWoLTVOnwge8S58Po=; b=APlpyjQU
        1Wq1h2ctJId7ozX3ZYXK2oSzfIp68x4dpl+K3YHSWT6rWoke1Vucf45lg0ok0iAm
        okm4H4AQI9mY1RV2xxA7IC0h/+3bE1dsciIyWMxC5sArVviWQgb6SbYrHkfUzBOY
        n5bdS7M5wzDhgPbhZdwFXwtmXYT/02ybN034yFbjSWnPQYpwkCbSsuzm57+K+Qxo
        UUiBK+KluU3Xx9Zg5LpjQKrw0/vVAm4ZN6E7ixYx+WHtgN+ycAn7s6RCOj9znGhf
        X2ddMAxqLNd3I3H6edBcR5HUVdw0Bms7eB5O2OWq9/NWwiQMMoFVdtOl3seksFcE
        BeLADCQyWJCScQ==
X-ME-Sender: <xms:FTZ9YEhLgoXHawk1yu6Lw8gz8h9Jm2JdkQ1TroVgUopCz8MNkgotdg>
    <xme:FTZ9YM8-8iYsps9uLMm8PVaGFaMaeURxOmtZe2BoBSPDx2rDr33z9VKxrlhBeWzYs
    rYNUQlBKy_F9alRDD8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtfedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpedvteekvdeuhedthfeuudelheejie
    fhvddtteelleeghfekhfeugfehgeekffdtheenucfkphepudduiedrvdehuddrudelfedr
    udelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:FTZ9YI-ti0P7cO06dQEtvTYsSSyTLPOEJYKK84syHyS_wWDZtjm4Kg>
    <xmx:FTZ9YNBM5gMlga9CtHLHEH8qyyKRcM97140Wf7mDrlXmOk9J-oHoIQ>
    <xmx:FTZ9YAye0NDQFD9iz5IiAhmFa6AkTHsjKM-QzcH96oIz6I2DFLNQyA>
    <xmx:FTZ9YIvNRiayF31LovqSTziRr-3Z0GE2K5zG8ATjhKr-w8bVyRvd_w>
Received: from fedora.. (unknown [116.251.193.196])
        by mail.messagingengine.com (Postfix) with ESMTPA id B8A2424005C;
        Mon, 19 Apr 2021 03:49:38 -0400 (EDT)
From:   "Luke D. Jones" <luke@ljones.dev>
To:     hdegoede@redhat.com
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH 2/2] Revert "platform/x86: asus-nb-wmi: add support for ASUS ROG Zephyrus G14 and G15"
Date:   Mon, 19 Apr 2021 19:49:15 +1200
Message-Id: <20210419074915.393433-3-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419074915.393433-1-luke@ljones.dev>
References: <20210419074915.393433-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This reverts commit 13bceda68fb9ef388ad40d355ab8d03ee64d14c2.
---
 drivers/platform/x86/asus-nb-wmi.c | 82 ------------------------------
 1 file changed, 82 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index b07b1288346e..0cb927f0f301 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -110,16 +110,6 @@ static struct quirk_entry quirk_asus_forceals = {
 	.wmi_force_als_set = true,
 };
 
-static struct quirk_entry quirk_asus_ga401i = {
-	.wmi_backlight_power = true,
-	.wmi_backlight_set_devstate = true,
-};
-
-static struct quirk_entry quirk_asus_ga502i = {
-	.wmi_backlight_power = true,
-	.wmi_backlight_set_devstate = true,
-};
-
 static struct quirk_entry quirk_asus_use_kbd_dock_devid = {
 	.use_kbd_dock_devid = true,
 };
@@ -430,78 +420,6 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_forceals,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401IH",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IH"),
-		},
-		.driver_data = &quirk_asus_ga401i,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401II",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
-		},
-		.driver_data = &quirk_asus_ga401i,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401IU",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
-		},
-		.driver_data = &quirk_asus_ga401i,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401IV",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
-		},
-		.driver_data = &quirk_asus_ga401i,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401IVC",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IVC"),
-		},
-		.driver_data = &quirk_asus_ga401i,
-	},
-		{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA502II",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
-		},
-		.driver_data = &quirk_asus_ga502i,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA502IU",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
-		},
-		.driver_data = &quirk_asus_ga502i,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA502IV",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
-		},
-		.driver_data = &quirk_asus_ga502i,
-	},
 	{
 		.callback = dmi_matched,
 		.ident = "Asus Transformer T100TA / T100HA / T100CHI",
-- 
2.31.1

