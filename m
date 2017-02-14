From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: [PATCH] platform/x86: ideapad-laptop: Add sysfs interface for touchpad state
Date: Tue, 14 Feb 2017 19:46:12 +0530
Message-ID: <20170214141612.16913-1-rrs@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org, Ritesh Raj Sarraf <rrs@debian.org>
List-Id: platform-driver-x86.vger.kernel.org

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

Signed-off-by: Ritesh Raj Sarraf <rrs@debian.org>
---
 .../ABI/testing/sysfs-platform-ideapad-laptop      |  9 ++++++
 drivers/platform/x86/ideapad-laptop.c              | 33 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
index b31e782bd985..401e37e5acbd 100644
--- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -17,3 +17,12 @@ Description:
 			* 2 -> Dust Cleaning
 			* 4 -> Efficient Thermal Dissipation Mode
 
+What:		/sys/devices/platform/ideapad/touchpad_mode
+Date:		Jan 2017
+KernelVersion:	4.11
+Contact:	"Ritesh Raj Sarraf <rrs@debian.org>"
+Description:
+		Control touchpad mode.
+                        * 1 -> Switched On
+                        * 0 -> Switched Off
+
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index f46ece2ce3c4..639af45b45b6 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -423,9 +423,42 @@ static ssize_t store_ideapad_fan(struct device *dev,
 
 static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
 
+
+static ssize_t show_touchpad_mode(struct device *dev,
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
+static ssize_t store_touchpad_mode(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	int ret, state;
+	struct ideapad_private *priv = dev_get_drvdata(dev);
+
+	if (!count)
+		return 0;
+	if (sscanf(buf, "%i", &state) != 1)
+		return -EINVAL;
+	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
+	if (ret < 0)
+		return -EIO;
+	return count;
+}
+
+static DEVICE_ATTR(touchpad_mode, 0644, show_touchpad_mode, store_touchpad_mode);
+
 static struct attribute *ideapad_attributes[] = {
 	&dev_attr_camera_power.attr,
 	&dev_attr_fan_mode.attr,
+	&dev_attr_touchpad_mode.attr,
 	NULL
 };
 
-- 
2.11.0
