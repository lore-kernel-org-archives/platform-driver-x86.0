From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH 1/2] thinkpad-acpi: add sysfs for getting and setting hardware mute
Date: Wed, 14 Aug 2013 13:40:01 +0800
Message-ID: <1376458802-11923-2-git-send-email-alex.hung@canonical.com>
References: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:33032 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751468Ab3HNFkP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Aug 2013 01:40:15 -0400
In-Reply-To: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Newer thinkpad models have a mute hotkey with a led to indicate
current mute states. Thinkpad BIOS provides ACPI interfaces for
getting and changing the hardware mute along with the led.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 54d31c0..3b648c0 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2929,6 +2929,55 @@ static void hotkey_wakeup_hotunplug_complete_notify_change(void)
 		     "wakeup_hotunplug_complete");
 }
 
+/* sysfs hotkey_mute_state --------------------------------------------- */
+enum {
+	TPACPI_AML_MUTE_READ_MASK = 0x01,
+	TPACPI_AML_MUTE_ERROR_STATE_MASK = 0x80000000,
+};
+
+static ssize_t hotkey_mute_state_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buf)
+{
+	int state;
+
+	if (!acpi_evalf(hkey_handle, &state, "GSMS", "dd"))
+		return -EIO;
+
+	if (state & TPACPI_AML_MUTE_ERROR_STATE_MASK)
+		pr_warn("getting mute state failed.\n");
+
+	state &= TPACPI_AML_MUTE_READ_MASK;
+
+	return snprintf(buf, PAGE_SIZE, "%x\n", state);
+}
+
+static ssize_t hotkey_mute_state_store(struct device *dev,
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
+	if (!acpi_evalf(hkey_handle, &output, "SSMS", "dd", state))
+		return -EIO;
+
+	if (output & TPACPI_AML_MUTE_ERROR_STATE_MASK)
+		return -EIO;
+
+	return count;
+}
+
+static struct device_attribute dev_attr_hotkey_mute_state =
+	__ATTR(hotkey_mute_state, S_IWUSR | S_IRUGO,
+	hotkey_mute_state_show, hotkey_mute_state_store);
+
 /* --------------------------------------------------------------------- */
 
 static struct attribute *hotkey_attributes[] __initdata = {
@@ -2945,6 +2994,7 @@ static struct attribute *hotkey_attributes[] __initdata = {
 	&dev_attr_hotkey_source_mask.attr,
 	&dev_attr_hotkey_poll_freq.attr,
 #endif
+	&dev_attr_hotkey_mute_state.attr,
 };
 
 /*
-- 
1.8.1.2
