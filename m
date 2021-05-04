Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D1AC433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 12:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 579CA613B4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 12:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhEDMcq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 08:32:46 -0400
Received: from www.zeus03.de ([194.117.254.33]:41252 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230286AbhEDMcq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 08:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=a/ZpAbyKnThErXR74M8P2BQrOqd
        6K1JJlM37FOkicUs=; b=Ps/d/Ml6mw0ZdneEf059fRu+v30xZhWBR5rtvRaGShG
        FxwKfRZ199UeGtG/X3580QNLLunJ3P2ZzLW2xtOik03dg9G//fdG8tmkYVnsvrvv
        4h8EvV3PCV0nY6DFUyviMjEQkyXg0zwloUWdBabD6f/PR4xEpqO8w7EUDXBgTZoE
        =
Received: (qmail 1358366 invoked from network); 4 May 2021 14:31:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2021 14:31:50 +0200
X-UD-Smtp-Session: l3s3148p1@qGAmQ4DBvosgAwDPXxOMAJUzfx/HAvHg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: samsung-laptop: set debugfs blobs to read only
Date:   Tue,  4 May 2021 14:31:39 +0200
Message-Id: <20210504123139.45101-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Those blobs can only be read. So, don't confuse users with 'writable'
flags.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Found while working with blobs myself. I don't have the HW.

 drivers/platform/x86/samsung-laptop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index d5cec6e35bb8..7e1dedde6dab 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1301,13 +1301,13 @@ static void samsung_debugfs_init(struct samsung_laptop *samsung)
 			   &samsung->debug.data.d2);
 	debugfs_create_u8("d3", S_IRUGO | S_IWUSR, root,
 			  &samsung->debug.data.d3);
-	debugfs_create_blob("data", S_IRUGO | S_IWUSR, root,
+	debugfs_create_blob("data", S_IRUGO, root,
 			    &samsung->debug.data_wrapper);
-	debugfs_create_blob("f0000_segment", S_IRUSR | S_IWUSR, root,
+	debugfs_create_blob("f0000_segment", S_IRUSR, root,
 			    &samsung->debug.f0000_wrapper);
 	debugfs_create_file("call", S_IFREG | S_IRUGO, root, samsung,
 			    &samsung_laptop_call_fops);
-	debugfs_create_blob("sdiag", S_IRUGO | S_IWUSR, root,
+	debugfs_create_blob("sdiag", S_IRUGO, root,
 			    &samsung->debug.sdiag_wrapper);
 }
 
-- 
2.30.0

