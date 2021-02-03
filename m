Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9872CC4332D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61B5E64F87
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbhBCRhW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 12:37:22 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50965 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232313AbhBCRhU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 12:37:20 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 3 Feb 2021 19:36:29 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 113HaOOK001002;
        Wed, 3 Feb 2021 19:36:29 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH RFC platform-next 5/8] platform/mellanox: mlxreg-io: Extend number of hwmon attributes
Date:   Wed,  3 Feb 2021 19:36:19 +0200
Message-Id: <20210203173622.5845-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173622.5845-1-vadimp@nvidia.com>
References: <20210203173622.5845-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend maximum number of the attributes, exposed to 'sysfs'.
It is requires in order to support modular systems, which
provide more attributes for system control, statuses and info.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
index 7646708d57e4..43e9228a8fd3 100644
--- a/drivers/platform/mellanox/mlxreg-io.c
+++ b/drivers/platform/mellanox/mlxreg-io.c
@@ -18,7 +18,7 @@
 
 /* Attribute parameters. */
 #define MLXREG_IO_ATT_SIZE	10
-#define MLXREG_IO_ATT_NUM	48
+#define MLXREG_IO_ATT_NUM	96
 
 /**
  * struct mlxreg_io_priv_data - driver's private data:
-- 
2.11.0

