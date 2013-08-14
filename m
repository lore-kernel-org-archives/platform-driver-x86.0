From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH 2/2] thinkpad-acpi: add sysfs for enabling and disabling hardware mute
Date: Wed, 14 Aug 2013 13:40:02 +0800
Message-ID: <1376458802-11923-3-git-send-email-alex.hung@canonical.com>
References: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:33038 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751839Ab3HNFkU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Aug 2013 01:40:20 -0400
In-Reply-To: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Thinkpad BIOS provides an ACPI interface to disable hardware mute.
When enabled (as default), Thinkpad issues a scancode and toggles
hardware mute + led. Once disabled, Thinkpad will only issues the
scancode.

When hardware mute is enabled, hardware mute can be out-of-sync
with user-space if a user changes mute state by user application.
This patch gives a chance to disable hardware mute.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 3b648c0..a901fac 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2978,6 +2978,32 @@ static struct device_attribute dev_attr_hotkey_mute_state =
 	__ATTR(hotkey_mute_state, S_IWUSR | S_IRUGO,
 	hotkey_mute_state_show, hotkey_mute_state_store);
 
+/* sysfs hotkey_mute_enable -------------------------------------------- */
+static ssize_t hotkey_mute_enable_store(struct device *dev,
+			    struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	unsigned long state;
+	int output;
+
+	if (parse_strtoul(buf, 25, &state))
+		return -EINVAL;
+
+	if (state != 1 && state != 0)
+		return -EINVAL;
+
+	if (!acpi_evalf(hkey_handle, &output, "SHDA", "dd", state))
+		return -EIO;
+
+	if (output & TPACPI_AML_MUTE_ERROR_STATE_MASK)
+		return -EIO;
+
+	return count;
+}
+
+static struct device_attribute dev_attr_hotkey_mute_enable =
+	__ATTR(hotkey_mute_enable, S_IWUSR, NULL, hotkey_mute_enable_store);
+
 /* --------------------------------------------------------------------- */
 
 static struct attribute *hotkey_attributes[] __initdata = {
@@ -2995,6 +3021,7 @@ static struct attribute *hotkey_attributes[] __initdata = {
 	&dev_attr_hotkey_poll_freq.attr,
 #endif
 	&dev_attr_hotkey_mute_state.attr,
+	&dev_attr_hotkey_mute_enable.attr,
 };
 
 /*
-- 
1.8.1.2
