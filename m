From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 2/4] platform/x86: mlx-platform: Add define for the negative bus
Date: Fri,  2 Feb 2018 08:45:46 +0000
Message-ID: <1517561148-38587-3-git-send-email-vadimp@mellanox.com>
References: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:48972 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751463AbeBBGte (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Feb 2018 01:49:34 -0500
In-Reply-To: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

Add define for the negative bus Id in order to use it in case no hotplug
device is associated with hotplug interrupt signal. In this case signal
will be handled by mlxreg-hotplug driver, but any device will not be
associated with this signal.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index a1ae93d..177b40a 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -90,6 +90,7 @@
 #define MLXPLAT_CPLD_LPC_MUX_DEVS		2
 
 /* Hotplug devices adapter numbers */
+#define MLXPLAT_CPLD_NR_NONE			-1
 #define MLXPLAT_CPLD_PSU_DEFAULT_NR		10
 #define MLXPLAT_CPLD_FAN1_DEFAULT_NR		11
 #define MLXPLAT_CPLD_FAN2_DEFAULT_NR		12
-- 
2.1.4
