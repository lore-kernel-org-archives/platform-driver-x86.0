Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5CEC433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 17:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B22446112F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 17:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhEDRBd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 13:01:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:48104 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231280AbhEDRBc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 13:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=QwoCMbS9khJaBf
        4Dk09ZsCmrd5QikVNwp7vcCFcEWSk=; b=YKiJNzPqUo31BIZWxFvFt+TuszT861
        IiyTeHtZwfI8elzGwfeVNtdCT7anDuRPiqSMHGcXVe5HbKXsMBEhkvQYoY13nBjh
        Fb0nIN+LLbbvhjTLDKGxPu8UJa7/4CwEDkl8xXHEadAr3UMpF8+l1BbiSsu950Lr
        xEy1ETxMPGvqw=
Received: (qmail 1437723 invoked from network); 4 May 2021 19:00:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2021 19:00:36 +0200
X-UD-Smtp-Session: l3s3148p1@pDlUBITBqo8gAwDPXxOMAJUzfx/HAvHg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: samsung-laptop: set debugfs blobs to read only
Date:   Tue,  4 May 2021 19:00:29 +0200
Message-Id: <20210504170030.58447-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210504170030.58447-1-wsa+renesas@sang-engineering.com>
References: <20210504170030.58447-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Those blobs can only be read. So, don't confuse users with 'writable'
flags.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1: use octal numbers

 drivers/platform/x86/samsung-laptop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 763d97cbbe53..9aa0de8b7581 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1296,12 +1296,12 @@ static void samsung_debugfs_init(struct samsung_laptop *samsung)
 	debugfs_create_u32("d1", 0644, root, &samsung->debug.data.d1);
 	debugfs_create_u16("d2", 0644, root, &samsung->debug.data.d2);
 	debugfs_create_u8("d3", 0644, root, &samsung->debug.data.d3);
-	debugfs_create_blob("data", 0644, root, &samsung->debug.data_wrapper);
-	debugfs_create_blob("f0000_segment", 0600, root,
+	debugfs_create_blob("data", 0444, root, &samsung->debug.data_wrapper);
+	debugfs_create_blob("f0000_segment", 0400, root,
 			    &samsung->debug.f0000_wrapper);
 	debugfs_create_file("call", S_IFREG | 0444, root, samsung,
 			    &samsung_laptop_call_fops);
-	debugfs_create_blob("sdiag", 0644, root, &samsung->debug.sdiag_wrapper);
+	debugfs_create_blob("sdiag", 0444, root, &samsung->debug.sdiag_wrapper);
 }
 
 static void samsung_sabi_exit(struct samsung_laptop *samsung)
-- 
2.30.0

