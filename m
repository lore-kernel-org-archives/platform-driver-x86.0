Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0B3C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 22:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A860223C8
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 22:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgLCWbv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Dec 2020 17:31:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:55324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727725AbgLCWbv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Dec 2020 17:31:51 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Vadim Pasternak <vadimp@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Shych <michaelsh@mellanox.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] platform/x86: mlx-platform: remove an unused variable
Date:   Thu,  3 Dec 2020 23:30:56 +0100
Message-Id: <20201203223105.1195709-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The only reference to the mlxplat_mlxcpld_psu[] array got removed,
so there is now a warning from clang:

drivers/platform/x86/mlx-platform.c:322:30: error: variable 'mlxplat_mlxcpld_psu' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
static struct i2c_board_info mlxplat_mlxcpld_psu[] = {

Remove the array as well and adapt the ARRAY_SIZE() call
accordingly.

Fixes: 912b341585e3 ("platform/x86: mlx-platform: Remove PSU EEPROM from MSN274x platform configuration")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/mlx-platform.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 598f44558764..6a634b72bfc2 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -319,15 +319,6 @@ static struct i2c_mux_reg_platform_data mlxplat_extended_mux_data[] = {
 };
 
 /* Platform hotplug devices */
-static struct i2c_board_info mlxplat_mlxcpld_psu[] = {
-	{
-		I2C_BOARD_INFO("24c02", 0x51),
-	},
-	{
-		I2C_BOARD_INFO("24c02", 0x50),
-	},
-};
-
 static struct i2c_board_info mlxplat_mlxcpld_pwr[] = {
 	{
 		I2C_BOARD_INFO("dps460", 0x59),
@@ -456,7 +447,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_PSU_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_psu),
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -495,7 +486,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_psu),
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
-- 
2.27.0

