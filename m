Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038504;
	b=RToXdSJ0Wzn8EvAIFpNeRXd75qMp5JLq9KUsm8iAYhgjLD/Qt6qlLuokPYlI0QADYGuh
	 6x85Edqo/pAuPG0xFd3ml3YbUa89bNRd4M1Jth996O23Sg9D66gxxKAUg5c2aCrULyH9h
	 ZKKuGkDqOFxOnQH2P2driC6g2sTFtQYorIspiyOKsDB3ynTNedpgsX6S3qZ1eWDm46+Gy
	 zTX3DXNdBUZvmBIJYsqffc3qu9MCRhVPG/gQMQ0qayaeR5wexINly9vvW2iThromTgmhd
	 ZTG8vfjyeaUf/Hh7BnVq5a2+M43XHuOCB0nD/XPjvHZy1iHCpep5Vll91EjZwX9WYfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038504;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=sDRr5A3BhsB2AMX0WaX6ORpZcarQ2sA86dIzKWZ6YS4=;
	b=Rdqfbj9nRudTyON4A4SXxGcTBg9uyqD9mv/dx1MrBNs47Wu6mGJqB9ojxOGtAxArJNV9
	 qsMWWzzuN6fdH1wPKivTutsaBVIgTK+nY8Q32AHAslrv2VuL9gZur0cmesmYbahylKPsT
	 yHFiiuiAkUBPd7njnCGzK3QsZ2+iVuNbrE+rVVOeD7b8FfClJBtwmgAlVrqA3k8EVyo3n
	 EK1MC7fWLxOci8VlhcyN3Pmxq7YCWiPXnpytFsL/8EiuaD0jvpgDKZA00tvnkWkk/MT1u
	 dy6CHAJY5psvINUoCzlm09VmnCxzLG8xMznvAuA6hUdeTcowRdIyuV02wvXOoLPNz6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86566606A32C;
	Wed, 18 Nov 2026 21:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86566606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795038458;
	bh=sDRr5A3BhsB2AMX0WaX6ORpZcarQ2sA86dIzKWZ6YS4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pyETMSSrWDTbTK8Wi5QQrJj3KGsqQfoQH061KEC3ephOnZ7eYzXot2zzALgmozg1D
	 cNs+/Y5HL4bEPCIseS+mpI0kohJqT/sglLpiJod9rOYpe/gEDzHBIfeLk7SMJ8SSjL
	 hiBkA/JxKKiMLBsalCzrmm8ZMsTvEVfqcMiu/8Co=
X-QQ-mid: zesmtpsz2t1795038454t7d4b1dbf
X-QQ-Originating-IP: 4wQHYptWq511bTn5RSNJPpVtuJNnHUVOLDdeeU1Sihw=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.242])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 05:47:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1251732040003436441
EX-QQ-RecipientCnt: 6
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	erenozen@protonmail.com,
	Fuwei Xie <12313607@mail.sustech.edu.cn>
Subject: [RFC PATCH v2 2/2] platform/x86: huawei-wmi: expose native Turbo mode as platform_profile
Date: Thu, 19 Nov 2026 00:13:11 +0800
Message-ID: <A081DE0C3A165563+20261118161311.17252-3-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118161311.17252-1-12313607@mail.sustech.edu.cn>
References: <20261118161311.17252-1-12313607@mail.sustech.edu.cn>
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
Feedback-ID: zesmtpsz:mail.sustech.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MALXGmGsaHY4Pt2LgPxpQ6+xOB7izTnGiI6OtI40r6QTe7VcEYFdpsAY
	dFUsAe7G9Q4Z/pXUMP/saTo7vvAY5SseeTXa9dsmwVBImjDjF/sFGzAJcPtThgIenKZskLf
	CJyB+bVtTpYEO71DnyP8/Nf2bVJxaMhx/igb+o7T9LkyznUmUOWXrEbA9IdIpj9EgEjD2St
	NBMqCLSggTIL2W9VTqR/fmulJtLFB28IJa7oqAzcu+XtNxAWHtgrhLmDIuli+A1xlu9pPwj
	N6qjCqvh5+EcKSI7GIznX59Wy4rax65b0m8hZQ5CBmkXKoJTojQaNDWq9hT4mySvpA4xVxU
	5toKhgBAZgdfTbCJGa55vFxED1kb0ST4pOp7Z/WNt/XrK2LoIpgwe83Ebpy3flvlsnqNJ7b
	a8D0LT1i2kJQ8Frpb3JyfwaaPmq1cEAQ8SLZZ2EHRw3y8UsxVKI7RVI+OklNhY/mij5pwe7
	R50lsAWQb5HQ4c/p0a/ds9bBaINhuT5TwoFl+Fa7iIl4PhhsX/+5fOpI0nCfrX3vghT+dC2
	jBeFMaz/8RsXoUVc6+1dBNj0dTCFKdz+w5zPpNBM/0zfRPMsunSMzX3TeFN5v9fTxgjybBd
	Q6KvieQN13iHvH6DZCu7+kqoKsfN6tcJsd2ySf1wnQ+2R8FhecHqNDFaW8XpzPCb/nLtTau
	lGmEg1XEZF2tneVqUeQa86q7AOVtxfxsDFxEKpFhfQgKs6nmfZgqYChmXhVrSrCjDxBLFKy
	eYkM0d0W6mhQt9rkH8+UBpQTdKhm2JsuvQQE12kQv7Byf/EGN3+B4Lxcc5etC9wOSAf5EJ5
	Cn3swkzjLQziQCWX4GAdxSCfISBZ2d2xILQlKHGA7e3KXgztvxa7TjrF217Ano7lIuV8UIf
	LDWA2GhU2uJQdhv1OVdvMbEKCjxYgToqD2CZ+SPzAphWxO+FQfbuoFYCzO/ouPaHU2Qt2D9
	dO36CPq7TFCCMkXuMjPMrCQEFDRyDvsGQgEVyFtEnRmHu0GfbkYEyUDUGf+Nkf5yCZbP+9A
	osJtrBafCDN+UMzhYcxFAk7oHaHMAehZurAu/wNIxorR/GrJhM6tMaL1vwWi0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

The firmware on Huawei NbF-XX and MateBook 16 CREM-WXX9 exposes GTUB/STUB
behind WMI commands 0x00000e04 and 0x00000f04. The driver does not expose
this state through platform_profile, so userspace cannot select the
native firmware profile through the standard interface.

Map Turbo off/on to balanced/performance and read back the state after
a set. CREM-WXX9 firmware can return status zero even when it refuses a
request; the resulting state must determine whether the change succeeded.

Detect support within the existing Huawei WMI method device, requiring
both ACPI methods and a successful query of a known state (0 or 1).
Do not switch modes during detection. Unsupported or malformed responses
leave profiles unavailable without disabling the driver's other features.
This replaces a model/BIOS allowlist: the same interface was reported on
both Intel NbF-XX BIOS 3.07 and AMD CREM-WXX9 BIOS 2.32.

Refresh the reported state through deferred work on WMI notifications,
power-supply changes and resume. The power-supply notifier also covers
CREM-WXX9 firmware turning Turbo off on unplug without a 0x2a0 event.
Re-query on 0x2a6, which was observed on refused requests on that model,
without assigning a universal meaning to the notification.

Leave AC and battery restrictions to the firmware. NbF-XX BIOS 3.07 checks
AC power and a minimum battery charge, whereas CREM-WXX9 BIOS 2.32 was
reported to check AC power only. Do not enforce a fixed wattage, write
power-limit registers, or override the fan policy.

Eren Ozen reported working mode readback, tuned-ppd integration, Fn+P
and AC transitions on CREM-WXX9 using v1 plus a DMI entry. Testing the
revised capability-based probe on that machine is still requested.

Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
---
 drivers/platform/x86/Kconfig      |   1 +
 drivers/platform/x86/huawei-wmi.c | 190 +++++++++++++++++++++++++++++-
 2 files changed, 189 insertions(+), 2 deletions(-)

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
index 9894424e7..9e79f7452 100644
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
@@ -264,6 +271,170 @@ static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
 	return huawei_wmi_cmd_min(arg, buf, buflen, buflen);
 }
 
+/* Native firmware profiles: no RAPL writes and no periodic enforcement. */
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
+	/* Firmware enforces model-specific AC and battery requirements. */
+	arg.args[2] = profile == PLATFORM_PROFILE_PERFORMANCE;
+	err = huawei_wmi_cmd(arg.cmd, NULL, 0);
+	if (err)
+		return err;
+	/* Some firmware returns success even when it refuses the change. */
+	err = huawei_wmi_profile_get(dev, &actual);
+	if (err)
+		return err;
+	return actual == profile ? 0 : -EAGAIN;
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
+static int huawei_wmi_profile_detect(struct device *dev)
+{
+	enum platform_profile_option profile;
+
+	if (!huawei_wmi_has_profile_method("\\GTUB") ||
+	    !huawei_wmi_has_profile_method("\\STUB"))
+		return -ENODEV;
+
+	/* Query a known state; never switch modes to probe firmware support. */
+	return huawei_wmi_profile_get(dev, &profile);
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
+	struct device *dev;
+	int err;
+
+	err = huawei_wmi_profile_detect(huawei->dev);
+	if (err == -ENODEV)
+		return;
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
@@ -830,6 +1001,18 @@ static void huawei_wmi_process_key(struct input_dev *idev, int code)
 		kfree(response.pointer);
 	}
 
+	/*
+	 * Refresh on mode events and 0x2a6, observed on refused STUB requests
+	 * on CREM-WXX9. Do not infer a mode or a universal error from the event.
+	 */
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
@@ -904,6 +1087,8 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, huawei_wmi);
 	huawei_wmi->dev = &pdev->dev;
+	mutex_init(&huawei_wmi->wmi_lock);
+	INIT_WORK(&huawei_wmi->profile_work, huawei_wmi_profile_work);
 
 	while (*guid->guid_string) {
 		if (wmi_has_guid(guid->guid_string)) {
@@ -918,12 +1103,11 @@ static int huawei_wmi_probe(struct platform_device *pdev)
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
@@ -940,6 +1124,7 @@ static void huawei_wmi_remove(struct platform_device *pdev)
 		guid++;
 	}
 
+	huawei_wmi_profile_exit(huawei_wmi);
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
 		huawei_wmi_debugfs_exit(&pdev->dev);
 		huawei_wmi_battery_exit(&pdev->dev);
@@ -950,6 +1135,7 @@ static void huawei_wmi_remove(struct platform_device *pdev)
 static struct platform_driver huawei_wmi_driver = {
 	.driver = {
 		.name = "huawei-wmi",
+		.pm = pm_sleep_ptr(&huawei_wmi_pm),
 	},
 	.probe = huawei_wmi_probe,
 	.remove = huawei_wmi_remove,
-- 
2.55.0

