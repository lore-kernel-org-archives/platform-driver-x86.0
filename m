From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 3/3] platform/x86: thinkpad_acpi: restore old battery charge attributes
Date: Wed, 29 Jan 2020 21:43:38 +0100
Message-ID: <20200129204338.4055-4-linux@weissschuh.net>
References: <20200129204338.4055-1-linux@weissschuh.net>
 <20200129204338.4055-2-linux@weissschuh.net>
 <20200129204338.4055-3-linux@weissschuh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200129204338.4055-3-linux@weissschuh.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
List-Id: platform-driver-x86.vger.kernel.org

Alias the new standard attributes to their previous names, preserving
backwards compatibility.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/thinkpad_acpi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 25e877789352..443b2b16dc11 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9638,10 +9638,24 @@ static ssize_t charge_control_stop_threshold_store(struct device *dev,
 
 static DEVICE_ATTR_RW(charge_control_start_threshold);
 static DEVICE_ATTR_RW(charge_control_stop_threshold);
+struct device_attribute dev_attr_charge_start_threshold = __ATTR(
+	charge_start_threshold,
+	0644,
+	charge_control_start_threshold_show,
+	charge_control_start_threshold_store
+);
+struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
+	charge_stop_threshold,
+	0644,
+	charge_control_stop_threshold_show,
+	charge_control_stop_threshold_store
+);
 
 static struct attribute *tpacpi_battery_attrs[] = {
 	&dev_attr_charge_control_start_threshold.attr,
 	&dev_attr_charge_control_stop_threshold.attr,
+	&dev_attr_charge_start_threshold.attr,
+	&dev_attr_charge_stop_threshold.attr,
 	NULL,
 };
 
-- 
2.25.0
