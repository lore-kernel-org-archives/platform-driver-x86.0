From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: [PATCH] Add sysfs interface for touchpad state
Date: Mon, 30 Jan 2017 16:27:49 +0530
Message-ID: <20170130105749.17338-1-rrs@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35179 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751141AbdA3LEE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2017 06:04:04 -0500
Received: by mail-pg0-f65.google.com with SMTP id 204so31265209pge.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2017 03:04:04 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Ritesh Raj Sarraf <rrs@debian.org>

Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
14 etc) has multiple modles that are a hybrid laptop, working in laptop
mode as well as tablet mode.

There is no interface available to query the physical state of these
devices. Also, from the driver, it doesn't look to be having an EC
command to get that information from the acpi driver.

When in tablet mode, the hardware keyboard and touchpad get disabled.
This could be one sub-optimal way to assume that under such condition
(touchpad disabled) the machine is in Tablet-Mode. Other than this, I've
not come across another way to determine the physical state of the
hardware.

Currently, some of the hardware status is provided through debugfs,
which is useless for unprivileged processes. (This already has many
broken reports: radio and wifi, which are active/on as I write this)

root@learner:/sys/kernel/debug# cat ideapad/status
Backlight max:	16
Backlight now:	3
BL power value:	On
=====================
Radio status:	Off(0)
Wifi status:	Off(0)
BT status:	Off(0)
3G status:	Off(0)
=====================
Touchpad status:On(1)
SW_TABLET_MODE:	Off(0)
Camera status:	On(1)

This patch adds a sysfs interface for unprivileged process access under:
/sys/bus/platform/devices/VPC2004\:00/touchpad_state

rrs@learner:/sys/bus/platform/devices/VPC2004:00$ cat touchpad_state
1
2017-01-30 / 16:12:00 ♒♒♒  ☺
rrs@learner:/sys/bus/platform/devices/VPC2004:00$ cat touchpad_state
0
2017-01-30 / 16:12:06 ♒♒♒  ☺

Signed-off-by: Ritesh Raj Sarraf <rrs@debian.org>
---
 drivers/platform/x86/ideapad-laptop.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index a7614fc542b5..3a1622ef2f45 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -423,9 +423,33 @@ static ssize_t store_ideapad_fan(struct device *dev,
 
 static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
 
+
+static ssize_t show_touchpad_state(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	unsigned long result;
+	struct ideapad_private *priv = dev_get_drvdata(dev);
+
+	if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
+		return sprintf(buf, "-1\n");
+	return sprintf(buf, "%lu\n", result);
+}
+
+static ssize_t store_touchpad_state(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+        /* Don't enable writing here */
+        return -1;
+}
+
+static DEVICE_ATTR(touchpad_state, 0644, show_touchpad_state, store_touchpad_state);
+
 static struct attribute *ideapad_attributes[] = {
 	&dev_attr_camera_power.attr,
 	&dev_attr_fan_mode.attr,
+	&dev_attr_touchpad_state.attr,
 	NULL
 };
 
-- 
2.11.0
