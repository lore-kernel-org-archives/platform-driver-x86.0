From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] apple-gmux: Fix kconfig dependencies
Date: Thu,  2 Aug 2012 12:15:14 -0500
Message-ID: <1343927714-14937-1-git-send-email-seth.forshee@canonical.com>
References: <1341240929-3400-1-git-send-email-seth.forshee@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1341240929-3400-1-git-send-email-seth.forshee@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: Arun Raghavan <arun.raghavan@collabora.co.uk>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Fix the dependencies of apple-gmux to prevent it from being built-in
when one or more of its dependencies is built as a module. Otherwise it
can fail to build due to missing symbols.

v2: Add dependency on ACPI to fix build failure when ACPI=n

Reported-by: Arun Raghavan <arun.raghavan@collabora.co.uk>
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/Kconfig |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 2a262f5..637074d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -758,8 +758,11 @@ config SAMSUNG_Q10
 
 config APPLE_GMUX
 	tristate "Apple Gmux Driver"
+	depends on ACPI
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
