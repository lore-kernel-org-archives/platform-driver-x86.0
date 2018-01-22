From: Ivan Vecera <ivecera@redhat.com>
Subject: [PATCH v3] platform/x86: mlx-platform: fix module aliases
Date: Mon, 22 Jan 2018 15:20:43 +0100
Message-ID: <20180122142043.23705-1-ivecera@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58238 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751144AbeAVOUq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 09:20:46 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Vadim Pasternak <vadimp@mellanox.com>, =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>, Andy Shevchenko <andy.shevchenko@gmail.com>

Missing prefix 'pn' in MODULE_ALIAS lines causes that the module is
not loaded automatically. The driver should use MODULE_DEVICE_TABLE
together with existing mlxplat_dmi_table instead.

Changes:
v2 - conversion to usage of MODULE_DEVICE_TABLE (thanks Bjørn)
v3 - MODULE_DEVICE_TABLE moved after mlxplat_dmi_table declaration

Fixes: 6613d18e9038 ("platform/x86: mlx-platform: Move module from arch/x86")
Cc: Vadim Pasternak <vadimp@mellanox.com>
Cc: Bjørn Mork <bjorn@mork.no>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/platform/x86/mlx-platform.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 504256c3660d..22cd011f6aee 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -286,6 +286,8 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{ }
 };
 
+MODULE_DEVICE_TABLE(dmi, mlxplat_dmi_table);
+
 static int __init mlxplat_init(void)
 {
 	struct mlxplat_priv *priv;
@@ -370,8 +372,3 @@ module_exit(mlxplat_exit);
 MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
 MODULE_DESCRIPTION("Mellanox platform driver");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSN24*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSN27*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSB*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSX*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSN21*:");
-- 
2.13.6
