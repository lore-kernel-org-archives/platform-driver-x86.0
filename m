Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541286;
	b=z4/A2kz0ntCYa0wZ2ZosIV9KNF7rkRMlRxavhy2Y1gylVrwZhTbYH5Ttxv1qeM+r0wUv
	 7ok6PfxshcB5O1FDlP8FBBZ1S60/16DvXNBSI6Wh394CZrTokwUc/NjL9KqatA7sOrHKS
	 vBuo+rfBmCVr7iyuDz26IgBu0qnQeFuHa+YP/8RnRI2U7p3dg+YOZxOWgAQnZeNSL4lkl
	 0LOgNtm39DWKTFcXyArPF5UFs9sygr34NalbNZZSMAMz9IOPgVhR1Wngv/j3ZsW1622Md
	 81vhXPjNKXPMq+NFa8YWuGiGn1g1ZuPNHBB7W5vhNNcqVeINIacvpaXHg7PsLl8A7xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541286;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=xJYRRJrnxNFgj+tO/atIY3zEVd3BZXXJqFp6kkh+pX4=;
	b=tDZO4YYPw5BKlJhPP8OvW0Dn+TvardNghYHlT/nAgX0Uw6TARHhZ+sJMLL88xHRdZ2wf
	 EEyrhYBGgzcMPUuqjwOt3Eehp/OaUZQi6bA8YhZR7EJfbFGa37KV0tyHQp6Xsdhv7Smcm
	 O1aFdt7cfRoT3RwbStJlHtCR5ivv884US05y6IjCTC0LfNkCfFDiHRf4to5j1TggmOPbn
	 cXHz/hZcLF9JMre5sqrX0zSMrst/O1qp7pI7MUajQMJS+/Q79nVK6Xe2Yc8S2no6PdJQT
	 rg1kxebM22SRkgIaqyCsH6p/0OJRLXpDcPfXyWAmDY47SL8LLp03I34NtJM+n2fmiew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=H3NBr2de;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F053606A330;
	Tue, 24 Nov 2026 17:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F053606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=H3NBr2de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795541232;
	bh=xJYRRJrnxNFgj+tO/atIY3zEVd3BZXXJqFp6kkh+pX4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=H3NBr2deh6XdDMh3fhsZU9YUrqqOBGQ495Mv6fxvpl4pdY9h1366lULoNXKzaSlFc
	 sbpJMKEvI4+tYK3gc9HCEWzfQol/ToILgK1Gb4BabxdZVKNpZ+5cOWdclVpCUnEjKn
	 HbfiO2Bl7vtWvQvx9JKNdXREpznT5ZnkqE5Pnu3s=
X-QQ-mid: zesmtpgz9t1795541227t0db00cc4
X-QQ-Originating-IP: PrLBp10zsJicpfR4yDC9H9kxLcg0BbZr8Vl3/6IwF+8=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 01:27:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1918666305034102206
EX-QQ-RecipientCnt: 7
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Fuwei Xie <12313607@mail.sustech.edu.cn>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	Zheng Shuyang <yhshzh0@gmail.com>
Subject: [RFC PATCH v3 5/5] platform/x86: huawei-wmi: bind hotkeys and key data on the WMI bus
Date: Wed, 25 Nov 2026 01:25:32 +0800
Message-ID: <A47B84862522E3EE+20261124172651.37716-6-12313607@mail.sustech.edu.cn>
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
X-QQ-XMAILINFO: NY6OurWw+pG/cHf7ryNGBVa3ITRmPnGcCJWmMOjwGruiewrmeb+tD4bM
	8iys9kWjpcoN441DeuphUUpgz05zPjyd80mYsiwdPDFGGhSIfaWfWGlw1/5Oz6O3Rf5VtI2
	KpC5JnL/gZt0eScV6nTrKc4bVqfrcPvLJU9T358vQKaHk/qtMPsWHR053mXWn9m8qFA6DNe
	3O1hHi9upLhWB29g03zIwkHbJK5OWti7/z/sZYf2FQ0iHS9QBqxzijuFpeBM327E7sMD7R/
	FDPEEmcIVVHS/Ahn5gL12Pqg+agWZlYRxs6UpKIrrpPNXA9XZjKVQeygrrPxSVv0uHyf6fJ
	UKtEHrmgncGTGQ5rxxE772485HQkEPgB27vBSbZF2Do9l7aaSUszQawSgMzIrA48XomJdA6
	dgnIQxGs30CNyt92pcyOACZxWnNkxSq97TleMLggrE9hClr7fa7/tCfa/BHdJvJUU1YqpBo
	PAdqgbzK7s2G31zzgHOIBtjubxNP8ufA5E1ZJ1M1WHIvTCeZYBXuGS5QetlM5LU8nc2EqxD
	bzpUgyp3iaOWBeSKLR+9ZaTHF//baZrvAtaB2VFaelRi9VZ+UwbzMkhow7g5eKWEksiGo3B
	kUb2YaTrpJhxJdsYy2QT0/CqlndbMVSt83lAvgc0ubvxZRVd9RMHFd2ajvKB8qsUAj6AG/6
	GTLhGjRTC1J26tD0OoqRkfYSqZlxJ8mpc3gG0IcdsF+aZi3QuQ82/EAYN1AM420LTxJ9cMS
	ubRA8xdrgXq0mhmT58hw3E2Q6wJCFWSZ19EPvEBYn2gT3GxyU3YgH9kxdriCJrYZOQxjq/W
	iiTmkzy0gdOnHo17TSb6uCTv6twYOjdJovvn86OH3NjeYv+ZPGV6jLOPbLWcKeDpUGDfYAr
	Ng28Nz6e61nljcLEo3i7E+COfAzqXevIvSMAn/k5hxjxBUDZyzIc/DLxzvmzGpqlsxjAwXu
	pP/hczdyro5rukUDQh0RujYnaq2TbbFK+V8H1Xy6diP7PgtknWtVkZhHnkUA/LxGo7Nc8Fh
	duZ/4zJfh8W/9AW7pP1SwW9s3ZeL3IG+z8sI1ca9KRpFFVBZnIh5/TpWk1qf5csMnZW6o/D
	sKar0u7StNIIuM96hIZ1yCgGWA7lnlO6A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Register WMI drivers for both event GUIDs and the legacy key data
block. Decode the 32-bit event payload and resolve the 0x80 marker
through the data block on the same mapper. Use blocking notifiers to
synchronize event delivery with method and data device removal.

Keep the platform device as the parent of the existing userspace
interfaces. Register the event driver before the method driver takes
its first profile sample. Event-only systems can bind independently.

Use the sized WMI interface for debugfs calls as well. Display the
marshalled reply bytes and use debugfs_remove() for subtree removal.

Treat 0x2a5 like 0x2a6 and re-read the firmware mode; FMB-P emits it
for TBF2-restricted transitions.

Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
---
 drivers/platform/x86/huawei-wmi.c | 536 +++++++++++++++++++-------------------
 1 file changed, 274 insertions(+), 262 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 242926d50..ff80050b4 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -15,6 +15,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
@@ -29,8 +30,8 @@
 #define HWMI_EVENT_GUID "ABBC0F5C-8EA1-11D1-A000-C90629100000"
 
 /* Legacy GUIDs */
-#define WMI0_EXPENSIVE_GUID "39142400-C6A3-40fa-BADB-8A2652834100"
-#define WMI0_EVENT_GUID "59142400-C6A3-40fa-BADB-8A2652834100"
+#define WMI0_EXPENSIVE_GUID "39142400-C6A3-40FA-BADB-8A2652834100"
+#define WMI0_EVENT_GUID "59142400-C6A3-40FA-BADB-8A2652834100"
 
 /* HWMI commands */
 
@@ -55,7 +56,8 @@ struct quirk_entry {
 	bool report_brightness;
 };
 
-static struct quirk_entry *quirks;
+static struct quirk_entry quirk_unknown = {};
+static struct quirk_entry *quirks = &quirk_unknown;
 
 struct huawei_wmi_debug {
 	struct dentry *root;
@@ -64,6 +66,7 @@ struct huawei_wmi_debug {
 
 struct huawei_wmi {
 	struct wmi_device *wdev;
+	struct notifier_block profile_notifier;
 	bool battery_available;
 	bool fn_lock_available;
 
@@ -76,7 +79,11 @@ struct huawei_wmi {
 	enum platform_profile_option reported_profile;
 };
 
-static struct huawei_wmi *huawei_wmi;
+/* The existing platform device owns the system-wide userspace paths. */
+static struct platform_device *huawei_pdev;
+
+static BLOCKING_NOTIFIER_HEAD(huawei_wmi_keycode_chain);
+static BLOCKING_NOTIFIER_HEAD(huawei_wmi_profile_chain);
 
 static const struct key_entry huawei_wmi_keymap[] = {
 	{ KE_KEY,    0x281, { KEY_BRIGHTNESSDOWN } },
@@ -120,8 +127,6 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 	return 1;
 }
 
-static struct quirk_entry quirk_unknown = {
-};
 
 static struct quirk_entry quirk_battery_reset = {
 	.battery_reset = true,
@@ -323,7 +328,7 @@ static void huawei_wmi_profile_setup(struct huawei_wmi *huawei)
 	platform_profile_notify(dev);
 }
 
-/* Call after removing the WMI event handlers. */
+/* Call after unregistering the profile notifier. */
 static void huawei_wmi_profile_exit(struct huawei_wmi *huawei)
 {
 	if (!huawei->profile_dev)
@@ -338,6 +343,8 @@ static void huawei_wmi_profile_exit(struct huawei_wmi *huawei)
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 		enum led_brightness brightness)
 {
+	struct huawei_wmi *huawei = container_of(led_cdev, struct huawei_wmi, cdev);
+
 	/* This is a workaround until the "legacy" interface is implemented. */
 	if (quirks && quirks->ec_micmute) {
 		char *acpi_method;
@@ -379,11 +386,16 @@ static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 		arg.cmd = MICMUTE_LED_SET;
 		arg.args[2] = brightness;
 
-		guard(mutex)(&huawei_wmi->wmi_lock);
-		return huawei_wmi_cmd(huawei_wmi, arg.cmd, NULL, 0);
+		guard(mutex)(&huawei->wmi_lock);
+		return huawei_wmi_cmd(huawei, arg.cmd, NULL, 0);
 	}
 }
 
+static void huawei_wmi_led_unregister(void *data)
+{
+	led_classdev_unregister(data);
+}
+
 static void huawei_wmi_leds_setup(struct device *dev)
 {
 	struct huawei_wmi *huawei = dev_get_drvdata(dev);
@@ -392,21 +404,22 @@ static void huawei_wmi_leds_setup(struct device *dev)
 	huawei->cdev.max_brightness = 1;
 	huawei->cdev.brightness_set_blocking = &huawei_wmi_micmute_led_set;
 	huawei->cdev.default_trigger = "audio-micmute";
-	huawei->cdev.dev = dev;
 	huawei->cdev.flags = LED_CORE_SUSPENDRESUME;
 
-	devm_led_classdev_register(dev, &huawei->cdev);
+	if (!led_classdev_register(dev, &huawei->cdev))
+		devm_add_action_or_reset(&huawei->wdev->dev, huawei_wmi_led_unregister,
+					 &huawei->cdev);
 }
 
 /* Battery protection */
 
-static int huawei_wmi_battery_get(int *start, int *end)
+static int huawei_wmi_battery_get(struct huawei_wmi *huawei, int *start, int *end)
 {
 	u8 data[0xff];
 	int len;
 
-	scoped_guard(mutex, &huawei_wmi->wmi_lock)
-		len = huawei_wmi_cmd(huawei_wmi, BATTERY_THRESH_GET, data, sizeof(data));
+	scoped_guard(mutex, &huawei->wmi_lock)
+		len = huawei_wmi_cmd(huawei, BATTERY_THRESH_GET, data, sizeof(data));
 	if (len < 0)
 		return len;
 	if (len < 2)
@@ -423,7 +436,7 @@ static int huawei_wmi_battery_get(int *start, int *end)
 	return 0;
 }
 
-static int huawei_wmi_battery_set(int start, int end)
+static int huawei_wmi_battery_set(struct huawei_wmi *huawei, int start, int end)
 {
 	union hwmi_arg arg;
 	int err;
@@ -441,24 +454,29 @@ static int huawei_wmi_battery_set(int start, int end)
 	 * make sure these values make their way to EC memory.
 	 */
 	if (quirks && quirks->battery_reset && start == 0 && end == 100) {
-		err = huawei_wmi_battery_set(0, 0);
+		err = huawei_wmi_battery_set(huawei, 0, 0);
 		if (err)
 			return err;
 
 		msleep(1000);
 	}
 
-	guard(mutex)(&huawei_wmi->wmi_lock);
-	return huawei_wmi_cmd(huawei_wmi, arg.cmd, NULL, 0);
+	guard(mutex)(&huawei->wmi_lock);
+	return huawei_wmi_cmd(huawei, arg.cmd, NULL, 0);
 }
 
+/*
+ * The per-battery files belong to the ACPI battery. They access the platform
+ * controller only while its battery hook is registered.
+ */
 static ssize_t charge_control_start_threshold_show(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
+	struct huawei_wmi *huawei = platform_get_drvdata(huawei_pdev);
 	int err, start;
 
-	err = huawei_wmi_battery_get(&start, NULL);
+	err = huawei_wmi_battery_get(huawei, &start, NULL);
 	if (err)
 		return err;
 
@@ -469,9 +487,10 @@ static ssize_t charge_control_end_threshold_show(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
+	struct huawei_wmi *huawei = platform_get_drvdata(huawei_pdev);
 	int err, end;
 
-	err = huawei_wmi_battery_get(NULL, &end);
+	err = huawei_wmi_battery_get(huawei, NULL, &end);
 	if (err)
 		return err;
 
@@ -482,9 +501,10 @@ static ssize_t charge_control_thresholds_show(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
 	int err, start, end;
 
-	err = huawei_wmi_battery_get(&start, &end);
+	err = huawei_wmi_battery_get(huawei, &start, &end);
 	if (err)
 		return err;
 
@@ -495,16 +515,17 @@ static ssize_t charge_control_start_threshold_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t size)
 {
+	struct huawei_wmi *huawei = platform_get_drvdata(huawei_pdev);
 	int err, start, end;
 
-	err = huawei_wmi_battery_get(NULL, &end);
+	err = huawei_wmi_battery_get(huawei, NULL, &end);
 	if (err)
 		return err;
 
 	if (sscanf(buf, "%d", &start) != 1)
 		return -EINVAL;
 
-	err = huawei_wmi_battery_set(start, end);
+	err = huawei_wmi_battery_set(huawei, start, end);
 	if (err)
 		return err;
 
@@ -515,16 +536,17 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t size)
 {
+	struct huawei_wmi *huawei = platform_get_drvdata(huawei_pdev);
 	int err, start, end;
 
-	err = huawei_wmi_battery_get(&start, NULL);
+	err = huawei_wmi_battery_get(huawei, &start, NULL);
 	if (err)
 		return err;
 
 	if (sscanf(buf, "%d", &end) != 1)
 		return -EINVAL;
 
-	err = huawei_wmi_battery_set(start, end);
+	err = huawei_wmi_battery_set(huawei, start, end);
 	if (err)
 		return err;
 
@@ -535,12 +557,13 @@ static ssize_t charge_control_thresholds_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t size)
 {
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
 	int err, start, end;
 
 	if (sscanf(buf, "%d %d", &start, &end) != 2)
 		return -EINVAL;
 
-	err = huawei_wmi_battery_set(start, end);
+	err = huawei_wmi_battery_set(huawei, start, end);
 	if (err)
 		return err;
 
@@ -585,7 +608,7 @@ static void huawei_wmi_battery_setup(struct device *dev)
 	struct huawei_wmi *huawei = dev_get_drvdata(dev);
 
 	huawei->battery_available = true;
-	if (huawei_wmi_battery_get(NULL, NULL)) {
+	if (huawei_wmi_battery_get(huawei, NULL, NULL)) {
 		huawei->battery_available = false;
 		return;
 	}
@@ -694,7 +717,7 @@ static int huawei_acpi_fn_lock_set(int on)
 	return 0;
 }
 
-static int huawei_wmi_fn_lock_get(int *on)
+static int huawei_wmi_fn_lock_get(struct huawei_wmi *huawei, int *on)
 {
 	u8 data[0xff];
 	int len;
@@ -702,8 +725,8 @@ static int huawei_wmi_fn_lock_get(int *on)
 	if (acpi_has_method(NULL, "\\GFRS"))
 		return huawei_acpi_fn_lock_get(on);
 
-	scoped_guard(mutex, &huawei_wmi->wmi_lock)
-		len = huawei_wmi_cmd(huawei_wmi, FN_LOCK_GET, data, sizeof(data));
+	scoped_guard(mutex, &huawei->wmi_lock)
+		len = huawei_wmi_cmd(huawei, FN_LOCK_GET, data, sizeof(data));
 	if (len < 0)
 		return len;
 	if (!len)
@@ -719,7 +742,7 @@ static int huawei_wmi_fn_lock_get(int *on)
 	return 0;
 }
 
-static int huawei_wmi_fn_lock_set(int on)
+static int huawei_wmi_fn_lock_set(struct huawei_wmi *huawei, int on)
 {
 	union hwmi_arg arg;
 
@@ -731,8 +754,8 @@ static int huawei_wmi_fn_lock_set(int on)
 	arg.cmd = FN_LOCK_SET;
 	arg.args[2] = on + 1; // 0 undefined, 1 off, 2 on.
 
-	guard(mutex)(&huawei_wmi->wmi_lock);
-	return huawei_wmi_cmd(huawei_wmi, arg.cmd, NULL, 0);
+	guard(mutex)(&huawei->wmi_lock);
+	return huawei_wmi_cmd(huawei, arg.cmd, NULL, 0);
 }
 
 static ssize_t fn_lock_state_show(struct device *dev,
@@ -741,7 +764,7 @@ static ssize_t fn_lock_state_show(struct device *dev,
 {
 	int err, on;
 
-	err = huawei_wmi_fn_lock_get(&on);
+	err = huawei_wmi_fn_lock_get(dev_get_drvdata(dev), &on);
 	if (err)
 		return err;
 
@@ -758,7 +781,7 @@ static ssize_t fn_lock_state_store(struct device *dev,
 			on < 0 || on > 1)
 		return -EINVAL;
 
-	err = huawei_wmi_fn_lock_set(on);
+	err = huawei_wmi_fn_lock_set(dev_get_drvdata(dev), on);
 	if (err)
 		return err;
 
@@ -772,7 +795,7 @@ static void huawei_wmi_fn_lock_setup(struct device *dev)
 	struct huawei_wmi *huawei = dev_get_drvdata(dev);
 
 	huawei->fn_lock_available = true;
-	if (huawei_wmi_fn_lock_get(NULL)) {
+	if (huawei_wmi_fn_lock_get(huawei, NULL)) {
 		huawei->fn_lock_available = false;
 		return;
 	}
@@ -790,69 +813,26 @@ static void huawei_wmi_fn_lock_exit(struct device *dev)
 
 /* debugfs */
 
-static void huawei_wmi_debugfs_call_dump(struct seq_file *m, void *data,
-		union acpi_object *obj)
-{
-	struct huawei_wmi *huawei = m->private;
-	int i;
-
-	switch (obj->type) {
-	case ACPI_TYPE_INTEGER:
-		seq_printf(m, "0x%llx", obj->integer.value);
-		break;
-	case ACPI_TYPE_STRING:
-		seq_printf(m, "\"%.*s\"", obj->string.length, obj->string.pointer);
-		break;
-	case ACPI_TYPE_BUFFER:
-		seq_puts(m, "{");
-		for (i = 0; i < obj->buffer.length; i++) {
-			seq_printf(m, "0x%02x", obj->buffer.pointer[i]);
-			if (i < obj->buffer.length - 1)
-				seq_puts(m, ",");
-		}
-		seq_puts(m, "}");
-		break;
-	case ACPI_TYPE_PACKAGE:
-		seq_puts(m, "[");
-		for (i = 0; i < obj->package.count; i++) {
-			huawei_wmi_debugfs_call_dump(m, huawei, &obj->package.elements[i]);
-			if (i < obj->package.count - 1)
-				seq_puts(m, ",");
-		}
-		seq_puts(m, "]");
-		break;
-	default:
-		dev_err(huawei->dev, "Unexpected obj type, got %d\n", obj->type);
-		return;
-	}
-}
-
-/* The raw debugfs dump also prints the original ACPI object types. */
-static acpi_status huawei_wmi_debugfs_call(struct huawei_wmi *huawei,
-					   struct acpi_buffer *in, struct acpi_buffer *out)
-{
-	guard(mutex)(&huawei->wmi_lock);
-	return wmidev_evaluate_method(huawei->wdev, 0, 1, in, out);
-}
-
 static int huawei_wmi_debugfs_call_show(struct seq_file *m, void *data)
 {
 	struct huawei_wmi *huawei = m->private;
-	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
-	struct acpi_buffer in;
-
-	in.length = sizeof(u64);
-	in.pointer = &huawei->debug.arg;
+	u64 arg = READ_ONCE(huawei->debug.arg);
+	struct wmi_buffer in = { .length = sizeof(arg), .data = &arg };
+	struct wmi_buffer out;
+	int err;
 
-	if (ACPI_FAILURE(huawei_wmi_debugfs_call(huawei, &in, &out)))
-		return -ENODEV;
+	scoped_guard(mutex, &huawei->wmi_lock)
+		err = wmidev_invoke_method(huawei->wdev, 0, 1, &in, &out, 0);
+	if (err)
+		return err;
 
-	union acpi_object *obj __free(kfree) = out.pointer;
+	u8 *bytes __free(kfree) = out.data;
 
-	if (!obj)
-		return -EIO;
+	seq_putc(m, '{');
+	for (size_t i = 0; i < out.length; i++)
+		seq_printf(m, "%s0x%02x", i ? "," : "", bytes[i]);
+	seq_putc(m, '}');
 
-	huawei_wmi_debugfs_call_dump(m, huawei, obj);
 	return 0;
 }
 
@@ -874,58 +854,122 @@ static void huawei_wmi_debugfs_exit(struct device *dev)
 {
 	struct huawei_wmi *huawei = dev_get_drvdata(dev);
 
-	debugfs_remove_recursive(huawei->debug.root);
+	debugfs_remove(huawei->debug.root);
 }
 
 /* Input */
 
-static void huawei_wmi_process_key(struct input_dev *idev, int code)
+/* WMI0 reports 0x80 and provides the actual scancode in a sibling data block. */
+struct huawei_wmi_keycode {
+	struct wmi_device *event;
+	u32 code;
+};
+
+struct huawei_wmi_keyblock {
+	struct wmi_device *wdev;
+	struct notifier_block notifier;
+};
+
+static int huawei_wmi_query_keycode(struct notifier_block *nb, unsigned long action, void *data)
 {
-	const struct key_entry *key;
-	struct device *profile_dev;
+	struct huawei_wmi_keyblock *block = container_of(nb, struct huawei_wmi_keyblock, notifier);
+	struct huawei_wmi_keycode *key = data;
+	struct wmi_buffer out;
 
-	/*
-	 * WMI0 uses code 0x80 to indicate a hotkey event.
-	 * The actual key is fetched from the method WQ00
-	 * using WMI0_EXPENSIVE_GUID.
-	 */
-	if (code == 0x80) {
-		struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
-		union acpi_object *obj;
-		acpi_status status;
+	if (block->wdev->dev.parent != key->event->dev.parent)
+		return NOTIFY_DONE;
 
-		status = wmi_query_block(WMI0_EXPENSIVE_GUID, 0, &response);
-		if (ACPI_FAILURE(status))
-			return;
+	if (wmidev_query_block(block->wdev, 0, &out, sizeof(__le32)))
+		return NOTIFY_BAD;
 
-		obj = (union acpi_object *)response.pointer;
-		if (obj && obj->type == ACPI_TYPE_INTEGER)
-			code = obj->integer.value;
+	u8 *buf __free(kfree) = out.data;
 
-		kfree(response.pointer);
-	}
+	key->code = le32_to_cpup((const __le32 *)buf);
+	return NOTIFY_STOP;
+}
+
+static int huawei_wmi_keyblock_probe(struct wmi_device *wdev, const void *context)
+{
+	struct huawei_wmi_keyblock *block;
+
+	block = devm_kzalloc(&wdev->dev, sizeof(*block), GFP_KERNEL);
+	if (!block)
+		return -ENOMEM;
+
+	block->wdev = wdev;
+	block->notifier.notifier_call = huawei_wmi_query_keycode;
+	dev_set_drvdata(&wdev->dev, block);
+
+	return blocking_notifier_chain_register(&huawei_wmi_keycode_chain, &block->notifier);
+}
+
+static void huawei_wmi_keyblock_remove(struct wmi_device *wdev)
+{
+	struct huawei_wmi_keyblock *block = dev_get_drvdata(&wdev->dev);
+
+	blocking_notifier_chain_unregister(&huawei_wmi_keycode_chain, &block->notifier);
+}
+
+static const struct wmi_device_id huawei_wmi_keyblock_ids[] = {
+	{ WMI0_EXPENSIVE_GUID },
+	{}
+};
+MODULE_DEVICE_TABLE(wmi, huawei_wmi_keyblock_ids);
+
+static struct wmi_driver huawei_wmi_keyblock_driver = {
+	.driver.name = "huawei-wmi-keyblock",
+	.id_table = huawei_wmi_keyblock_ids,
+	.probe = huawei_wmi_keyblock_probe,
+	.remove = huawei_wmi_keyblock_remove,
+	.no_singleton = true,
+};
+
+static int huawei_wmi_profile_event(struct notifier_block *nb, unsigned long code, void *data)
+{
+	struct huawei_wmi *huawei = container_of(nb, struct huawei_wmi, profile_notifier);
+	struct device *profile_dev;
 
 	switch (code) {
-	case 0x2a0: // firmware report turbo closed
-	case 0x2a1: // firmware report turbo enabled
-		{
-			guard(mutex)(&huawei_wmi->wmi_lock);
-
-			if (huawei_wmi->reported_profile == PLATFORM_PROFILE_LAST)
-				break;
-			huawei_wmi->reported_profile = code == 0x2a0 ?
+	case 0x2a0: /* Firmware disabled Turbo. */
+	case 0x2a1: /* Firmware enabled Turbo. */
+		scoped_guard(mutex, &huawei->wmi_lock) {
+			if (huawei->reported_profile == PLATFORM_PROFILE_LAST)
+				return NOTIFY_DONE;
+			huawei->reported_profile = code == 0x2a0 ?
 				PLATFORM_PROFILE_BALANCED : PLATFORM_PROFILE_PERFORMANCE;
-			profile_dev = huawei_wmi->profile_dev;
+			profile_dev = huawei->profile_dev;
 		}
 		if (profile_dev)
 			platform_profile_notify(profile_dev);
-		return;
-	case 0x2a6: // firmware reject your profile change request
-		if (huawei_wmi_profile_sync(huawei_wmi))
-			return;
+		return NOTIFY_STOP;
+	case 0x2a5: /* TBF2-restricted transition; re-read the firmware mode. */
+	case 0x2a6: /* Firmware rejected the request without reporting a mode. */
+		if (huawei_wmi_profile_sync(huawei))
+			return NOTIFY_STOP;
 		break;
 	}
 
+	return NOTIFY_DONE;
+}
+
+static void huawei_wmi_input_notify(struct wmi_device *wdev, const struct wmi_buffer *data)
+{
+	struct input_dev *idev = dev_get_drvdata(&wdev->dev);
+	u32 code = le32_to_cpup(data->data);
+	const struct key_entry *key;
+
+	if (code == 0x80) {
+		struct huawei_wmi_keycode keycode = { .event = wdev };
+
+		if (blocking_notifier_call_chain(&huawei_wmi_keycode_chain, 0, &keycode) !=
+		    NOTIFY_STOP)
+			return;
+		code = keycode.code;
+	}
+
+	if (blocking_notifier_call_chain(&huawei_wmi_profile_chain, code, NULL) == NOTIFY_STOP)
+		return;
+
 	key = sparse_keymap_entry_from_scancode(idev, code);
 	if (!key) {
 		dev_info(&idev->dev, "Unknown key pressed, code: 0x%04x\n", code);
@@ -933,164 +977,106 @@ static void huawei_wmi_process_key(struct input_dev *idev, int code)
 	}
 
 	if (quirks && !quirks->report_brightness &&
-			(key->sw.code == KEY_BRIGHTNESSDOWN ||
-			key->sw.code == KEY_BRIGHTNESSUP))
+	    (key->sw.code == KEY_BRIGHTNESSDOWN || key->sw.code == KEY_BRIGHTNESSUP))
 		return;
 
 	sparse_keymap_report_entry(idev, key, 1, true);
 }
 
-static void huawei_wmi_input_notify(union acpi_object *obj, void *context)
-{
-	struct input_dev *idev = (struct input_dev *)context;
-
-	if (obj && obj->type == ACPI_TYPE_INTEGER)
-		huawei_wmi_process_key(idev, obj->integer.value);
-	else
-		dev_err(&idev->dev, "Bad response type\n");
-}
-
-static int huawei_wmi_input_setup(struct device *dev, const char *guid)
+static int huawei_wmi_input_probe(struct wmi_device *wdev, const void *context)
 {
 	struct input_dev *idev;
-	acpi_status status;
 	int err;
 
-	idev = devm_input_allocate_device(dev);
+	idev = input_allocate_device();
 	if (!idev)
 		return -ENOMEM;
 
 	idev->name = "Huawei WMI hotkeys";
 	idev->phys = "wmi/input0";
 	idev->id.bustype = BUS_HOST;
-	idev->dev.parent = dev;
+	idev->dev.parent = &huawei_pdev->dev;
 
 	err = sparse_keymap_setup(idev, huawei_wmi_keymap, NULL);
-	if (err)
-		return err;
-
-	err = input_register_device(idev);
-	if (err)
+	if (!err)
+		err = input_register_device(idev);
+	if (err) {
+		input_free_device(idev);
 		return err;
+	}
 
-	status = wmi_install_notify_handler(guid, huawei_wmi_input_notify, idev);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
+	dev_set_drvdata(&wdev->dev, idev);
 	return 0;
 }
 
-static void huawei_wmi_input_exit(struct device *dev, const char *guid)
+static void huawei_wmi_input_remove(struct wmi_device *wdev)
 {
-	wmi_remove_notify_handler(guid);
+	input_unregister_device(dev_get_drvdata(&wdev->dev));
 }
 
-/* Huawei driver */
-
-static const struct wmi_device_id huawei_wmi_events_id_table[] = {
-	{ .guid_string = WMI0_EVENT_GUID },
-	{ .guid_string = HWMI_EVENT_GUID },
-	{  }
+static const struct wmi_device_id huawei_wmi_event_ids[] = {
+	{ WMI0_EVENT_GUID },
+	{ HWMI_EVENT_GUID },
+	{}
+};
+MODULE_DEVICE_TABLE(wmi, huawei_wmi_event_ids);
+
+static struct wmi_driver huawei_wmi_event_driver = {
+	.driver.name = "huawei-wmi-events",
+	.id_table = huawei_wmi_event_ids,
+	.probe = huawei_wmi_input_probe,
+	.remove = huawei_wmi_input_remove,
+	.notify_new = huawei_wmi_input_notify,
+	.min_event_size = sizeof(__le32),
+	.no_singleton = true,
 };
 
-static int huawei_wmi_probe(struct platform_device *pdev)
+/* The method device supplies the laptop-wide controls on the platform device. */
+static int huawei_wmi_method_probe(struct wmi_device *wdev, const void *context)
 {
-	const struct wmi_device_id *guid;
-	struct wmi_device **method = dev_get_platdata(&pdev->dev);
+	struct device *dev = &huawei_pdev->dev;
+	struct huawei_wmi *huawei;
 	int err;
 
-	huawei_wmi = devm_kzalloc(&pdev->dev, sizeof(*huawei_wmi), GFP_KERNEL);
-	if (!huawei_wmi)
+	huawei = devm_kzalloc(&wdev->dev, sizeof(*huawei), GFP_KERNEL);
+	if (!huawei)
 		return -ENOMEM;
 
-	huawei_wmi->wdev = method ? *method : NULL;
-	platform_set_drvdata(pdev, huawei_wmi);
-	huawei_wmi->dev = &pdev->dev;
-	mutex_init(&huawei_wmi->wmi_lock);
-	huawei_wmi->reported_profile = PLATFORM_PROFILE_LAST;
-
-	for (guid = huawei_wmi_events_id_table; *guid->guid_string; guid++) {
-		if (!wmi_has_guid(guid->guid_string))
-			continue;
-
-		err = huawei_wmi_input_setup(&pdev->dev, guid->guid_string);
-		if (!err)
-			continue;
-
-		dev_err(&pdev->dev, "Failed to setup input on %s\n", guid->guid_string);
-		while (guid != huawei_wmi_events_id_table) {
-			guid--;
-			if (wmi_has_guid(guid->guid_string))
-				huawei_wmi_input_exit(&pdev->dev, guid->guid_string);
-		}
+	huawei->wdev = wdev;
+	huawei->dev = dev;
+	mutex_init(&huawei->wmi_lock);
+	huawei->reported_profile = PLATFORM_PROFILE_LAST;
+	huawei->profile_notifier.notifier_call = huawei_wmi_profile_event;
+	err = blocking_notifier_chain_register(&huawei_wmi_profile_chain,
+					       &huawei->profile_notifier);
+	if (err)
 		return err;
-	}
-
-	if (huawei_wmi->wdev) {
-		huawei_wmi_leds_setup(&pdev->dev);
-		huawei_wmi_fn_lock_setup(&pdev->dev);
-		huawei_wmi_battery_setup(&pdev->dev);
-		huawei_wmi_debugfs_setup(&pdev->dev);
-		huawei_wmi_profile_setup(huawei_wmi);
-	}
 
-	return 0;
-}
-
-static void huawei_wmi_remove(struct platform_device *pdev)
-{
-	const struct wmi_device_id *guid = huawei_wmi_events_id_table;
-
-	while (*guid->guid_string) {
-		if (wmi_has_guid(guid->guid_string))
-			huawei_wmi_input_exit(&pdev->dev, guid->guid_string);
-
-		guid++;
-	}
-
-	huawei_wmi_profile_exit(huawei_wmi);
-	if (huawei_wmi->wdev) {
-		huawei_wmi_debugfs_exit(&pdev->dev);
-		huawei_wmi_battery_exit(&pdev->dev);
-		huawei_wmi_fn_lock_exit(&pdev->dev);
-	}
-}
-
-static struct platform_driver huawei_wmi_driver = {
-	.driver = {
-		.name = "huawei-wmi",
-	},
-	.probe = huawei_wmi_probe,
-	.remove = huawei_wmi_remove,
-};
-
-/*
- * Keep the platform device and its existing userspace paths on both
- * method-capable and older event-only machines.
- */
-static struct platform_device *legacy_pdev;
-
-static int huawei_wmi_method_probe(struct wmi_device *wdev, const void *context)
-{
-	struct platform_device *pdev;
-
-	pdev = platform_device_register_data(NULL, "huawei-wmi", PLATFORM_DEVID_NONE,
-					     &wdev, sizeof(wdev));
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	dev_set_drvdata(&wdev->dev, pdev);
+	dev_set_drvdata(&wdev->dev, huawei);
+	platform_set_drvdata(huawei_pdev, huawei);
+	huawei_wmi_leds_setup(dev);
+	huawei_wmi_fn_lock_setup(dev);
+	huawei_wmi_battery_setup(dev);
+	huawei_wmi_debugfs_setup(dev);
+	huawei_wmi_profile_setup(huawei);
 	return 0;
 }
 
 static void huawei_wmi_method_remove(struct wmi_device *wdev)
 {
-	platform_device_unregister(dev_get_drvdata(&wdev->dev));
+	struct huawei_wmi *huawei = dev_get_drvdata(&wdev->dev);
+
+	blocking_notifier_chain_unregister(&huawei_wmi_profile_chain, &huawei->profile_notifier);
+	huawei_wmi_profile_exit(huawei);
+	huawei_wmi_debugfs_exit(huawei->dev);
+	huawei_wmi_battery_exit(huawei->dev);
+	huawei_wmi_fn_lock_exit(huawei->dev);
+	platform_set_drvdata(huawei_pdev, NULL);
 }
 
 static const struct wmi_device_id huawei_wmi_method_ids[] = {
 	{ HWMI_METHOD_GUID },
-	{ }
+	{}
 };
 MODULE_DEVICE_TABLE(wmi, huawei_wmi_method_ids);
 
@@ -1101,48 +1087,74 @@ static struct wmi_driver huawei_wmi_method_driver = {
 	.remove = huawei_wmi_method_remove,
 };
 
-static __init int huawei_wmi_init(void)
+static int huawei_wmi_probe(struct platform_device *pdev)
+{
+	int err;
+
+	if (pdev != huawei_pdev)
+		return -ENODEV;
+
+	err = wmi_driver_register(&huawei_wmi_keyblock_driver);
+	if (err)
+		return err;
+
+	err = wmi_driver_register(&huawei_wmi_event_driver);
+	if (err) {
+		wmi_driver_unregister(&huawei_wmi_keyblock_driver);
+		return err;
+	}
+
+	/* Receive profile changes from the time the method driver takes its first sample. */
+	err = wmi_driver_register(&huawei_wmi_method_driver);
+	if (err) {
+		wmi_driver_unregister(&huawei_wmi_event_driver);
+		wmi_driver_unregister(&huawei_wmi_keyblock_driver);
+	}
+	return err;
+}
+
+static void huawei_wmi_remove(struct platform_device *pdev)
+{
+	wmi_driver_unregister(&huawei_wmi_event_driver);
+	wmi_driver_unregister(&huawei_wmi_method_driver);
+	wmi_driver_unregister(&huawei_wmi_keyblock_driver);
+}
+
+static struct platform_driver huawei_wmi_driver = {
+	.driver.name = "huawei-wmi",
+	.probe = huawei_wmi_probe,
+	.remove = huawei_wmi_remove,
+};
+
+static int __init huawei_wmi_init(void)
 {
 	int err;
 
-	quirks = &quirk_unknown;
 	dmi_check_system(huawei_quirks);
 	if (battery_reset != -1)
 		quirks->battery_reset = battery_reset;
 	if (report_brightness != -1)
 		quirks->report_brightness = report_brightness;
 
-	err = platform_driver_register(&huawei_wmi_driver);
-	if (err)
-		return err;
+	huawei_pdev = platform_device_register_simple("huawei-wmi", PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(huawei_pdev))
+		return PTR_ERR(huawei_pdev);
 
-	if (wmi_has_guid(HWMI_METHOD_GUID)) {
-		err = wmi_driver_register(&huawei_wmi_method_driver);
-	} else {
-		legacy_pdev = platform_device_register_simple("huawei-wmi", PLATFORM_DEVID_NONE,
-							      NULL, 0);
-		err = PTR_ERR_OR_ZERO(legacy_pdev);
-	}
+	err = platform_driver_register(&huawei_wmi_driver);
 	if (err)
-		platform_driver_unregister(&huawei_wmi_driver);
-
+		platform_device_unregister(huawei_pdev);
 	return err;
 }
 
-static __exit void huawei_wmi_exit(void)
+static void __exit huawei_wmi_exit(void)
 {
-	if (legacy_pdev)
-		platform_device_unregister(legacy_pdev);
-	else
-		wmi_driver_unregister(&huawei_wmi_method_driver);
-
 	platform_driver_unregister(&huawei_wmi_driver);
+	platform_device_unregister(huawei_pdev);
 }
 
 module_init(huawei_wmi_init);
 module_exit(huawei_wmi_exit);
 
-MODULE_DEVICE_TABLE(wmi, huawei_wmi_events_id_table);
 MODULE_AUTHOR("Ayman Bagabas <ayman.bagabas@gmail.com>");
 MODULE_DESCRIPTION("Huawei WMI laptop extras driver");
 MODULE_LICENSE("GPL v2");
