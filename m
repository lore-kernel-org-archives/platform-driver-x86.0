Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAAEC433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Mar 2021 19:21:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5E1261A26
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Mar 2021 19:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhCZTU4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Mar 2021 15:20:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48420 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhCZTU0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Mar 2021 15:20:26 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lPs0N-0005lC-2u; Fri, 26 Mar 2021 19:20:23 +0000
From:   Colin King <colin.king@canonical.com>
To:     Kenneth Chan <kenneth.t.chan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: panasonic-laptop: remove redundant assignment of variable result
Date:   Fri, 26 Mar 2021 19:20:22 +0000
Message-Id: <20210326192022.623001-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being assigned a value that is never
read and it is being updated later with a new value. The
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/panasonic-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 6388c3c705a6..d4f444401496 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -973,7 +973,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	pcc->mute = pcc->sinf[SINF_MUTE];
 	pcc->ac_brightness = pcc->sinf[SINF_AC_CUR_BRIGHT];
 	pcc->dc_brightness = pcc->sinf[SINF_DC_CUR_BRIGHT];
-	result = pcc->current_brightness = pcc->sinf[SINF_CUR_BRIGHT];
+	pcc->current_brightness = pcc->sinf[SINF_CUR_BRIGHT];
 
 	/* add sysfs attributes */
 	result = sysfs_create_group(&device->dev.kobj, &pcc_attr_group);
-- 
2.30.2

