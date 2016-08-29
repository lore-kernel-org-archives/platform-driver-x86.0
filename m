From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 1/3] toshiba_acpi: Clean up variable declaration
Date: Mon, 29 Aug 2016 09:37:34 -0600
Message-ID: <20160829153736.18273-2-coproscefalo@gmail.com>
References: <20160829153736.18273-1-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160829153736.18273-1-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch moves all the multiple line variable declaration to a
single line declaration (except variables being initialized)
following the reverse tree order, to conform to the practices
of the kernel.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 9d60a40..54dea64 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -321,10 +321,9 @@ static int write_acpi_int(const char *methodName, int val)
 static acpi_status tci_raw(struct toshiba_acpi_dev *dev,
 			   const u32 in[TCI_WORDS], u32 out[TCI_WORDS])
 {
+	union acpi_object in_objs[TCI_WORDS], out_objs[TCI_WORDS + 1];
 	struct acpi_object_list params;
-	union acpi_object in_objs[TCI_WORDS];
 	struct acpi_buffer results;
-	union acpi_object out_objs[TCI_WORDS + 1];
 	acpi_status status;
 	int i;
 
@@ -387,9 +386,8 @@ static int sci_open(struct toshiba_acpi_dev *dev)
 {
 	u32 in[TCI_WORDS] = { SCI_OPEN, 0, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
-	acpi_status status;
+	acpi_status status = tci_raw(dev, in, out);
 
-	status = tci_raw(dev, in, out);
 	if  (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to open SCI failed\n");
 		return 0;
@@ -425,9 +423,8 @@ static void sci_close(struct toshiba_acpi_dev *dev)
 {
 	u32 in[TCI_WORDS] = { SCI_CLOSE, 0, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
-	acpi_status status;
+	acpi_status status = tci_raw(dev, in, out);
 
-	status = tci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to close SCI failed\n");
 		return;
@@ -509,7 +506,8 @@ static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
 {
 	struct toshiba_acpi_dev *dev = container_of(cdev,
 			struct toshiba_acpi_dev, led_dev);
-	u32 state, result;
+	u32 result;
+	u32 state;
 
 	/* First request : initialize communication. */
 	if (!sci_open(dev))
@@ -672,9 +670,9 @@ static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
 /* Eco Mode support */
 static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 {
-	acpi_status status;
 	u32 in[TCI_WORDS] = { HCI_GET, HCI_ECO_MODE, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
+	acpi_status status;
 
 	dev->eco_supported = 0;
 	dev->eco_led_registered = false;
@@ -1282,9 +1280,9 @@ static struct proc_dir_entry *toshiba_proc_dir;
 /* LCD Brightness */
 static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 {
+	int brightness = 0;
 	u32 result;
 	u32 value;
-	int brightness = 0;
 
 	if (dev->tr_backlight_supported) {
 		int ret = get_tr_backlight_status(dev, &value);
@@ -1377,7 +1375,7 @@ static ssize_t lcd_proc_write(struct file *file, const char __user *buf,
 	struct toshiba_acpi_dev *dev = PDE_DATA(file_inode(file));
 	char cmd[42];
 	size_t len;
-	int levels = dev->backlight_dev->props.max_brightness + 1;
+	int levels;
 	int value;
 
 	len = min(count, sizeof(cmd) - 1);
@@ -1385,6 +1383,7 @@ static ssize_t lcd_proc_write(struct file *file, const char __user *buf,
 		return -EFAULT;
 	cmd[len] = '\0';
 
+	levels = dev->backlight_dev->props.max_brightness + 1;
 	if (sscanf(cmd, " brightness : %i", &value) != 1 &&
 	    value < 0 && value > levels)
 		return -EINVAL;
@@ -1447,10 +1446,8 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 	struct toshiba_acpi_dev *dev = PDE_DATA(file_inode(file));
 	char *buffer;
 	char *cmd;
+	int lcd_out, crt_out, tv_out;
 	int remain = count;
-	int lcd_out = -1;
-	int crt_out = -1;
-	int tv_out = -1;
 	int value;
 	int ret;
 	u32 video_out;
@@ -1486,6 +1483,7 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 
 	kfree(cmd);
 
+	lcd_out = crt_out = tv_out = -1;
 	ret = get_video_status(dev, &video_out);
 	if (!ret) {
 		unsigned int new_video_out = video_out;
@@ -1980,9 +1978,9 @@ static ssize_t usb_sleep_charge_store(struct device *dev,
 				      const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
-	u32 mode;
 	int state;
 	int ret;
+	u32 mode;
 
 	ret = kstrtoint(buf, 0, &state);
 	if (ret)
@@ -2021,11 +2019,10 @@ static ssize_t sleep_functions_on_battery_show(struct device *dev,
 					       char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
-	u32 state;
-	int bat_lvl;
-	int status;
+	int bat_lvl, status;
 	int ret;
 	int tmp;
+	u32 state;
 
 	ret = toshiba_sleep_functions_status_get(toshiba, &state);
 	if (ret < 0)
@@ -3015,8 +3012,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 {
 	struct toshiba_acpi_dev *dev;
 	const char *hci_method;
-	u32 dummy;
 	int ret = 0;
+	u32 dummy;
 
 	if (toshiba_acpi)
 		return -EBUSY;
-- 
2.9.3
