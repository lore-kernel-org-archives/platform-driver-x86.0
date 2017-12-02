From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/4] platform/x86: ideapad-laptop: use kstrto instead of sscanf and do clean up
Date: Sat,  2 Dec 2017 21:45:33 +0800
Message-ID: <20171202134534.3252-3-jiaxun.yang@flygoat.com>
References: <20171202134534.3252-1-jiaxun.yang@flygoat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171202134534.3252-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Jargoyhen <rjargoyhen@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: platform-driver-x86.vger.kernel.org

To deal with checkpatch warnings:
WARNING: Prefer kstrto<type> to single variable sscanf

WARNING: Missing a blank line after declarations

WARNING: Block comments use a trailing */ on a separate line

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 1072b24370ac..924b07f7db06 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -406,12 +406,14 @@ static ssize_t store_ideapad_cam(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
-	int ret, state;
+	int ret, state, rc;
 	struct ideapad_private *priv = dev_get_drvdata(dev);
 
+	rc = kstrtoint(buf, 0, &state);
+
 	if (!count)
 		return 0;
-	if (sscanf(buf, "%i", &state) != 1)
+	if (rc != 0)
 		return -EINVAL;
 	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
 	if (ret < 0)
@@ -437,12 +439,14 @@ static ssize_t store_ideapad_fan(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
-	int ret, state;
+	int ret, state, rc;
 	struct ideapad_private *priv = dev_get_drvdata(dev);
 
+	rc = kstrtoint(buf, 0, &state);
+
 	if (!count)
 		return 0;
-	if (sscanf(buf, "%i", &state) != 1)
+	if (rc != 0)
 		return -EINVAL;
 	if (state < 0 || state > 4 || state == 3)
 		return -EINVAL;
@@ -541,6 +545,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 		supported = test_bit(CFG_CAMERA_BIT, &(priv->cfg));
 	else if (attr == &dev_attr_fan_mode.attr) {
 		unsigned long value;
+
 		supported = !read_ec_data(priv->adev->handle, VPCCMD_R_FAN,
 					  &value);
 	} else if (attr == &dev_attr_conservation_mode.attr) {
@@ -880,11 +885,14 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
 
 	/* Without reading from EC touchpad LED doesn't switch state */
 	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value)) {
-		/* Some IdeaPads don't really turn off touchpad - they only
+		/*
+		 * Some IdeaPads don't really turn off touchpad - they only
 		 * switch the LED state. We (de)activate KBC AUX port to turn
 		 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
-		 * KEY_TOUCHPAD_ON to not to get out of sync with LED */
+		 * KEY_TOUCHPAD_ON to not to get out of sync with LED
+		 */
 		unsigned char param;
+
 		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE :
 			      I8042_CMD_AUX_DISABLE);
 		ideapad_input_report(priv, value ? 67 : 66);
-- 
2.14.1
