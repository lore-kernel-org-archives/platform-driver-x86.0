From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] platform/x86: hdaps: switch to using polled mode of input
 devices
Date: Tue, 1 Oct 2019 11:32:53 -0700
Message-ID: <20191001183253.GA2344@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Frank Seidel <frank@f-seidel.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We have added polled mode to the normal input devices with the intent of
retiring input_polled_dev. This converts hdaps driver to use the
polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/Kconfig |  1 -
 drivers/platform/x86/hdaps.c | 38 +++++++++++++++++-------------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index c703c78c59f3..8690e311f407 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -622,7 +622,6 @@ config THINKPAD_ACPI_HOTKEY_POLL
 config SENSORS_HDAPS
 	tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
 	depends on INPUT
-	select INPUT_POLLDEV
 	help
 	  This driver provides support for the IBM Hard Drive Active Protection
 	  System (hdaps), which provides an accelerometer and other misc. data.
diff --git a/drivers/platform/x86/hdaps.c b/drivers/platform/x86/hdaps.c
index 3adcb0de0193..84d3d0af4e40 100644
--- a/drivers/platform/x86/hdaps.c
+++ b/drivers/platform/x86/hdaps.c
@@ -59,7 +59,7 @@
 #define HDAPS_BOTH_AXES		(HDAPS_X_AXIS | HDAPS_Y_AXIS)
 
 static struct platform_device *pdev;
-static struct input_polled_dev *hdaps_idev;
+static struct input_dev *hdaps_idev;
 static unsigned int hdaps_invert;
 static u8 km_activity;
 static int rest_x;
@@ -318,9 +318,8 @@ static void hdaps_calibrate(void)
 	__hdaps_read_pair(HDAPS_PORT_XPOS, HDAPS_PORT_YPOS, &rest_x, &rest_y);
 }
 
-static void hdaps_mousedev_poll(struct input_polled_dev *dev)
+static void hdaps_mousedev_poll(struct input_dev *input_dev)
 {
-	struct input_dev *input_dev = dev->input;
 	int x, y;
 
 	mutex_lock(&hdaps_mtx);
@@ -531,7 +530,6 @@ static const struct dmi_system_id hdaps_whitelist[] __initconst = {
 
 static int __init hdaps_init(void)
 {
-	struct input_dev *idev;
 	int ret;
 
 	if (!dmi_check_system(hdaps_whitelist)) {
@@ -559,31 +557,32 @@ static int __init hdaps_init(void)
 	if (ret)
 		goto out_device;
 
-	hdaps_idev = input_allocate_polled_device();
+	hdaps_idev = input_allocate_device();
 	if (!hdaps_idev) {
 		ret = -ENOMEM;
 		goto out_group;
 	}
 
-	hdaps_idev->poll = hdaps_mousedev_poll;
-	hdaps_idev->poll_interval = HDAPS_POLL_INTERVAL;
-
 	/* initial calibrate for the input device */
 	hdaps_calibrate();
 
 	/* initialize the input class */
-	idev = hdaps_idev->input;
-	idev->name = "hdaps";
-	idev->phys = "isa1600/input0";
-	idev->id.bustype = BUS_ISA;
-	idev->dev.parent = &pdev->dev;
-	idev->evbit[0] = BIT_MASK(EV_ABS);
-	input_set_abs_params(idev, ABS_X,
+	hdaps_idev->name = "hdaps";
+	hdaps_idev->phys = "isa1600/input0";
+	hdaps_idev->id.bustype = BUS_ISA;
+	hdaps_idev->dev.parent = &pdev->dev;
+	input_set_abs_params(hdaps_idev, ABS_X,
 			-256, 256, HDAPS_INPUT_FUZZ, HDAPS_INPUT_FLAT);
-	input_set_abs_params(idev, ABS_Y,
+	input_set_abs_params(hdaps_idev, ABS_Y,
 			-256, 256, HDAPS_INPUT_FUZZ, HDAPS_INPUT_FLAT);
 
-	ret = input_register_polled_device(hdaps_idev);
+	ret = input_setup_polling(hdaps_idev, hdaps_mousedev_poll);
+	if (ret)
+		goto out_idev;
+
+	input_set_poll_interval(hdaps_idev, HDAPS_POLL_INTERVAL);
+
+	ret = input_register_device(hdaps_idev);
 	if (ret)
 		goto out_idev;
 
@@ -591,7 +590,7 @@ static int __init hdaps_init(void)
 	return 0;
 
 out_idev:
-	input_free_polled_device(hdaps_idev);
+	input_free_device(hdaps_idev);
 out_group:
 	sysfs_remove_group(&pdev->dev.kobj, &hdaps_attribute_group);
 out_device:
@@ -607,8 +606,7 @@ static int __init hdaps_init(void)
 
 static void __exit hdaps_exit(void)
 {
-	input_unregister_polled_device(hdaps_idev);
-	input_free_polled_device(hdaps_idev);
+	input_unregister_device(hdaps_idev);
 	sysfs_remove_group(&pdev->dev.kobj, &hdaps_attribute_group);
 	platform_device_unregister(pdev);
 	platform_driver_unregister(&hdaps_driver);
-- 
2.23.0.444.g18eeb5a265-goog


-- 
Dmitry
