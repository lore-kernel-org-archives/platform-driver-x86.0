Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4153C07E95
	for <platform-driver-x86@archiver.kernel.org>; Sat, 10 Jul 2021 19:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC87861179
	for <platform-driver-x86@archiver.kernel.org>; Sat, 10 Jul 2021 19:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhGJTR3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 10 Jul 2021 15:17:29 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:60396
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229599AbhGJTR3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Jul 2021 15:17:29 -0400
X-Greylist: delayed 378 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Jul 2021 15:17:29 EDT
Received: from canonical.com (d104-157-108-141.abhsia.telus.net [104.157.108.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 323D3404A0;
        Sat, 10 Jul 2021 19:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1625944099;
        bh=M4Ls0Mxt20LCJ+0UOrPIwjckk7zIu6GIruumJ9GL5uI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=jm+y2rn7u3Us8Ul2I/E8N3m05eo7LFywtGhwpb9mGo16cl2ajw/tBHgF+v1JXYv55
         S974jtT2DYjBm6Bj99SOjJnnR9dLd/DtdWGpip10vKuz1zobWX62MNaIqqbXhBvONh
         lZtwa/cku1e6+ptQjuAn+oKODwt9V22gtAJD6JkKYkMpmb6LVZyM5m+zB/Pi/S3j1W
         8QlDZH23qYeTLF16xKkBPC7ytgQtuOxq2rL3l59Rfpfh4cyEEudqWcK+Qr/XAqXOH5
         lr+Kf5Yx1rodBCpXxqqRhfUBfKx9icyskI6aa+FEqRKg4m2CU/PzqasbW+Ulpp1dR/
         tgOjrsfUT0xIQ==
From:   Alex Hung <alex.hung@canonical.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     alex.hung@canonical.com
Subject: [PATCH] platform/x86: remove hardcoded "hp" from the error message
Date:   Sat, 10 Jul 2021 13:08:10 -0600
Message-Id: <20210710190810.313104-1-alex.hung@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This driver is no longer specific to HP laptops so "hp" in the error
message is no longer applicable.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/wireless-hotkey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wireless-hotkey.c b/drivers/platform/x86/wireless-hotkey.c
index b010e4ca3383..11c60a273446 100644
--- a/drivers/platform/x86/wireless-hotkey.c
+++ b/drivers/platform/x86/wireless-hotkey.c
@@ -78,7 +78,7 @@ static int wl_add(struct acpi_device *device)
 
 	err = wireless_input_setup();
 	if (err)
-		pr_err("Failed to setup hp wireless hotkeys\n");
+		pr_err("Failed to setup wireless hotkeys\n");
 
 	return err;
 }
-- 
2.32.0

