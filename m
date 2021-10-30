Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8626CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Oct 2021 15:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 517F860E90
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Oct 2021 15:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhJ3Poq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Oct 2021 11:44:46 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:58769 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230086AbhJ3Poq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Oct 2021 11:44:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 6A1A33200A6A;
        Sat, 30 Oct 2021 11:42:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 30 Oct 2021 11:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mPmEVTq+EenoEBBkv
        7l1wD8iX9tlPk556ZAum2ql9Os=; b=bfBJhW1dgrCCSW8qs6WS/yq2SnJDYaFdv
        RAm6Wjm/bEiVy4q0LeW+oHeZo3s6ERx9KcLOO9+21WsT+wwCns3/E2QXiUDn4OF6
        nK5T5TGlZg4pZV/TzY/fr/DJ+WXx+LkWyD1Bp/tEWe3u3Lp+vB/Bz3KN4yd5NC9p
        ZqcuCPTdSPtXR3M532mmN6WuAhn1ivJWzbqpriIZY0HBASa5TzYJe7eptfVlK3y3
        MT8B4wK0B787FWF9PiYZSy5XVlLKw0WP7G3fqx1yOv4YhQk72ZUIayTg56LvU0wM
        gJCTbACOHUFj5fflozwOWCamr05MtnO8T9UrC1t1CPdXlZwE8/NLA==
X-ME-Sender: <xms:1md9Ya7D4PFEzgMTNWVO3bVW7NWVJkMRhJr0KYhRhwZc2hdNOzGmuA>
    <xme:1md9YT7B33xGQtN5uiHMDQ4jSXFbxAWMoQI_c4nDyWMSyoN0rl0WOjM5FHBA9m5av
    6BNvEATIv90j7ToQQ>
X-ME-Received: <xmr:1md9YZdTaxPvW_EiozkN4HtHsmkzI0hpmH8_HbmIPHeW7lsKTKGZqE9C3ZimSfpYyER5Lpyu_3mqFOpno6BBZY_F2QP2uRi3ND_BOMk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegjedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhrugesshih
    shhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeeguefghfeigeelvddutdegtd
    eitedvffekledtjefhjeevgfetgfelteetheefgfenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehttghrrgiffhhorhgusehshihsthgvmhejie
    drtghomh
X-ME-Proxy: <xmx:1md9YXKt4_eUZOnEgmIhtU2gHZrcZpZVKGIWJ4TQbTJwj5ZTQzYr9g>
    <xmx:1md9YeIJIRclcE1VcHGa9hVdD24109vPLz2pJX4OA3ucbUn3tQR5ng>
    <xmx:1md9YYzdMCHaIwHrN3-Z9YbTJx3cC4N9hbmcLBbPLy2wBhYVo4YWjA>
    <xmx:1md9YYys4C_an82e__R7hAjPnCGKsQ_nfcvdaikZ-RIerd2ofbleDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Oct 2021 11:42:14 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH v2] platform/x86: system76_acpi: Fix input device error handling
Date:   Sat, 30 Oct 2021 09:42:13 -0600
Message-Id: <20211030154213.2515-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Users on darp6 that do not have Open EC firmware have reported crashes
on boot. Correct the error handling for the input device to fix it.

Managed devices do not need to be explicitly unregistered or freed, as
this is handled by devres. Drop the call to input_free_device.

Fixes: 0de30fc684b ("platform/x86: system76_acpi: Replace Fn+F2 function for OLED models")

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 drivers/platform/x86/system76_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index b3c8178420b1..8b292ee95a14 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -739,7 +739,6 @@ static int system76_add(struct acpi_device *acpi_dev)
 error:
 	kfree(data->ntmp);
 	kfree(data->nfan);
-	input_free_device(data->input);
 	return err;
 }
 
-- 
2.31.1

