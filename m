Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCFEC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 27 Feb 2021 10:22:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19E6464EC0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 27 Feb 2021 10:22:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhB0KVz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 27 Feb 2021 05:21:55 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39231 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229795AbhB0KVt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 Feb 2021 05:21:49 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 25D145C00E7;
        Sat, 27 Feb 2021 05:20:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 27 Feb 2021 05:20:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=E6d3EqCm/Mqzt4Wpj
        s0w9KIfRfCuGqkKgOG7lSuv7qo=; b=awNe+4BgXoAlMj6gQTawYObJz/h7HFmOT
        P1KPQNzNSxkH6ZJkt6YESi8aZlCV5u+GVxBU+hSDDiH63b6Nxv6ATJcrfRLXD3L5
        5/553+/Jd/BD0M7phwnmyywA+leNw8JZfNnzThwksOj2hWplWBs3oNJuuq1QONsr
        HLCu5CdFStNAYIHY8f52hCyIi9X8MxWo9gPiej2VTEiALAF2spIqpMMiy2fio2E/
        GaGfJFMwLx4ARfovudR2oJ3/oe7YTkvs7XUJqC0Y9JXbzLySxg5uuzJoi20U/h0M
        quEu68yo/jAvlWxtCZY/q5YYbDzvDSupRNbZ1zu/QnT4HiwJvrUbA==
X-ME-Sender: <xms:9Bw6YDTAIFiRZFdvI53Kfgm6yO0Gz7tNd2psAaQ8r-2oZdq8nqpKUg>
    <xme:9Bw6YEsPBqPAia2oPDm7nlaHzGwXgFp489WkOpkW2AaU2BcsEiRTJ5kyyhtv5Q6yf
    cYOGtWYJ4VrQ2-sWqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleefgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefnuhhkvgcuffculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdgu
    vghvqeenucggtffrrghtthgvrhhnpeffgffhheehkefgtddtiefhudegteekudeihfdvud
    ejudeigfdtheeijeetvdejvdenucfkphepudduiedrvdehuddrudelfedrudelieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslh
    hjohhnvghsrdguvghv
X-ME-Proxy: <xmx:9Bw6YFvamp9HpJqqL02aobJFIvHhUPseIlQAWPa5yov_mZR1qdWXxw>
    <xmx:9Bw6YKynqwxVjTUKfT3ysBfiO4AJZJZRBgchCrv-t01NS7qwV2kfGA>
    <xmx:9Bw6YLj1SWchglx5x2CYXvMTVSn8519lnUrB7_VaMSz8gRvM4szboA>
    <xmx:9Rw6YI-RDmwIRLOeu6MR4RtjfxRmte82AsZZOE-dFz4wXWHLS0dPgw>
Received: from datatron-ljones.. (unknown [116.251.193.196])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8A2BF108005F;
        Sat, 27 Feb 2021 05:20:32 -0500 (EST)
From:   Luke D Jones <luke@ljones.dev>
To:     platform-driver-x86@vger.kernel.org
Cc:     corentin.chary@gmail.com, hdegoede@redhat.com,
        mgross@linux.intel.com, acpi4asus-user@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, Luke D Jones <luke@ljones.dev>
Subject: [PATCH] WMI: asus: Reduce G14 and G15 match to min product name
Date:   Sat, 27 Feb 2021 23:20:11 +1300
Message-Id: <20210227102010.65429-1-luke@ljones.dev>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch reduces the product match for GA401 series laptops to
the minimum string required.

The GA401 series of laptops has a lengthy list of product
variations in the 2020 series and the 2021 series refresh
is using the same base product ID of GA401.

The same is also true for the GA502 series, and the new GA503
series which is added in this patch as a variant of the G15.

Signed-off-by: Luke D Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-nb-wmi.c | 57 ++++--------------------------
 1 file changed, 6 insertions(+), 51 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index d41d7ad14be0..f4db67c3eba2 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -427,73 +427,28 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401IH",
+		.ident = "ASUSTeK COMPUTER INC. GA401",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IH"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA401"),
 		},
 		.driver_data = &quirk_asus_vendor_backlight,
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401II",
+		.ident = "ASUSTeK COMPUTER INC. GA502",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA502"),
 		},
 		.driver_data = &quirk_asus_vendor_backlight,
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401IU",
+		.ident = "ASUSTeK COMPUTER INC. GA503",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
-		},
-		.driver_data = &quirk_asus_vendor_backlight,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401IV",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
-		},
-		.driver_data = &quirk_asus_vendor_backlight,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA401IVC",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IVC"),
-		},
-		.driver_data = &quirk_asus_vendor_backlight,
-	},
-		{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA502II",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
-		},
-		.driver_data = &quirk_asus_vendor_backlight,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA502IU",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
-		},
-		.driver_data = &quirk_asus_vendor_backlight,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. GA502IV",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA503"),
 		},
 		.driver_data = &quirk_asus_vendor_backlight,
 	},
-- 
2.30.1

