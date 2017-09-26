From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 01/14] platform/x86: dell-wmi: label driver as handling notifications
Date: Tue, 26 Sep 2017 13:49:59 -0500
Message-ID: <2c923ea1cdb0a336bf849fa8a2d81bb93060fccb.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

This driver serves the purpose of responding to WMI based notifications
from the DELL_EVENT_GUID (9DBB5994-A997-11DA-B012-B622A1EF5492).
Other GUIDs will be handled by separate drivers.

Update the language used by this driver to avoid future confusion.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 MAINTAINERS                  | 2 +-
 drivers/platform/x86/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2281af4b41b6..5d8ea24a8ee7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3996,7 +3996,7 @@ S:	Maintained
 F:	Documentation/dcdbas.txt
 F:	drivers/firmware/dcdbas.*
 
-DELL WMI EXTRAS DRIVER
+DELL WMI NOTIFICATIONS DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali.rohar@gmail.com>
 S:	Maintained
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 80b87954f6dd..9e52f05daa2e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -116,7 +116,7 @@ config DELL_LAPTOP
 	laptops (except for some models covered by the Compal driver).
 
 config DELL_WMI
-	tristate "Dell WMI extras"
+	tristate "Dell WMI notifications"
 	depends on ACPI_WMI
 	depends on DMI
 	depends on INPUT
-- 
2.14.1
