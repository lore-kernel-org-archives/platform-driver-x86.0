From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH 2/3] ideapad: let camera_power node invisiable if no camera
Date: Thu, 30 Jun 2011 19:50:47 +0800
Message-ID: <1309434647-4701-1-git-send-email-ike.pan@canonical.com>
References: <1309434584-4636-1-git-send-email-ike.pan@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1309434584-4636-1-git-send-email-ike.pan@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentin.chary@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 42b9ba7..1612abd 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -38,6 +38,7 @@
 #define CFG_BT_BIT	(16)
 #define CFG_3G_BIT	(17)
 #define CFG_WIFI_BIT	(18)
+#define CFG_CAMERA_BIT	(19)
 
 struct ideapad_private {
 	struct rfkill *rfk[IDEAPAD_RFKILL_DEV_NUM];
@@ -208,7 +209,24 @@ static struct attribute *ideapad_attributes[] = {
 	NULL
 };
 
+static mode_t ideapad_is_visible(struct kobject *kobj,
+				 struct attribute *attr,
+				 int idx)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct ideapad_private *priv = dev_get_drvdata(dev);
+	bool supported;
+
+	if (attr == &dev_attr_camera_power.attr)
+		supported = test_bit(CFG_CAMERA_BIT, &(priv->cfg));
+	else
+		supported = true;
+
+	return supported ? attr->mode : 0;
+}
+
 static struct attribute_group ideapad_attribute_group = {
+	.is_visible = ideapad_is_visible,
 	.attrs = ideapad_attributes
 };
 
-- 
1.7.4.1
