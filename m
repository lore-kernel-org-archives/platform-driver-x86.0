From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: [PATCH v3] Add sysfs interface for touchpad state
Date: Fri, 17 Feb 2017 20:18:15 +0530
Message-ID: <20170217144815.11791-1-rrs@debian.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35595 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933963AbdBQOsZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2017 09:48:25 -0500
Received: by mail-pf0-f196.google.com with SMTP id 68so4253949pfx.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2017 06:48:24 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org, Ritesh Raj Sarraf <rrs@debian.org>

Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
14 etc) has multiple modles that are a hybrid laptop, working in laptop
mode as well as tablet mode.

Currently, there is no easy interface to determine the touchpad status,
which in case of the Yoga family of machines, can also be useful to
assume tablet mode status.
Note: The ideapad-laptop driver does not provide a SW_TABLET_MODE either

For a detailed discussion  on why we want either of the interfaces,
please see:
https://bugs.launchpad.net/onboard/+bug/1366421/comments/43

This patch adds a sysfs interface for read/write access under:
/sys/bus/platform/devices/VPC2004\:00/touchpad_mode

v3:
Include Darren Hart's comments
Changed sysfs inteface from "touchpad_mode" to "touchpad"

v2:
Include Andy Shevchenko's comments

Signed-off-by: Ritesh Raj Sarraf <rrs@debian.org>
---
 .../ABI/testing/sysfs-platform-ideapad-laptop      |  8 +++++
 drivers/platform/x86/ideapad-laptop.c              | 36 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
index b31e782bd985..5d24f1e8e6ef 100644
--- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -17,3 +17,11 @@ Description:
 			* 2 -> Dust Cleaning
 			* 4 -> Efficient Thermal Dissipation Mode
 
+What:		/sys/devices/platform/ideapad/touchpad
+Date:		Feb 2017
+KernelVersion:	4.11
+Contact:	"Ritesh Raj Sarraf <rrs@debian.org>"
+Description:
+		Control touchpad mode.
+			* 1 -> Switched On
+			* 0 -> Switched Off
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index f46ece2ce3c4..aff1a561c9ec 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -423,9 +423,45 @@ static ssize_t store_ideapad_fan(struct device *dev,
 
 static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
 
+
+static ssize_t touchpad_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct ideapad_private *priv = dev_get_drvdata(dev);
+	unsigned long result;
+
+	if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
+		return sprintf(buf, "-1\n");
+	return sprintf(buf, "%lu\n", result);
+}
+
+static ssize_t touchpad_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct ideapad_private *priv = dev_get_drvdata(dev);
+	int ret, state;
+
+	ret = kstrtoint(buf, 0, &state);
+	if (ret)
+		return ret;
+
+	if (state != 0 && state != 1)
+		return -EINVAL;
+
+	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
+	if (ret < 0)
+		return -EIO;
+	return count;
+}
+
+static DEVICE_ATTR_RW(touchpad);
+
 static struct attribute *ideapad_attributes[] = {
 	&dev_attr_camera_power.attr,
 	&dev_attr_fan_mode.attr,
+	&dev_attr_touchpad.attr,
 	NULL
 };
 
-- 
2.11.0
