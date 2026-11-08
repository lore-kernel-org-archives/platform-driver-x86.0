Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111478;
	b=YJSaF8OxERNLZX8FLvv3xuIoeWTvGEtaLPeLOTJLz9c/WsetjfthDYLwTvbvkkvWfgxE
	 baY+AezE1lYi5IiOtXOPXg+NEqSGKcJQ4peqbMFgtVraKxJLJLF+Uatj2JAAV4q6dQ6Wk
	 s8A2AW+D9wMlQb4CxkJKvSlh4HA7TAqWxiDkewA1mCEHtqAt8SxvxZ3f9qBvgLv1nNl3+
	 ggDJhKIQeSZq0GROcvEd4ws7YfxvOSZvYdRgR/gb2UNOWFAD0L59gKI88ZTg2ip8uTh0b
	 sKB/INxcfBkjqML0afnreu8pIEvF2wnWm82u+GQY/DpqwDIo3k5tepwPSgY2oRYohiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111478;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=O7ltMIL70cv53BUR4Z/C6B6F/Y26pOdnIMdecL8YHO4=;
	b=gc8ASs7tQ/Ud0pMc3LcWZ2Ltr5ajO4gSQBHweV2gh9uHH2f5XbHyjTyOsbhHsahXd4mw
	 6fDKIYUnJWCIaTH1aWfTZcvbWts1VDHzGSsQ+lGfr+rjPXGW50X19vN3akwXTAMWYOn+o
	 TzTJi7keKiXmPqC/NUgmGl5sKxZ/ixRjbP3CYPkGxejZIuSXbG671EiGjMdvOVUvq3/dS
	 BGXYUq4ifJt29bN1vtvsSLEdTCh1RleZbdnCzwFL0K+rhpeRXodsSL+saLGj9Aphy2q96
	 7YuqCeWzIt2sKedwXLlZgfn10MjEvS0xvIYjhL3y/ZF55DYRoZPFG/Fx0xoSthEZp6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=umiBltMp;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C7606A31C;
	Sun,  8 Nov 2026 04:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=umiBltMp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1794111449;
	bh=O7ltMIL70cv53BUR4Z/C6B6F/Y26pOdnIMdecL8YHO4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=umiBltMpWfOHQj8fIWgTY0iSMSzZv5YU0qVZxE+KztnZ9TDahi1+//ekjXWinZikn
	 E01ldAmEzzSrBEIB5aEOh51E8d31OXUXsA4w28O4tVGsdzBHcOTiNnnvsBV9cY1RYy
	 muvFdHW94cPA6UaI/zbA/d+Qd+wtjI3aeKDB1M4M=
X-QQ-mid: zesmtpgz6t1794111444t7683844f
X-QQ-Originating-IP: fSwqMu6GwghLtzUDEQZmWVAOb3P6GxOPvLuAsKklHRk=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 08 Nov 2026 12:17:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16933119279076137902
EX-QQ-RecipientCnt: 5
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fuwei Xie <12313607@mail.sustech.edu.cn>
Subject: [RFC PATCH 2/2] platform/x86: huawei-wmi: expose native Turbo mode as platform_profile
Date: Sun,  8 Nov 2026 12:17:13 +0800
Message-ID: <583B99876AEC4CF2+20261108041714.328986-3-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108041714.328986-1-12313607@mail.sustech.edu.cn>
References: <20261108041714.328986-1-12313607@mail.sustech.edu.cn>
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
X-QQ-XMAILINFO: NOuPBFlZdNxRVNdUZIM80Wr/pVO6U4bTbNSdeWK9/nWWffrBwaWpuXLq
	TWJydptzFkldHmDb+05VivAfYUrKMHy3gUqx2y+NZbPHk7D9KgLgvfN7radF4UweU5I4b0o
	xiUSrmKbuuAUqIbWohGojy0o9qyNtGUBcnxxhqeGtFXrX9QKcVhvpCFnx4YoV635PjDI9Wz
	jnrdmjPASYzJ0RGuerxhlz0gXVphuKC/LBhRa+6+w+zStwVob1lhUD5+uLiJMXMwcqnN3X8
	mcMvKePpUZeplkWUJhmvNsvr5CLyl/T/Dei+P7Js7DHFXHyUPqJNV71GRFEn4NSIxgpeBCV
	7KgPiz1KJzf1LAqFjDrTKPIv0C/XNC1OKTx17Tj1ODdgvPAT0HtlR7AYx83uvTNXedoSELY
	h9PzHYduA5uzFXClbGWQAnHi1E7l94yW22mOUZmZxgcorLAP8gLAsh/CdbG+KRAi/DA9Thy
	R6UvThGOTiala0LlTXe0+/G1+wt/ppBZrEKpbVckgtQpeQDC5ps+vtVQXtBDoAGTV+hzS+y
	8rOnlW9pEvwO6Ya7QDDCF77ah13FEB1nDzNripb7nNoPZnQ8vOZSPxmaiw5Wo5ekXU+wZZP
	RSIhtbV4DYUzyHqz/nCmcVOpFWY3qpIoyEKGNfEk4ZgaSV1ZVfdUreGiltpnh7jmke+YslZ
	juge9q74s6OXca+ZfJBxSYtbmCe0Xpz9UM4KteuNhWOWfM344E+C8mT7QZ2peK3wlmJkUUv
	60ot2xzg7riqgD8rUPYsuGkw7mFQkQB/yMGl3cQ9ponLZVrW2tIYNJYAKQ69T2KEPvxPCW6
	1+b6pVHVRlFzWasO9MtJnfaj7oQyJAEiUaXw0tswkmnIeR/IFfWr5xwrFRDEogVQuE6cTxB
	QIB+C6b62xthOMdDAIYRm51IjnFgF8DaFG+2UYXUslVyCFRuT4tpHqfps3CzBOnJ9m1guUG
	meO9LuGe3nnbtIyuoi9b4Mwovl9WDw0YAYKI2PclEdKvzE4KXTpGAqXjKPWoEVB5/dzj9DX
	5cLOD5bezDT4AvEG3rpESWzqHjMFSfA0ZZ7Zhkcllmsh6oBwrTTVFwKE9KATMcocVzU35m6
	0HN3YJlpNDkG15jv2DJ2J8ps0EXJm82K5BUe+GZixOioSYQteB2WXMaPlp/iTIaq/Qqiooj
	8iZ7
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The firmware on the NbF-XX exposes GTUB/STUB behind WMI commands
0x00000e04 and 0x00000f04 and reports mode changes through WMI events
0x2a0 and 0x2a1. The driver implements none of this, so platform_profile
is never registered and power-profiles-daemon falls back to its
placeholder driver.

Map the native Turbo state to balanced and performance, re-read the state
after a set instead of assuming the firmware accepted it, and refresh the
reported state on WMI mode events, power supply changes and resume using a
workqueue.

The firmware requires AC power and a battery charge of at least 21% before
it will change mode; that restriction is preserved and a refusal is
reported as an error. No periodic enforcement, direct EC write or fan
curve override is added. Support is limited to the inspected NbF-XX
BIOS 3.07 firmware, with ACPI method presence checks.

Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
---
 drivers/platform/x86/Kconfig      |   1 +
 drivers/platform/x86/huawei-wmi.c | 177 +++++++++++++++++++++++++++++-
 2 files changed, 176 insertions(+), 2 deletions(-)

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
index 504ee2737..f85f89c54 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -16,9 +16,11 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/platform_profile.h>
 #include <linux/power_supply.h>
 #include <linux/sysfs.h>
 #include <linux/wmi.h>
+#include <linux/workqueue.h>
 #include <acpi/battery.h>
 
 /*
@@ -39,6 +41,8 @@ enum {
 	FN_LOCK_GET			= 0x00000604, /* \GFRS */
 	FN_LOCK_SET			= 0x00000704, /* \SFRS */
 	MICMUTE_LED_SET			= 0x00000b04, /* \SMLS */
+	POWER_MODE_GET			= 0x00000e04, /* \GTUB */
+	POWER_MODE_SET			= 0x00000f04, /* \STUB */
 };
 
 union hwmi_arg {
@@ -68,6 +72,9 @@ struct huawei_wmi {
 	struct device *dev;
 
 	struct mutex wmi_lock;
+	struct device *profile_dev;
+	struct work_struct profile_work;
+	struct notifier_block power_notifier;
 };
 
 static struct huawei_wmi *huawei_wmi;
@@ -259,6 +266,160 @@ static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
 	return err;
 }
 
+/* Native firmware profiles: no RAPL writes and no periodic enforcement. */
+static const struct dmi_system_id huawei_profile_dmi[] = {
+	{
+		.ident = "Huawei NbF-XX (BIOS 3.07)",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NbF-XX"),
+			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "3.07"),
+		},
+	},
+	{ }
+};
+
+static int huawei_wmi_profile_get(struct device *dev,
+				  enum platform_profile_option *profile)
+{
+	u8 ret[2];
+	int err;
+
+	err = huawei_wmi_cmd(POWER_MODE_GET, ret, sizeof(ret));
+	if (err)
+		return err;
+	if (ret[1] > 1)
+		return -ENODATA;
+	*profile = ret[1] ? PLATFORM_PROFILE_PERFORMANCE : PLATFORM_PROFILE_BALANCED;
+	return 0;
+}
+
+static int huawei_wmi_profile_set(struct device *dev,
+				  enum platform_profile_option profile)
+{
+	enum platform_profile_option actual;
+	union hwmi_arg arg = { .cmd = POWER_MODE_SET };
+	int err;
+
+	if (profile != PLATFORM_PROFILE_BALANCED &&
+	    profile != PLATFORM_PROFILE_PERFORMANCE)
+		return -EOPNOTSUPP;
+
+	err = huawei_wmi_profile_get(dev, &actual);
+	if (err || actual == profile)
+		return err;
+
+	/* STUB enforces its own AC/battery requirements, even for disabling. */
+	arg.args[2] = profile == PLATFORM_PROFILE_PERFORMANCE;
+	err = huawei_wmi_cmd(arg.cmd, NULL, 0);
+	if (err)
+		return err;
+	err = huawei_wmi_profile_get(dev, &actual);
+	if (err)
+		return err;
+	return actual == profile ? 0 : -EAGAIN;
+}
+
+static int huawei_wmi_profile_probe(void *drvdata, unsigned long *choices)
+{
+	set_bit(PLATFORM_PROFILE_BALANCED, choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	return 0;
+}
+
+static const struct platform_profile_ops huawei_profile_ops = {
+	.probe = huawei_wmi_profile_probe,
+	.profile_get = huawei_wmi_profile_get,
+	.profile_set = huawei_wmi_profile_set,
+};
+
+static void huawei_wmi_profile_work(struct work_struct *work)
+{
+	struct huawei_wmi *huawei = container_of(work, struct huawei_wmi, profile_work);
+	/* Pairs with release publication after profile/notifier registration. */
+	struct device *dev = smp_load_acquire(&huawei->profile_dev);
+	enum platform_profile_option profile;
+	int err;
+
+	if (!dev)
+		return;
+	err = huawei_wmi_profile_get(dev, &profile);
+	if (err) {
+		dev_warn_ratelimited(huawei->dev, "Cannot refresh firmware profile: %d\n", err);
+		return;
+	}
+	/* A cached value can miss a quick userspace change followed by Fn+P. */
+	platform_profile_notify(dev);
+}
+
+static void huawei_wmi_profile_refresh(struct huawei_wmi *huawei)
+{
+	/* Pairs with release publication after profile/notifier registration. */
+	if (smp_load_acquire(&huawei->profile_dev))
+		schedule_work(&huawei->profile_work);
+}
+
+static int huawei_wmi_power_changed(struct notifier_block *nb,
+				    unsigned long event, void *data)
+{
+	struct huawei_wmi *huawei = container_of(nb, struct huawei_wmi, power_notifier);
+
+	if (event == PSY_EVENT_PROP_CHANGED)
+		huawei_wmi_profile_refresh(huawei);
+	return NOTIFY_OK;
+}
+
+static void huawei_wmi_profile_setup(struct huawei_wmi *huawei)
+{
+	enum platform_profile_option profile;
+	struct device *dev;
+	int err;
+
+	if (!dmi_check_system(huawei_profile_dmi) ||
+	    !acpi_has_method(NULL, "\\GTUB") || !acpi_has_method(NULL, "\\STUB"))
+		return;
+	err = huawei_wmi_profile_get(huawei->dev, &profile);
+	if (err)
+		goto fail;
+	dev = platform_profile_register(huawei->dev, "huawei-wmi", huawei,
+					&huawei_profile_ops);
+	if (IS_ERR(dev)) {
+		err = PTR_ERR(dev);
+		goto fail;
+	}
+	huawei->power_notifier.notifier_call = huawei_wmi_power_changed;
+	err = power_supply_reg_notifier(&huawei->power_notifier);
+	if (err) {
+		platform_profile_remove(dev);
+		goto fail;
+	}
+	/* Publish only after both registration steps succeed. */
+	smp_store_release(&huawei->profile_dev, dev);
+	huawei_wmi_profile_refresh(huawei);
+	return;
+fail:
+	dev_warn(huawei->dev, "Native platform profiles unavailable: %d\n", err);
+}
+
+/* Call after removing the WMI event handlers. */
+static void huawei_wmi_profile_exit(struct huawei_wmi *huawei)
+{
+	if (!huawei->profile_dev)
+		return;
+	power_supply_unreg_notifier(&huawei->power_notifier);
+	cancel_work_sync(&huawei->profile_work);
+	platform_profile_remove(huawei->profile_dev);
+	huawei->profile_dev = NULL;
+}
+
+static int huawei_wmi_resume(struct device *dev)
+{
+	huawei_wmi_profile_refresh(dev_get_drvdata(dev));
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(huawei_wmi_pm, NULL, huawei_wmi_resume);
+
 /* LEDs */
 
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
@@ -825,6 +986,15 @@ static void huawei_wmi_process_key(struct input_dev *idev, int code)
 		kfree(response.pointer);
 	}
 
+	/* These are firmware state notifications, not requests to toggle again. */
+	if (code == 0x2a0 || code == 0x2a1 || code == 0x2a6) {
+		/* Pairs with release publication after profile/notifier registration. */
+		if (smp_load_acquire(&huawei_wmi->profile_dev)) {
+			huawei_wmi_profile_refresh(huawei_wmi);
+			return;
+		}
+	}
+
 	key = sparse_keymap_entry_from_scancode(idev, code);
 	if (!key) {
 		dev_info(&idev->dev, "Unknown key pressed, code: 0x%04x\n", code);
@@ -899,6 +1069,8 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, huawei_wmi);
 	huawei_wmi->dev = &pdev->dev;
+	mutex_init(&huawei_wmi->wmi_lock);
+	INIT_WORK(&huawei_wmi->profile_work, huawei_wmi_profile_work);
 
 	while (*guid->guid_string) {
 		if (wmi_has_guid(guid->guid_string)) {
@@ -913,12 +1085,11 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 	}
 
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
-		mutex_init(&huawei_wmi->wmi_lock);
-
 		huawei_wmi_leds_setup(&pdev->dev);
 		huawei_wmi_fn_lock_setup(&pdev->dev);
 		huawei_wmi_battery_setup(&pdev->dev);
 		huawei_wmi_debugfs_setup(&pdev->dev);
+		huawei_wmi_profile_setup(huawei_wmi);
 	}
 
 	return 0;
@@ -935,6 +1106,7 @@ static void huawei_wmi_remove(struct platform_device *pdev)
 		guid++;
 	}
 
+	huawei_wmi_profile_exit(huawei_wmi);
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
 		huawei_wmi_debugfs_exit(&pdev->dev);
 		huawei_wmi_battery_exit(&pdev->dev);
@@ -945,6 +1117,7 @@ static void huawei_wmi_remove(struct platform_device *pdev)
 static struct platform_driver huawei_wmi_driver = {
 	.driver = {
 		.name = "huawei-wmi",
+		.pm = pm_sleep_ptr(&huawei_wmi_pm),
 	},
 	.probe = huawei_wmi_probe,
 	.remove = huawei_wmi_remove,
-- 
2.53.0

