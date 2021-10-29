Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A54C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 15:07:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D71AB60FE3
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 15:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhJ2PJ7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Oct 2021 11:09:59 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:46791 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229621AbhJ2PJ7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Oct 2021 11:09:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5DA0B5C0241;
        Fri, 29 Oct 2021 11:07:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 29 Oct 2021 11:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wDn+H/Bb1USvAS7Cv
        4W9Xb+ehFBaKR+1VoO7Qlv5tfY=; b=AEImDavCyFJ1f+Yb/vtt+H64ryG6BQWPl
        +0tuhXq9xpJ/M5W99dbgPSxdJLLfA5mwClgqRF2nmDtn/u4DmncDV7jKzJL+b2gJ
        xuNj4IXyE1/hxO631g4WvvPUeCdo1v2K5oD7JoRNePgLhMJ1Dpsqgrm6w/ixHsTH
        fGYTM8Zs7s1cUx5B+TYurlX1kh1iM77TshU+KDsNlxLVKpThy41lcUDoBfZp6g3D
        ont7coaiCIbNkWpHY5UJ4Ep9t1EPhG0w58kC0OHvZeAtcngvub2NdPtfOlX/WCPa
        O783lqLNihJ9YfsRa+ovBcw+F2R3eZB2sPFbMC5iDuYFnp4LGbECw==
X-ME-Sender: <xms:Mg58YUn2UA6Xf0izEwGN-o0Xfc66QfYQUrgNbcNaafmbgrqeRFVRAQ>
    <xme:Mg58YT2PAHfO6kRwvGkq9Bn62gjNBIxcnGcthPO6RpD_G8NqayWfQNUhfYxrlvCIf
    edkA1K2GFp6KFKoGg>
X-ME-Received: <xmr:Mg58YSojihVSWUnHo5OjtoDmtc0oSRI4gBcWXQ6wi_yUp-FYyRB1ZUYMBVtT-ltJpWOcZ4yzk6KkenFHBYUwW06nPip-1jd0k1rKkY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhrugesshih
    shhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeeguefghfeigeelvddutdegtd
    eitedvffekledtjefhjeevgfetgfelteetheefgfenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehttghrrgiffhhorhgusehshihsthgvmhejie
    drtghomh
X-ME-Proxy: <xmx:Mg58YQkhBGO35CZActKMPoKmT6541yQw0WslJoW6eQ3Z8h1DNK9t1g>
    <xmx:Mg58YS3r_1wV5kabKMZzSOJUWTAZF8nWrtA2XwrOew3JWgU-Ge_n9w>
    <xmx:Mg58YXsspNofcD2sB2U7uzyTUjROng3Zx67ahiWsJyeuVKOKDfa7zg>
    <xmx:Mg58YX-7BOY6qGVJ_wiwunurvk3lNBEOFOEobp8p11k8bhdnbaFD-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 11:07:29 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH] platform/x86: system76_acpi: Fix input device error handling
Date:   Fri, 29 Oct 2021 09:07:28 -0600
Message-Id: <20211029150728.3480-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Users on darp6 that do not have Open EC firmware have reported crashes
on boot. Correct the error handling for the input device to fix it.

input_free_device only needs to be called if input_register_device
failed, not in all error cases. Per devm_input_allocate_device
documentation, managed devices do not need to be explicitly unregistered
or freed, so do not add any other cleanup for the device.

Fixes: 0de30fc684b ("platform/x86: system76_acpi: Replace Fn+F2 function for OLED models")

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 drivers/platform/x86/system76_acpi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index b3c8178420b1..73232a543540 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -715,8 +715,10 @@ static int system76_add(struct acpi_device *acpi_dev)
 	input_set_capability(data->input, EV_KEY, KEY_SCREENLOCK);
 
 	err = input_register_device(data->input);
-	if (err)
-		goto error;
+	if (err) {
+		input_free_device(data->input);
+		return err;
+	}
 
 	err = system76_get_object(data, "NFAN", &data->nfan);
 	if (err)
@@ -739,7 +741,6 @@ static int system76_add(struct acpi_device *acpi_dev)
 error:
 	kfree(data->ntmp);
 	kfree(data->nfan);
-	input_free_device(data->input);
 	return err;
 }
 
-- 
2.31.1

