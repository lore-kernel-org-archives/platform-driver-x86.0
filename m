From: Ivan Vecera <ivecera@redhat.com>
Subject: [PATCH] platform/x86: mlx-platform: fix module aliases
Date: Fri, 19 Jan 2018 09:31:56 +0100
Message-ID: <20180119083156.4082-1-ivecera@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35356 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754970AbeASIb7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 03:31:59 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: vadimp@mellanox.com

Missing prefix 'pn' in MODULE_ALIAS lines causes that the module is
not loaded automatically. The patch changes them so they match
the entries in mlxplat_dmi_table where BOARD_VENDOR and PRODUCT_NAME
are used.

Fixes: 6613d18e9038 ("platform/x86: mlx-platform: Move module from arch/x86")
Cc: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/platform/x86/mlx-platform.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 504256c3660d..b1a5bbe4acf0 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -370,8 +370,8 @@ module_exit(mlxplat_exit);
 MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
 MODULE_DESCRIPTION("Mellanox platform driver");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSN24*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSN27*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSB*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSX*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSN21*:");
+MODULE_ALIAS("dmi:*:pnMSN24*:*:rvnMellanoxTechnologies*:");
+MODULE_ALIAS("dmi:*:pnMSN27*:*:rvnMellanoxTechnologies*:");
+MODULE_ALIAS("dmi:*:pnMSB*:*:rvnMellanoxTechnologies*:");
+MODULE_ALIAS("dmi:*:pnMSX*:*:rvnMellanoxTechnologies*:");
+MODULE_ALIAS("dmi:*:pnMSN21*:*:rvnMellanoxTechnologies*:");
-- 
2.13.6
