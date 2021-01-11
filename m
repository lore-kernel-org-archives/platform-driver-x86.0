Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9027C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jan 2021 14:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F0D12255F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jan 2021 14:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbhAKOre (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jan 2021 09:47:34 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:45298 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731731AbhAKOre (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jan 2021 09:47:34 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kyyT2-0007zf-SS; Mon, 11 Jan 2021 14:46:48 +0000
From:   Colin King <colin.king@canonical.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] platform/surface: fix potential integer overflow on shift of a int
Date:   Mon, 11 Jan 2021 14:46:48 +0000
Message-Id: <20210111144648.20498-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
arithmetic and then passed as a 64 bit function argument. In the case where
func is 32 or more this can lead to an oveflow.  Avoid this by shifting
using the BIT_ULL macro instead.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: fc00bc8ac1da ("platform/surface: Add Surface ACPI Notify driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/surface/surface_acpi_notify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
index 8cd67a669c86..ef9c1f8e8336 100644
--- a/drivers/platform/surface/surface_acpi_notify.c
+++ b/drivers/platform/surface/surface_acpi_notify.c
@@ -188,7 +188,7 @@ static int san_acpi_notify_event(struct device *dev, u64 func,
 	union acpi_object *obj;
 	int status = 0;
 
-	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, 1 << func))
+	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, BIT_ULL(func)))
 		return 0;
 
 	dev_dbg(dev, "notify event %#04llx\n", func);
-- 
2.29.2

