From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 1/1] platform/x86: mlx-platform: Allow compilation for 32 bit arch
Date: Wed, 17 Jan 2018 18:20:57 +0000
Message-ID: <1516213257-32157-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:47794 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753671AbeAQQYo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Jan 2018 11:24:44 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

It makes mlx-platform available for 32 bit architecture.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8a07df5..b9b40e3 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1157,7 +1157,6 @@ config INTEL_TELEMETRY
 
 config MLX_PLATFORM
 	tristate "Mellanox Technologies platform support"
-	depends on X86_64
 	---help---
 	  This option enables system support for the Mellanox Technologies
 	  platform. The Mellanox systems provide data center networking
-- 
2.1.4
