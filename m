Return-Path: <SRS0=GDfv=DA=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BCEC4741F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 17:27:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A781821D43
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 17:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgIWR1r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Sep 2020 13:27:47 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:35540 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726755AbgIWR1p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 13:27:45 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 23 Sep 2020 20:21:02 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08NHKtgp020358;
        Wed, 23 Sep 2020 20:21:02 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 5/5] platform/x86: mlx-platform: Add capability field to platform FAN description
Date:   Wed, 23 Sep 2020 20:20:53 +0300
Message-Id: <20200923172053.26296-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200923172053.26296-1-vadimp@nvidia.com>
References: <20200923172053.26296-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Set 'capability' field to FAN core platform data..
The content of 'capability' register allows to set the mapping between
the drawers and tachometers.
The motivation is to avoid adding a new code in the future in order to
distinct between the systems types supporting a different kinds of the
FAN drawers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 04a745095c37..986ad3dda1c1 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -1939,6 +1939,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 static struct mlxreg_core_platform_data mlxplat_default_fan_data = {
 		.data = mlxplat_mlxcpld_default_fan_data,
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_data),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
 };
 
 /* Watchdog type1: hardware implementation version1
-- 
2.11.0

