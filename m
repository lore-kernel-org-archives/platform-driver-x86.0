From: Joe Perches <joe@perches.com>
Subject: [PATCH] platform/x86: wmi: Fix misuse of vsprintf extension %pULL
Date: Thu,  1 Mar 2018 08:08:23 -0800
Message-ID: <77b9d62ee2600bb01c08c618e67b63c8aaa35f49.1519920316.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

%pULL doesn't officially exist but %pUL does.

Miscellanea:

o Add missing newlines to a couple logging messages

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/platform/x86/wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index f90ba83359f5..8e3d0146ff8c 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -936,7 +936,7 @@ static int wmi_dev_probe(struct device *dev)
 		wblock->char_dev.mode = 0444;
 		ret = misc_register(&wblock->char_dev);
 		if (ret) {
-			dev_warn(dev, "failed to register char dev: %d", ret);
+			dev_warn(dev, "failed to register char dev: %d\n", ret);
 			ret = -ENOMEM;
 			goto probe_misc_failure;
 		}
@@ -1039,7 +1039,7 @@ static int wmi_create_device(struct device *wmi_bus_dev,
 
 	if (result) {
 		dev_warn(wmi_bus_dev,
-			 "%s data block query control method not found",
+			 "%s data block query control method not found\n",
 			 method);
 		return result;
 	}
@@ -1189,7 +1189,7 @@ static int parse_wdg(struct device *wmi_bus_dev, struct acpi_device *device)
 
 		retval = device_add(&wblock->dev.dev);
 		if (retval) {
-			dev_err(wmi_bus_dev, "failed to register %pULL\n",
+			dev_err(wmi_bus_dev, "failed to register %pUL\n",
 				wblock->gblock.guid);
 			if (debug_event)
 				wmi_method_enable(wblock, 0);
-- 
2.15.0
