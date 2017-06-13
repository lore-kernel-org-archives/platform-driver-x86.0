From: <gregkh@linuxfoundation.org>
Subject: patch "platform: thinkpad_acpi: convert to use DRIVER_ATTR_RO/RW" added to driver-core-next
Date: Tue, 13 Jun 2017 07:58:58 +0200
Message-ID: <149733353862124@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:43388 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752356AbdFMF7Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 01:59:16 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org, hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br, platform-driver-x86@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    platform: thinkpad_acpi: convert to use DRIVER_ATTR_RO/RW

to my driver-core git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
in the driver-core-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


From ac3054c4f6daa57c2af71abc312b396c68fde71a Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 9 Jun 2017 11:03:12 +0200
Subject: platform: thinkpad_acpi: convert to use DRIVER_ATTR_RO/RW

We are trying to get rid of DRIVER_ATTR(), and the thinkpad_acpi
driver's attributes can be trivially changed to use DRIVER_ATTR_RO() and
DRIVER_ATTR_RW().

Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: <ibm-acpi-devel@lists.sourceforge.net>
Cc: <platform-driver-x86@vger.kernel.org>
Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 91 +++++++++++-------------------------
 1 file changed, 28 insertions(+), 63 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7b6cb0c69b02..f6861b551178 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1438,25 +1438,20 @@ static int tpacpi_rfk_procfs_write(const enum tpacpi_rfk_id id, char *buf)
  */
 
 /* interface_version --------------------------------------------------- */
-static ssize_t tpacpi_driver_interface_version_show(
-				struct device_driver *drv,
-				char *buf)
+static ssize_t interface_version_show(struct device_driver *drv, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "0x%08x\n", TPACPI_SYSFS_VERSION);
 }
-
-static DRIVER_ATTR(interface_version, S_IRUGO,
-		tpacpi_driver_interface_version_show, NULL);
+static DRIVER_ATTR_RO(interface_version);
 
 /* debug_level --------------------------------------------------------- */
-static ssize_t tpacpi_driver_debug_show(struct device_driver *drv,
-						char *buf)
+static ssize_t debug_level_show(struct device_driver *drv, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "0x%04x\n", dbg_level);
 }
 
-static ssize_t tpacpi_driver_debug_store(struct device_driver *drv,
-						const char *buf, size_t count)
+static ssize_t debug_level_store(struct device_driver *drv, const char *buf,
+				 size_t count)
 {
 	unsigned long t;
 
@@ -1467,34 +1462,28 @@ static ssize_t tpacpi_driver_debug_store(struct device_driver *drv,
 
 	return count;
 }
-
-static DRIVER_ATTR(debug_level, S_IWUSR | S_IRUGO,
-		tpacpi_driver_debug_show, tpacpi_driver_debug_store);
+static DRIVER_ATTR_RW(debug_level);
 
 /* version ------------------------------------------------------------- */
-static ssize_t tpacpi_driver_version_show(struct device_driver *drv,
-						char *buf)
+static ssize_t version_show(struct device_driver *drv, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%s v%s\n",
 			TPACPI_DESC, TPACPI_VERSION);
 }
-
-static DRIVER_ATTR(version, S_IRUGO,
-		tpacpi_driver_version_show, NULL);
+static DRIVER_ATTR_RO(version);
 
 /* --------------------------------------------------------------------- */
 
 #ifdef CONFIG_THINKPAD_ACPI_DEBUGFACILITIES
 
 /* wlsw_emulstate ------------------------------------------------------ */
-static ssize_t tpacpi_driver_wlsw_emulstate_show(struct device_driver *drv,
-						char *buf)
+static ssize_t wlsw_emulstate_show(struct device_driver *drv, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", !!tpacpi_wlsw_emulstate);
 }
 
-static ssize_t tpacpi_driver_wlsw_emulstate_store(struct device_driver *drv,
-						const char *buf, size_t count)
+static ssize_t wlsw_emulstate_store(struct device_driver *drv, const char *buf,
+				    size_t count)
 {
 	unsigned long t;
 
@@ -1508,22 +1497,16 @@ static ssize_t tpacpi_driver_wlsw_emulstate_store(struct device_driver *drv,
 
 	return count;
 }
-
-static DRIVER_ATTR(wlsw_emulstate, S_IWUSR | S_IRUGO,
-		tpacpi_driver_wlsw_emulstate_show,
-		tpacpi_driver_wlsw_emulstate_store);
+static DRIVER_ATTR_RW(wlsw_emulstate);
 
 /* bluetooth_emulstate ------------------------------------------------- */
-static ssize_t tpacpi_driver_bluetooth_emulstate_show(
-					struct device_driver *drv,
-					char *buf)
+static ssize_t bluetooth_emulstate_show(struct device_driver *drv, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", !!tpacpi_bluetooth_emulstate);
 }
 
-static ssize_t tpacpi_driver_bluetooth_emulstate_store(
-					struct device_driver *drv,
-					const char *buf, size_t count)
+static ssize_t bluetooth_emulstate_store(struct device_driver *drv,
+					 const char *buf, size_t count)
 {
 	unsigned long t;
 
@@ -1534,22 +1517,16 @@ static ssize_t tpacpi_driver_bluetooth_emulstate_store(
 
 	return count;
 }
-
-static DRIVER_ATTR(bluetooth_emulstate, S_IWUSR | S_IRUGO,
-		tpacpi_driver_bluetooth_emulstate_show,
-		tpacpi_driver_bluetooth_emulstate_store);
+static DRIVER_ATTR_RW(bluetooth_emulstate);
 
 /* wwan_emulstate ------------------------------------------------- */
-static ssize_t tpacpi_driver_wwan_emulstate_show(
-					struct device_driver *drv,
-					char *buf)
+static ssize_t wwan_emulstate_show(struct device_driver *drv, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", !!tpacpi_wwan_emulstate);
 }
 
-static ssize_t tpacpi_driver_wwan_emulstate_store(
-					struct device_driver *drv,
-					const char *buf, size_t count)
+static ssize_t wwan_emulstate_store(struct device_driver *drv, const char *buf,
+				    size_t count)
 {
 	unsigned long t;
 
@@ -1560,22 +1537,16 @@ static ssize_t tpacpi_driver_wwan_emulstate_store(
 
 	return count;
 }
-
-static DRIVER_ATTR(wwan_emulstate, S_IWUSR | S_IRUGO,
-		tpacpi_driver_wwan_emulstate_show,
-		tpacpi_driver_wwan_emulstate_store);
+static DRIVER_ATTR_RW(wwan_emulstate);
 
 /* uwb_emulstate ------------------------------------------------- */
-static ssize_t tpacpi_driver_uwb_emulstate_show(
-					struct device_driver *drv,
-					char *buf)
+static ssize_t uwb_emulstate_show(struct device_driver *drv, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", !!tpacpi_uwb_emulstate);
 }
 
-static ssize_t tpacpi_driver_uwb_emulstate_store(
-					struct device_driver *drv,
-					const char *buf, size_t count)
+static ssize_t uwb_emulstate_store(struct device_driver *drv, const char *buf,
+				   size_t count)
 {
 	unsigned long t;
 
@@ -1586,10 +1557,7 @@ static ssize_t tpacpi_driver_uwb_emulstate_store(
 
 	return count;
 }
-
-static DRIVER_ATTR(uwb_emulstate, S_IWUSR | S_IRUGO,
-		tpacpi_driver_uwb_emulstate_show,
-		tpacpi_driver_uwb_emulstate_store);
+static DRIVER_ATTR_RW(uwb_emulstate);
 #endif
 
 /* --------------------------------------------------------------------- */
@@ -8606,14 +8574,13 @@ static ssize_t fan_fan2_input_show(struct device *dev,
 static DEVICE_ATTR(fan2_input, S_IRUGO, fan_fan2_input_show, NULL);
 
 /* sysfs fan fan_watchdog (hwmon driver) ------------------------------- */
-static ssize_t fan_fan_watchdog_show(struct device_driver *drv,
-				     char *buf)
+static ssize_t fan_watchdog_show(struct device_driver *drv, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%u\n", fan_watchdog_maxinterval);
 }
 
-static ssize_t fan_fan_watchdog_store(struct device_driver *drv,
-				      const char *buf, size_t count)
+static ssize_t fan_watchdog_store(struct device_driver *drv, const char *buf,
+				  size_t count)
 {
 	unsigned long t;
 
@@ -8630,9 +8597,7 @@ static ssize_t fan_fan_watchdog_store(struct device_driver *drv,
 
 	return count;
 }
-
-static DRIVER_ATTR(fan_watchdog, S_IWUSR | S_IRUGO,
-		fan_fan_watchdog_show, fan_fan_watchdog_store);
+static DRIVER_ATTR_RW(fan_watchdog);
 
 /* --------------------------------------------------------------------- */
 static struct attribute *fan_attributes[] = {
-- 
2.13.1
