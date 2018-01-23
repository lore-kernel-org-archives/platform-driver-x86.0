From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v10 6/6] platform/mellanox: mlxreg-hotplug: Enable building for ARM
Date: Tue, 23 Jan 2018 20:34:25 +0000
Message-ID: <1516739665-132304-6-git-send-email-vadimp@mellanox.com>
References: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:40424 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752508AbeAWSiT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Jan 2018 13:38:19 -0500
In-Reply-To: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

Add ARM in addition to X86 as supported architectures in the Mellanox
Hotplug Platform driver Kconfig entry.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v10->v9
v9->v8
  Comments pointed out by Darren:
 - Leave in this patch only the code related to ARM architecture.
   Move other code to a separate patch, since it is not related to
   subject.
---
 drivers/platform/mellanox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index 0fb25687..591bccd 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig MELLANOX_PLATFORM
 	bool "Platform support for Mellanox hardware"
-	depends on X86 || COMPILE_TEST
+	depends on X86 || ARM || COMPILE_TEST
 	---help---
 	  Say Y here to get to see options for platform support for
 	  Mellanox systems. This option alone does not add any kernel code.
-- 
2.1.4
