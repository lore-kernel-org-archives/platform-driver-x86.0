From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v9 2/4] platform/mellanox: mlxreg-hotplug: Allow driver for ARM architecture
Date: Wed, 17 Jan 2018 18:21:54 +0000
Message-ID: <1516213316-32278-3-git-send-email-vadimp@mellanox.com>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

It allows driver to run on x86 and ARM architecture based systems.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v9->v8
  Comments pointed out by Darren:
 - Leave in this patch only the code related to ARM architecture.
   Move other code to a separate patch, since it is not related to
   subject.
---
 drivers/platform/mellanox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index d735292..0267e1d 100644
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
