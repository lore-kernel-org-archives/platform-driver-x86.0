Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467CBC64E75
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 10:11:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF30920872
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 10:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgKYKLC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:11:02 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:37722 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726928AbgKYKLB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Nov 2020 05:11:01 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 25 Nov 2020 12:10:59 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0APAAvju025972;
        Wed, 25 Nov 2020 12:10:58 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 1/2] platform/x86: mlx-platform: Remove PSU EEPROM from default platform configuration
Date:   Wed, 25 Nov 2020 12:10:55 +0200
Message-Id: <20201125101056.174708-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201125101056.174708-1-vadimp@nvidia.com>
References: <20201125101056.174708-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove PSU EEPROM configuration for systems class equipped with
Mellanox chip Spectrum and Celeron CPU - system types MSN2700, MSN2100.
Till now all the systems from this class used few types of power units,
all equipped with EEPROM device with address space two bytes. Thus, all
these devices have been handled by EEPROM driver "24c02".

There is a new requirement is to support power unit replacement by "off
the shelf" device, matching electrical required parameters. Such device
can be equipped with different EEPROM type, which could be one byte
address space addressing or even could be not equipped with EEPROM.
In such case "24c02" will not work.

Fixes: c6acad68e ("platform/mellanox: mlxreg-hotplug: Modify to use a regmap interface")
Fixes: ba814fdd0 ("platform/x86: mlx-platform: Use defines for bus assignment")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 986ad3dda1c1..623e7f737d4a 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -383,15 +383,13 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_psu_items_data[] = {
 		.label = "psu1",
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = BIT(0),
-		.hpdev.brdinfo = &mlxplat_mlxcpld_psu[0],
-		.hpdev.nr = MLXPLAT_CPLD_PSU_DEFAULT_NR,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
 	},
 	{
 		.label = "psu2",
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = BIT(1),
-		.hpdev.brdinfo = &mlxplat_mlxcpld_psu[1],
-		.hpdev.nr = MLXPLAT_CPLD_PSU_DEFAULT_NR,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
 	},
 };
 
-- 
2.11.0

