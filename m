From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] acer-wmi/hp-wmi: use platform_device_unregister instead of
	platform_device_del in module_exit
Date: Thu, 03 Jun 2010 15:18:03 +0800
Message-ID: <1275549483.16917.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:50956 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871Ab0FCHRj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Jun 2010 03:17:39 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, "John W. Linville" <linville@tuxdriver.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, Len Brown <len.brown@intel.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org

platform_device_unregister will also call platform_device_put() to drop reference count.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/acer-wmi.c |    2 +-
 drivers/platform/x86/hp-wmi.c   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1ea6c43..d3904e5 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1358,7 +1358,7 @@ static void __exit acer_wmi_exit(void)
 {
 	remove_sysfs(acer_platform_device);
 	remove_debugfs();
-	platform_device_del(acer_platform_device);
+	platform_device_unregister(acer_platform_device);
 	platform_driver_unregister(&acer_platform_driver);
 
 	printk(ACER_INFO "Acer Laptop WMI Extras unloaded\n");
diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 51c07a0..409115d 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -611,7 +611,7 @@ static void __exit hp_wmi_exit(void)
 		input_unregister_device(hp_wmi_input_dev);
 	}
 	if (hp_wmi_platform_dev) {
-		platform_device_del(hp_wmi_platform_dev);
+		platform_device_unregister(hp_wmi_platform_dev);
 		platform_driver_unregister(&hp_wmi_driver);
 	}
 }
-- 
1.5.4.3



