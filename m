From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] MAINTAINERS: Add missing Toshiba devices and add myself as maintainer
Date: Fri,  6 Mar 2015 18:14:42 -0700
Message-ID: <1425690882-2772-2-git-send-email-coproscefalo@gmail.com>
References: <1425690882-2772-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425690882-2772-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Add the missing toshiba_bluetooth and toshiba_haps entries and add
myself as their maintainer.

Also add the Maintainers entry for toshiba_acpi driver and change its
status to maintained.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 MAINTAINERS | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3376bda..7dcbd22e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9849,10 +9849,23 @@ S:	Maintained
 F:	drivers/platform/x86/topstar-laptop.c
 
 TOSHIBA ACPI EXTRAS DRIVER
+M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Orphan
+S:	Maintained
 F:	drivers/platform/x86/toshiba_acpi.c
 
+TOSHIBA BLUETOOTH DRIVER
+M:	Azael Avalos <coproscefalo@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/toshiba_bluetooth.c
+
+TOSHIBA HDD ACTIVE PROTECTION SENSOR DRIVER
+M:	Azael Avalos <coproscefalo@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/toshiba_haps.c
+
 TOSHIBA SMM DRIVER
 M:	Jonathan Buzzard <jonathan@buzzard.org.uk>
 L:	tlinux-users@tce.toshiba-dme.co.jp
-- 
2.2.2
