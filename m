From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] apple-gmux: Fix kconfig dependencies
Date: Mon,  2 Jul 2012 09:55:29 -0500
Message-ID: <1341240929-3400-1-git-send-email-seth.forshee@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: Arun Raghavan <arun.raghavan@collabora.co.uk>, linux-kernel@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix the dependencies of apple-gmux to prevent it from being built-in
when one or more of its dependencies is built as a module. Otherwise it
can fail to build due to missing symbols.

Reported-by: Arun Raghavan <arun.raghavan@collabora.co.uk>
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/Kconfig |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 2a262f5..cf65f0a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -759,7 +759,9 @@ config SAMSUNG_Q10
 config APPLE_GMUX
 	tristate "Apple Gmux Driver"
 	depends on PNP
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_APPLE=n || BACKLIGHT_APPLE
+	depends on ACPI_VIDEO=n || ACPI_VIDEO
 	---help---
 	  This driver provides support for the gmux device found on many
 	  Apple laptops, which controls the display mux for the hybrid
-- 
1.7.9.5
