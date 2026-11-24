Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541283;
	b=Zlk/Uj3qqTeO1yZnaK6wEjreBRJ2CdvFL0++PzDoCWC3abqPzDH6qVhpFea7pl6MnOSe
	 ZBHrJtogN6rF1wVScDdz9WVzYxBMXQT3rnFGvtTZYkcVbx25cZ8LOZmsGtP1y6Ev2DuUQ
	 ULUec2NGoXhBXBtt1Huphe+KDeS17XWJ7AmJcp8TMeUfFZ3gAX+5c6KebyG4B2AntmtK+
	 gFr6D5adknSIwFpUmF0Lne3IUQfDvQM2vW54B0UtuvNi9yUCR3FaokZGcfm5QkNFWnqgQ
	 +4lCXwPeImHV1/kmNY33tBBq2wnY18jYCaq9CCBOFTQzz8gcjDmEXhP978h14/wfU3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541283;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=86t4/gWNfXY7j8+kjunQukf46GjomsZrsHHL4uTAwRE=;
	b=OUop0xXQT01LFpVL6wCNTJurXI913lwNUJ+9FYkIkqlHaLvPz2J2c0Tkc62kXWgRikEd
	 bJ6lI89di3zxmBdviLEq/k6ikR9FJSZe1iG6F1rpCLbRwFmA6Tu09AR/rdpWJmOcB7Shf
	 5AV9GlvvzauCp/5rLkWe9ktera+ShMJrGa8by0jr9VnKBcFI9GI8ET/6x1+NM11pM/IHZ
	 Y6kx7zBqPuphKxB08bTJvwUfGXwr4ZOOvb1F5zpAEPsBnc5oM+xMA6na4abXKOBwsDjpJ
	 DG87rh/JSRl9uM4EhwzS4v8zJKgKbZUvPWAy4oO0IvzZDnO6dPIo+h6cpgSh5SIdQIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b="zMIW/+v4";
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B5D606A31E;
	Tue, 24 Nov 2026 17:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B5D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=zMIW/+v4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795541229;
	bh=86t4/gWNfXY7j8+kjunQukf46GjomsZrsHHL4uTAwRE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=zMIW/+v4TLanOASkGAjOQlV2G6y5fQEF7eahd/db/+ITL+hW3zY9LWwcV5LErfol3
	 5QH+YnGWwIMzZVPA6Gj24DfUyd8qscoByBtXC5WGW7XKUgOQfS28qJUKvhfYfbzek1
	 1hfwp/ma6MQFsGOoh4LM6TsIEMtie9sSBYYOgX8U=
X-QQ-mid: zesmtpgz9t1795541225t9cc6a670
X-QQ-Originating-IP: i4n0QaYJDViEpJA7+JUkKRqdSvPI1H735PXobBNtE8w=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 01:27:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6572006844554376441
EX-QQ-RecipientCnt: 7
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Fuwei Xie <12313607@mail.sustech.edu.cn>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	Zheng Shuyang <yhshzh0@gmail.com>
Subject: [RFC PATCH v3 4/5] platform/x86: huawei-wmi: expose native firmware power profiles
Date: Wed, 25 Nov 2026 01:25:31 +0800
Message-ID: <FDFCDC1BA49249E7+20261124172651.37716-5-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124172651.37716-1-12313607@mail.sustech.edu.cn>
References: <20261124172651.37716-1-12313607@mail.sustech.edu.cn>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:mail.sustech.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ORyVS67xL0uWpXRL69bcqeRLbnAZd7Y3FROVfr9+QFxGTmI9fxI3rT0V
	tnAIdSy4xrVxT4e3yuIusjHdymo8at6ARrrN7MAghZFsXrJ2vFJuN6ppMyF+oZbS6IOHJXP
	lM/trlJarU2BclaQSsVR9tTzHjUQVg27SHjfjHCQXx+yJzvMnVJEx9ssxUzqV71oiSXIY9x
	tW9/BN4EeFAQZbr1FrzpooTbizBetK8oVFhLF/qlUlFWqJOyrPgjHTLiIYeR12DAD0bO7ln
	VJpyOGFwOH+iETHHOD6odxJ39P7kBN02p30+5xV0i3/9lXmQe22f+OMO9R0L9kgOOMDmAUD
	n5/cuxWY3yxCKTZNHKaLjZjNtyR4wkC1hMpk2gOeKbfL9EFE6Rld+MhSJpLTFiIsvjNox89
	i1Wu/BpVb0RE7rnQkJHR4lwWv1QZ/0iiDv0u7zbJxBPXGouZhlk6/g8S+sHIZRkwV6f5kMh
	YabkqG0xUmSEaNNFo9xBsHqynHvEMcCoRDGgsfBUJiPLnw0CQa/wd1sfo7l2sfKMDkJNEjc
	lDbwt9IxqYRqDI5pJAS3uZm4LeBiTgMEExWp6VnsN0HZtXWwEMS5KAl0KB5NR207ILMScMe
	zTirMYhhEGGb0/Nvx7wquJ1wMvQJm6vd2JAZZ0lra+a2l6g/xSgUTtIdcwSuHRHwpyn1/A+
	VODOaH6CgD0kCqQQmkVxaRNczYkAhkzhpUOtwESphQICYV71MkmwpzsNdAPSLnW6FC+0no9
	1to6sOUSVmh1Mc3F/HTf9n2QHyIX1FqMqq5FZJ+KYlblECRsnxRNr1qCM/CQAXgkPG5LsG0
	uTtCMHVpva5B8BMrfud4MGn3ACA/bus09CKCmz/e9nKroiXi3DVU3YNXxShynXx1RToNJh+
	O5owqFp/1fWFl6LJ4bkycJqYusJRTSbx0/6y0acUo8T8+HKxTow34vMBVMfrW9T9gZLCFOY
	56H+RInpspCwk97ChPPIFL9jxd4a7cHk9ZVQOTOvly8hlVIbCyGDGM3Uxr1yCZo3wCz27da
	TK70RE1qGAW8rvFPaKH13KhgZlkk/5r8Gi+g4ISPTSP52i0DpVj3XxntdiWSmbq+e40aV0/
	yFlKhFraWujGCfFQCecbT4=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Expose balanced and performance on systems with GTUB and STUB. Install
the WMI event handlers before sampling the initial mode. Serve profile
reads from the cache and serialize firmware commands and cache updates
with the method lock.

Update the cache after a successful STUB or an explicit WMI mode event.
Read the firmware mode on 0x2a6, observed on a refused request on the
CREM-WXX9. Notify platform_profile outside the lock.

This RFC relies on WMI for unsolicited mode changes. If the EC turns
Turbo off silently on unplug, the cached profile can remain stale.

Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
---
 drivers/platform/x86/Kconfig      |   1 +
 drivers/platform/x86/huawei-wmi.c | 192 ++++++++++++++++++++++++++++--
 2 files changed, 181 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e04..05e65a483 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -22,6 +22,7 @@ config HUAWEI_WMI
 	depends on ACPI_EC
 	depends on ACPI_WMI
 	depends on INPUT
+	select ACPI_PLATFORM_PROFILE
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 209066260..242926d50 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/platform_profile.h>
 #include <linux/power_supply.h>
 #include <linux/sysfs.h>
 #include <linux/wmi.h>
@@ -39,6 +40,8 @@ enum {
 	FN_LOCK_GET			= 0x00000604, /* \GFRS */
 	FN_LOCK_SET			= 0x00000704, /* \SFRS */
 	MICMUTE_LED_SET			= 0x00000b04, /* \SMLS */
+	POWER_MODE_GET			= 0x00000e04, /* \GTUB */
+	POWER_MODE_SET			= 0x00000f04, /* \STUB */
 };
 
 union hwmi_arg {
@@ -69,6 +72,8 @@ struct huawei_wmi {
 	struct device *dev;
 
 	struct mutex wmi_lock;
+	struct device *profile_dev;
+	enum platform_profile_option reported_profile;
 };
 
 static struct huawei_wmi *huawei_wmi;
@@ -159,13 +164,12 @@ struct hwmi_reply {
 };
 
 /* Return the number of command data bytes copied, or a negative errno. */
-static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
+static int huawei_wmi_cmd(struct huawei_wmi *huawei, u64 arg, u8 *buf, size_t buflen)
 {
-	struct huawei_wmi *huawei = huawei_wmi;
 	struct wmi_buffer in = { .length = sizeof(arg), .data = &arg };
 	int i;
 
-	guard(mutex)(&huawei->wmi_lock);
+	lockdep_assert_held(&huawei->wmi_lock);
 	for (i = 0; i < 2; i++) {
 		struct wmi_buffer out;
 		size_t len;
@@ -192,6 +196,143 @@ static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
 	return -ENODEV;
 }
 
+/* Native firmware profiles: no RAPL writes and no periodic enforcement. */
+
+static int huawei_wmi_read_profile(struct huawei_wmi *huawei, enum platform_profile_option *profile)
+{
+	u8 state;
+	int len;
+
+	len = huawei_wmi_cmd(huawei, POWER_MODE_GET, &state, sizeof(state));
+	if (len < 0)
+		return len;
+	if (!len || state > 1)
+		return -ENODATA;
+
+	*profile = state ? PLATFORM_PROFILE_PERFORMANCE : PLATFORM_PROFILE_BALANCED;
+	return 0;
+}
+
+static int huawei_wmi_profile_get(struct device *dev, enum platform_profile_option *profile)
+{
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
+
+	guard(mutex)(&huawei->wmi_lock);
+	*profile = huawei->reported_profile;
+	return 0;
+}
+
+static int huawei_wmi_profile_set(struct device *dev,
+				  enum platform_profile_option profile)
+{
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
+	union hwmi_arg arg = { .cmd = POWER_MODE_SET };
+
+	if (profile != PLATFORM_PROFILE_BALANCED &&
+	    profile != PLATFORM_PROFILE_PERFORMANCE)
+		return -EOPNOTSUPP;
+
+	/*
+	 * On NbF-XX (BIOS 3.07), firmware has a small bug :
+	 * Fn+P enables Turbo at about 20% displayed charge.
+	 * STUB enables Turbo at about 20% / battery health.
+	 */
+	arg.args[2] = (profile == PLATFORM_PROFILE_PERFORMANCE);
+
+	guard(mutex)(&huawei->wmi_lock);
+	int err = huawei_wmi_cmd(huawei, arg.cmd, NULL, 0);
+
+	if (!err)
+		huawei->reported_profile = profile;
+
+	return err;
+}
+
+static bool huawei_wmi_has_profile_method(char *path)
+{
+	acpi_object_type type;
+	acpi_handle handle;
+
+	return ACPI_SUCCESS(acpi_get_handle(NULL, path, &handle)) &&
+	       ACPI_SUCCESS(acpi_get_type(handle, &type)) &&
+	       type == ACPI_TYPE_METHOD;
+}
+
+static int huawei_wmi_profile_probe(void *drvdata, unsigned long *choices)
+{
+	struct huawei_wmi *huawei = drvdata;
+
+	set_bit(PLATFORM_PROFILE_BALANCED, choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+
+	guard(mutex)(&huawei->wmi_lock);
+	return huawei_wmi_read_profile(huawei, &huawei->reported_profile);
+}
+
+static const struct platform_profile_ops huawei_profile_ops = {
+	.probe = huawei_wmi_profile_probe,
+	.profile_get = huawei_wmi_profile_get,
+	.profile_set = huawei_wmi_profile_set,
+};
+
+/* Refresh once when the event does not carry a known mode. */
+static bool huawei_wmi_profile_sync(struct huawei_wmi *huawei)
+{
+	enum platform_profile_option profile;
+	struct device *dev;
+	int err;
+
+	scoped_guard(mutex, &huawei->wmi_lock) {
+		if (huawei->reported_profile == PLATFORM_PROFILE_LAST)
+			return false;
+		err = huawei_wmi_read_profile(huawei, &profile);
+		if (err) {
+			dev_warn_ratelimited(huawei->dev,
+					     "Cannot read firmware profile: %d\n", err);
+			return true;
+		}
+		if (profile == huawei->reported_profile)
+			return true;
+		huawei->reported_profile = profile;
+		dev = huawei->profile_dev;
+	}
+	if (dev)
+		platform_profile_notify(dev);
+	return true;
+}
+
+static void huawei_wmi_profile_setup(struct huawei_wmi *huawei)
+{
+	struct device *dev;
+
+	if (!huawei_wmi_has_profile_method("\\GTUB") ||
+	    !huawei_wmi_has_profile_method("\\STUB"))
+		return;
+
+	dev = platform_profile_register(huawei->dev, "huawei-wmi", huawei,
+					&huawei_profile_ops);
+	if (IS_ERR(dev)) {
+		scoped_guard(mutex, &huawei->wmi_lock)
+			huawei->reported_profile = PLATFORM_PROFILE_LAST;
+		dev_warn(huawei->dev, "Native platform profiles unavailable: %pe\n", dev);
+		return;
+	}
+	scoped_guard(mutex, &huawei->wmi_lock)
+		huawei->profile_dev = dev;
+	/* Publish changes captured between the initial sample and registration. */
+	platform_profile_notify(dev);
+}
+
+/* Call after removing the WMI event handlers. */
+static void huawei_wmi_profile_exit(struct huawei_wmi *huawei)
+{
+	if (!huawei->profile_dev)
+		return;
+	platform_profile_remove(huawei->profile_dev);
+	huawei->profile_dev = NULL;
+	huawei->reported_profile = PLATFORM_PROFILE_LAST;
+}
+
 /* LEDs */
 
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
@@ -238,7 +379,8 @@ static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 		arg.cmd = MICMUTE_LED_SET;
 		arg.args[2] = brightness;
 
-		return huawei_wmi_cmd(arg.cmd, NULL, 0);
+		guard(mutex)(&huawei_wmi->wmi_lock);
+		return huawei_wmi_cmd(huawei_wmi, arg.cmd, NULL, 0);
 	}
 }
 
@@ -263,7 +405,8 @@ static int huawei_wmi_battery_get(int *start, int *end)
 	u8 data[0xff];
 	int len;
 
-	len = huawei_wmi_cmd(BATTERY_THRESH_GET, data, sizeof(data));
+	scoped_guard(mutex, &huawei_wmi->wmi_lock)
+		len = huawei_wmi_cmd(huawei_wmi, BATTERY_THRESH_GET, data, sizeof(data));
 	if (len < 0)
 		return len;
 	if (len < 2)
@@ -305,9 +448,8 @@ static int huawei_wmi_battery_set(int start, int end)
 		msleep(1000);
 	}
 
-	err = huawei_wmi_cmd(arg.cmd, NULL, 0);
-
-	return err;
+	guard(mutex)(&huawei_wmi->wmi_lock);
+	return huawei_wmi_cmd(huawei_wmi, arg.cmd, NULL, 0);
 }
 
 static ssize_t charge_control_start_threshold_show(struct device *dev,
@@ -560,7 +702,8 @@ static int huawei_wmi_fn_lock_get(int *on)
 	if (acpi_has_method(NULL, "\\GFRS"))
 		return huawei_acpi_fn_lock_get(on);
 
-	len = huawei_wmi_cmd(FN_LOCK_GET, data, sizeof(data));
+	scoped_guard(mutex, &huawei_wmi->wmi_lock)
+		len = huawei_wmi_cmd(huawei_wmi, FN_LOCK_GET, data, sizeof(data));
 	if (len < 0)
 		return len;
 	if (!len)
@@ -588,7 +731,8 @@ static int huawei_wmi_fn_lock_set(int on)
 	arg.cmd = FN_LOCK_SET;
 	arg.args[2] = on + 1; // 0 undefined, 1 off, 2 on.
 
-	return huawei_wmi_cmd(arg.cmd, NULL, 0);
+	guard(mutex)(&huawei_wmi->wmi_lock);
+	return huawei_wmi_cmd(huawei_wmi, arg.cmd, NULL, 0);
 }
 
 static ssize_t fn_lock_state_show(struct device *dev,
@@ -738,6 +882,7 @@ static void huawei_wmi_debugfs_exit(struct device *dev)
 static void huawei_wmi_process_key(struct input_dev *idev, int code)
 {
 	const struct key_entry *key;
+	struct device *profile_dev;
 
 	/*
 	 * WMI0 uses code 0x80 to indicate a hotkey event.
@@ -760,6 +905,27 @@ static void huawei_wmi_process_key(struct input_dev *idev, int code)
 		kfree(response.pointer);
 	}
 
+	switch (code) {
+	case 0x2a0: // firmware report turbo closed
+	case 0x2a1: // firmware report turbo enabled
+		{
+			guard(mutex)(&huawei_wmi->wmi_lock);
+
+			if (huawei_wmi->reported_profile == PLATFORM_PROFILE_LAST)
+				break;
+			huawei_wmi->reported_profile = code == 0x2a0 ?
+				PLATFORM_PROFILE_BALANCED : PLATFORM_PROFILE_PERFORMANCE;
+			profile_dev = huawei_wmi->profile_dev;
+		}
+		if (profile_dev)
+			platform_profile_notify(profile_dev);
+		return;
+	case 0x2a6: // firmware reject your profile change request
+		if (huawei_wmi_profile_sync(huawei_wmi))
+			return;
+		break;
+	}
+
 	key = sparse_keymap_entry_from_scancode(idev, code);
 	if (!key) {
 		dev_info(&idev->dev, "Unknown key pressed, code: 0x%04x\n", code);
@@ -840,6 +1006,8 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 	huawei_wmi->wdev = method ? *method : NULL;
 	platform_set_drvdata(pdev, huawei_wmi);
 	huawei_wmi->dev = &pdev->dev;
+	mutex_init(&huawei_wmi->wmi_lock);
+	huawei_wmi->reported_profile = PLATFORM_PROFILE_LAST;
 
 	for (guid = huawei_wmi_events_id_table; *guid->guid_string; guid++) {
 		if (!wmi_has_guid(guid->guid_string))
@@ -859,12 +1027,11 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 	}
 
 	if (huawei_wmi->wdev) {
-		mutex_init(&huawei_wmi->wmi_lock);
-
 		huawei_wmi_leds_setup(&pdev->dev);
 		huawei_wmi_fn_lock_setup(&pdev->dev);
 		huawei_wmi_battery_setup(&pdev->dev);
 		huawei_wmi_debugfs_setup(&pdev->dev);
+		huawei_wmi_profile_setup(huawei_wmi);
 	}
 
 	return 0;
@@ -881,6 +1048,7 @@ static void huawei_wmi_remove(struct platform_device *pdev)
 		guid++;
 	}
 
+	huawei_wmi_profile_exit(huawei_wmi);
 	if (huawei_wmi->wdev) {
 		huawei_wmi_debugfs_exit(&pdev->dev);
 		huawei_wmi_battery_exit(&pdev->dev);
-- 
2.55.0
