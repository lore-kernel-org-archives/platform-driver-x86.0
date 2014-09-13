From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 3/5] toshiba_acpi: Fix accelerometer direction reporting
Date: Fri, 12 Sep 2014 18:50:37 -0600
Message-ID: <1410569437-3066-2-git-send-email-coproscefalo@gmail.com>
References: <1410569437-3066-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410569437-3066-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The position file on sysfs was reporting absolute values
for its axes.

This patch fixes the direction reporting (either negative
or positive), as well as added a mutex lock to it.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
This was: Add accelerometer input polled device

Changes since v1:
Dropped polldev and kept the position entry, and simply
fix the axes direction reporting, the IIO device will
be added in a future patch instead of the polled device.

 drivers/platform/x86/toshiba_acpi.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index edd8f3d..a94e5ed 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -124,6 +124,7 @@ MODULE_LICENSE("GPL");
 #define SCI_TOUCHPAD			0x050e
 
 /* field definitions */
+#define HCI_ACCEL_DIRECTION_MASK	0x8000
 #define HCI_ACCEL_MASK			0x7fff
 #define HCI_HOTKEY_DISABLE		0x0b
 #define HCI_HOTKEY_ENABLE		0x09
@@ -1527,19 +1528,29 @@ static ssize_t toshiba_position_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
-	u32 xyval, zval, tmp;
-	u16 x, y, z;
+	u32 xyval, zval;
+	int x, y, z;
 	int ret;
 
+	mutex_lock(&dev->mutex);
+
 	xyval = zval = 0;
 	ret = toshiba_accelerometer_get(toshiba, &xyval, &zval);
-	if (ret < 0)
+	if (ret) {
+		mutex_unlock(&dev->mutex);
 		return ret;
+	}
 
+	/* Accelerometer values */
 	x = xyval & HCI_ACCEL_MASK;
-	tmp = xyval >> HCI_MISC_SHIFT;
-	y = tmp & HCI_ACCEL_MASK;
+	y = (xyval >> HCI_MISC_SHIFT) & HCI_ACCEL_MASK;
 	z = zval & HCI_ACCEL_MASK;
+	/* Movement direction */
+	x *= xyval & HCI_ACCEL_DIRECTION_MASK ? -1 : 1;
+	y *= (xyval >> HCI_MISC_SHIFT) & HCI_ACCEL_DIRECTION_MASK ? -1 : 1;
+	z *= zval & HCI_ACCEL_DIRECTION_MASK ? -1 : 1;
+
+	mutex_unlock(&dev->mutex);
 
 	return sprintf(buf, "%d %d %d\n", x, y, z);
 }
-- 
2.0.0
