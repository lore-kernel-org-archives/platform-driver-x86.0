From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 1/4] platform/x86: mlx-platform: Use define for the channel numbers
Date: Tue, 13 Feb 2018 22:09:33 +0000
Message-ID: <1518559776-188942-2-git-send-email-vadimp@mellanox.com>
References: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:35354 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S965642AbeBMUNR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Feb 2018 15:13:17 -0500
In-Reply-To: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, Vadim Pasternak <vadimp@mellanox.com>

Add define for the channels number for mux device, instead of using
hardcoded value inside the code in order to improve code readability.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 454e14f..71b452a 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -85,6 +85,9 @@
 #define MLXPLAT_CPLD_FAN_MASK		GENMASK(3, 0)
 #define MLXPLAT_CPLD_FAN_NG_MASK	GENMASK(5, 0)
 
+/* Number of channels in group */
+#define MLXPLAT_CPLD_GRP_CHNL_NUM		8
+
 /* Start channel numbers */
 #define MLXPLAT_CPLD_CH1			2
 #define MLXPLAT_CPLD_CH2			10
@@ -124,7 +127,7 @@ static const struct resource mlxplat_lpc_resources[] = {
 };
 
 /* Platform default channels */
-static const int mlxplat_default_channels[][8] = {
+static const int mlxplat_default_channels[][MLXPLAT_CPLD_GRP_CHNL_NUM] = {
 	{
 		MLXPLAT_CPLD_CH1, MLXPLAT_CPLD_CH1 + 1, MLXPLAT_CPLD_CH1 + 2,
 		MLXPLAT_CPLD_CH1 + 3, MLXPLAT_CPLD_CH1 + 4, MLXPLAT_CPLD_CH1 +
-- 
2.1.4
