From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/2] toshiba_haps: Change the error logging level from info to debug
Date: Wed,  7 Sep 2016 09:28:14 -0600
Message-ID: <20160907152815.5950-3-coproscefalo@gmail.com>
References: <20160907152815.5950-1-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160907152815.5950-1-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Two of the internal functions are printing an info message, one
whenever the HDD protection level changes, and another when the
driver receives an ACPI event.

This patch changes those two prints to debug, as that information
is more pertaining to debuging purposes.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_haps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
index 094f3a8..b3dec52 100644
--- a/drivers/platform/x86/toshiba_haps.c
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -59,7 +59,7 @@ static int toshiba_haps_protection_level(acpi_handle handle, int level)
 		return -EIO;
 	}
 
-	pr_info("HDD protection level set to: %d\n", level);
+	pr_debug("HDD protection level set to: %d\n", level);
 
 	return 0;
 }
@@ -141,7 +141,7 @@ static struct attribute_group haps_attr_group = {
  */
 static void toshiba_haps_notify(struct acpi_device *device, u32 event)
 {
-	pr_info("Received event: 0x%x", event);
+	pr_debug("Received event: 0x%x", event);
 
 	acpi_bus_generate_netlink_event(device->pnp.device_class,
 					dev_name(&device->dev),
-- 
2.9.3
