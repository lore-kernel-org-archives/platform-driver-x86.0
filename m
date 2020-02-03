From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 2/2] platform/x86: thinkpad_acpi: use standard charge control attribute names
Date: Mon,  3 Feb 2020 13:01:32 +0100
Message-ID: <20200203120132.102576-3-linux@weissschuh.net>
References: <20200131143650.4149-1-linux@weissschuh.net>
 <20200203120132.102576-1-linux@weissschuh.net>
 <20200203120132.102576-2-linux@weissschuh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200203120132.102576-2-linux@weissschuh.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
List-Id: platform-driver-x86.vger.kernel.org

The standard attributes were only introduced after the ones from
thinkpad_acpi in commit 813cab8f3994 ("power: supply: core:
Add CHARGE_CONTROL_{START_THRESHOLD,END_THRESHOLD} properties").

The new standard attributes are aliased to their previous names,
preserving backwards compatibility.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/thinkpad_acpi.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2d3a99e3efb7..2cbcd2e3092f 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9608,38 +9608,52 @@ static ssize_t tpacpi_battery_show(int what,
 	return sprintf(buf, "%d\n", ret);
 }
 
-static ssize_t charge_start_threshold_show(struct device *device,
+static ssize_t charge_control_start_threshold_show(struct device *device,
 				struct device_attribute *attr,
 				char *buf)
 {
 	return tpacpi_battery_show(THRESHOLD_START, device, buf);
 }
 
-static ssize_t charge_stop_threshold_show(struct device *device,
+static ssize_t charge_control_end_threshold_show(struct device *device,
 				struct device_attribute *attr,
 				char *buf)
 {
 	return tpacpi_battery_show(THRESHOLD_STOP, device, buf);
 }
 
-static ssize_t charge_start_threshold_store(struct device *dev,
+static ssize_t charge_control_start_threshold_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
 {
 	return tpacpi_battery_store(THRESHOLD_START, dev, buf, count);
 }
 
-static ssize_t charge_stop_threshold_store(struct device *dev,
+static ssize_t charge_control_end_threshold_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
 {
 	return tpacpi_battery_store(THRESHOLD_STOP, dev, buf, count);
 }
 
-static DEVICE_ATTR_RW(charge_start_threshold);
-static DEVICE_ATTR_RW(charge_stop_threshold);
+static DEVICE_ATTR_RW(charge_control_start_threshold);
+static DEVICE_ATTR_RW(charge_control_end_threshold);
+struct device_attribute dev_attr_charge_start_threshold = __ATTR(
+	charge_start_threshold,
+	0644,
+	charge_control_start_threshold_show,
+	charge_control_start_threshold_store
+);
+struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
+	charge_stop_threshold,
+	0644,
+	charge_control_end_threshold_show,
+	charge_control_end_threshold_store
+);
 
 static struct attribute *tpacpi_battery_attrs[] = {
+	&dev_attr_charge_control_start_threshold.attr,
+	&dev_attr_charge_control_end_threshold.attr,
 	&dev_attr_charge_start_threshold.attr,
 	&dev_attr_charge_stop_threshold.attr,
 	NULL,
-- 
2.25.0
