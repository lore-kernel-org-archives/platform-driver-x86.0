From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 08/12] platform/x86: wmi: Cleanup exit routine in reverse order of init
Date: Thu, 21 Sep 2017 08:57:13 -0500
Message-ID: <1181b0a5cebe331e044852f9bc1d385241e56d0e.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The initialize routine is:
* class -> bus -> platform

The exit routine is:
* platform -> class -> bus

Fix the exit routine to be:
* platform -> bus -> class

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 0765b1797d4c..077a9b7459ef 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1264,8 +1264,8 @@ static int __init acpi_wmi_init(void)
 static void __exit acpi_wmi_exit(void)
 {
 	platform_driver_unregister(&acpi_wmi_driver);
-	class_unregister(&wmi_bus_class);
 	bus_unregister(&wmi_bus_type);
+	class_unregister(&wmi_bus_class);
 }
 
 subsys_initcall(acpi_wmi_init);
-- 
2.14.1
