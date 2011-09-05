From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH 5/5] ideapad: remove sysfs node for cfg
Date: Tue,  6 Sep 2011 02:33:00 +0800
Message-ID: <1315247580-9182-1-git-send-email-ike.pan@canonical.com>
References: <1315247467-8812-1-git-send-email-ike.pan@canonical.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1315247467-8812-1-git-send-email-ike.pan@canonical.com>
Sender: linux-doc-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>
List-Id: platform-driver-x86.vger.kernel.org

Replaced by the one in debugfs.

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 .../ABI/testing/sysfs-platform-ideapad-laptop      |   15 ---------------
 drivers/platform/x86/ideapad-laptop.c              |   12 ------------
 2 files changed, 0 insertions(+), 27 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
index ff53183..814b013 100644
--- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -5,19 +5,4 @@ Contact:	"Ike Panhc <ike.pan@canonical.com>"
 Description:
 		Control the power of camera module. 1 means on, 0 means off.
 
-What:		/sys/devices/platform/ideapad/cfg
-Date:		Jun 2011
-KernelVersion:	3.1
-Contact:	"Ike Panhc <ike.pan@canonical.com>"
-Description:
-		Ideapad capability bits.
-		Bit 8-10: 1 - Intel graphic only
-		          2 - ATI graphic only
-		          3 - Nvidia graphic only
-		          4 - Intel and ATI graphic
-		          5 - Intel and Nvidia graphic
-		Bit 16: Bluetooth exist (1 for exist)
-		Bit 17: 3G exist (1 for exist)
-		Bit 18: Wifi exist (1 for exist)
-		Bit 19: Camera exist (1 for exist)
 
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 1c8b506..a36addf 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -363,20 +363,8 @@ static ssize_t store_ideapad_cam(struct device *dev,
 
 static DEVICE_ATTR(camera_power, 0644, show_ideapad_cam, store_ideapad_cam);
 
-static ssize_t show_ideapad_cfg(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
-{
-	struct ideapad_private *priv = dev_get_drvdata(dev);
-
-	return sprintf(buf, "0x%.8lX\n", priv->cfg);
-}
-
-static DEVICE_ATTR(cfg, 0444, show_ideapad_cfg, NULL);
-
 static struct attribute *ideapad_attributes[] = {
 	&dev_attr_camera_power.attr,
-	&dev_attr_cfg.attr,
 	NULL
 };
 
-- 
1.7.5.4

