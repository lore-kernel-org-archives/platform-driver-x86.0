Return-Path: <SRS0=GDfv=DA=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D0AC4727E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 17:27:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 412A121BE5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 17:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgIWR1k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Sep 2020 13:27:40 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:35533 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726537AbgIWR1j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 13:27:39 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 23 Sep 2020 20:20:57 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08NHKtgl020358;
        Wed, 23 Sep 2020 20:20:57 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 1/5] platform/x86: mlx-platform: Remove PSU EEPROM configuration
Date:   Wed, 23 Sep 2020 20:20:49 +0300
Message-Id: <20200923172053.26296-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200923172053.26296-1-vadimp@nvidia.com>
References: <20200923172053.26296-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove PSU EEPROM configuration for systems class equipped with
Mellanox chip Spectrume-2. Till now all the systems from this class
used few types of power units, all equipped with EEPROM device with
address space two bytes. Thus, all these devices have been handled by
EEPROM driver "24c32".
There is a new requirement is to support power unit replacement by "off
the shelf" device, matching electrical required parameters. Such device
could be equipped with different EEPROM type, which could be one byte
address space addressing or even could be not equipped with EEPROM.
In such case "24c32" will not work.

Fixes: 1bd42d94ccab ("platform/x86: mlx-platform: Add support for new 200G IB and Ethernet systems")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 8cf8c1be2666..e57d2471dfcb 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -329,15 +329,6 @@ static struct i2c_board_info mlxplat_mlxcpld_psu[] = {
 	},
 };
 
-static struct i2c_board_info mlxplat_mlxcpld_ng_psu[] = {
-	{
-		I2C_BOARD_INFO("24c32", 0x51),
-	},
-	{
-		I2C_BOARD_INFO("24c32", 0x50),
-	},
-};
-
 static struct i2c_board_info mlxplat_mlxcpld_pwr[] = {
 	{
 		I2C_BOARD_INFO("dps460", 0x59),
@@ -762,15 +753,13 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_psu_items_data[] = {
 		.label = "psu1",
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = BIT(0),
-		.hpdev.brdinfo = &mlxplat_mlxcpld_ng_psu[0],
-		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
 	},
 	{
 		.label = "psu2",
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = BIT(1),
-		.hpdev.brdinfo = &mlxplat_mlxcpld_ng_psu[1],
-		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
 	},
 };
 
-- 
2.11.0

