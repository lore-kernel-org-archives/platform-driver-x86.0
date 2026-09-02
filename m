Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5B435F8C5
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 01:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314007; cv=none; b=FOnZcJyChNqxQAtnMTcSU9t96Ic+Xybx6g4BdE/eWUClZPQNbRIg7u5Hrq/xAfWgb/TeKBhPTni3htiQ8NvloODDZpb6uXnIn039ODGy3bkm9/Zcgtknf1EGCvcb9NbhQDJnXM9WrhW8hi8voFxY/Uo9/3G+xmDIiiOuWeyo4Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314007; c=relaxed/simple;
	bh=U1WmY9roIWOAlngME8p/4681it92uLDHXzUx3irgDl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qiF5bGJfciinfF1xVzebfwwrFstGXRlZOZ50dL5x5I9qgl78If0bAVdlm0Fd7O6iED8MaoUBT0qeuLzYhhxQndnZg2imE6I6ivQhYgj/QZrGa/sV8beJ/dB0vhINgYjlN1hEqZEmQ5AT6t0ogiWfoSlJFsDJKXJEuk+bogBjVHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzwMFyM0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzwMFyM0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-382ef647e20so638683a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Sep 2026 18:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788313996; x=1788918796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvVGub2hsicLqXSI/3c3voFU7S2m/xG+KP69Hl1dWlU=;
        b=gzwMFyM01r8Ei2Bwfp0NMXyEDu4TGNiLEJqXC2AlKwes4mRKvVYYjxgD2BTUyALOyB
         kv241d+c2QMUMB8DCx65pQZn1K0Y2aCmH4lJrMnN+vcja1CgQWj0HOCweB+FnZpTnLtR
         BCxJsByJFP+8NTHYwqqKGxEJByFtXj5Wmy/rZiydCfWNx45EQIrszeZPzxqAJ/s3c966
         Tk2Sl/HiSrkfN3vKf5PrCJ3GN53cTvwbsy+LM2KSE6loI4WfzLSeeu0p7OFpTyFLE9/U
         Sdrfizb1AkWbwmXzSa67a8HnjFzHefZNl+Qr7kMg88ZhWexf/mTAy3ARJf9pj4hjya0C
         j4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313996; x=1788918796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvVGub2hsicLqXSI/3c3voFU7S2m/xG+KP69Hl1dWlU=;
        b=KDJ2FTJCDTVCWlV8JC5PTYNtnhj+IcOu+zJ0mBZTdK6U0wSL9Gx96CFCQKm8YuQ38Z
         IP1rliQBPfWAVK3A5Uq+f2dmvqLT73iwYv6LK6eMVHa/rMdQBOxkWWnZ6kGA0lYQY9fA
         o5QKhU1asjsim9KcJaSPmOkHfO4nq3JbvL14/Cu54gJ7xshX8jATN3/PP/G0AGG1tCIX
         kwDl3yuIA1AaihRy45LKFHvq6J4uGKmWkkv6URI9DUMpd1Tb7X3av0rbCE1eAKatSwMz
         kEdDoL+jWfgwH+a4cSCKzv9AbWa7FnVEJX7U2oemy5AvdYYDTd2PxVV/afT1WgpWmfMh
         ejqA==
X-Forwarded-Encrypted: i=1; AKwUvBzBa36XfvkJ9tJlDTGLHAjPbUFmoRmHFGRmxxNO4EaiUoe8Ld1KCBkQ1uZXJNryxW6JIGorA/nNnYEKRN3EDBxHV6AC@vger.kernel.org
X-Gm-Message-State: AFuF++n23N7TxfhrFRD3VMfKRaFfW34eXcPLn/8bKDnbbbFAKejJzQ1J
	hbb88evCRsy7mWBFNnZ1dl6kGMibOUjX/FE0W3P0knwpbNfEHMg9UtPP
X-Gm-Gg: AYBFou3V+hWv3UeD4csboj80vo5PRkcZ6ymuHCKUes5UG6gpewp+Cj83DhIsLXbpZ84
	TjfVstt94Bb4THfVbPKgEtuWDQo0rBuOSZfgPlYzGbWtJTvC9RtdL2VUwt7N8Uk10NLMKoem4jU
	PwRrx1MrEo4sG9g03yuDOCIDMGk0v44VRH7DJ8lP1GZfwYrmQtOIQSzIVqjAQGs553VKATYq/rG
	s5VwXcAhHK5Z5d2byNCa7EeBA4+FU6jo+JlbQyvn7YhhzY3KHTAsgeZKmtevLfH/7jQqy+eRcYt
	qDT9GEsXa1VmWVrrkYkhyePf86oJDouRFT3ktsrl9qfNWYOaljF6BkNmlIwXxthG1aQEyK6S3RD
	KluSpBTTQH5VbYdBC7jsYut174Ofz0LR+3DSze3zOimHkwPiJ6wYQEbOs+yo3kqA9y58Goyeh5Z
	X8oqUAPwWwj7VwOU/1fFwgElbp+leRun788U/ZqjpbMPcznKAGMew=
X-Received: by 2002:a17:90b:46:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-39aedbfe60amr2194340a91.0.1788313994349;
        Tue, 01 Sep 2026 18:53:14 -0700 (PDT)
Received: from mizar ([182.10.129.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d76622csm8861666a91.11.2026.09.01.18.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:53:13 -0700 (PDT)
From: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Idotoho Reimon Simanjuntak <idotohors@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: fix FA401 series keyboard sleep strobe
Date: Wed,  2 Sep 2026 08:52:55 +0700
Message-ID: <20260902015256.23434-1-idotohors@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FA401 series accepts the TUF keyboard RGB power-state command but does
not advertise the device through the normal DSTS presence probe. Register
the state attributes for this series and re-assert keyboard brightness in
the PM prepare callback so the EC enters S0ix with the correct state.

Without the brightness re-assertion, the display server blanks the keyboard
before the kernel suspend path runs, leaving the EC with brightness=0 and
preventing the sleep strobe from activating. Because kbd_led_wk may already
be zeroed by the display server at prepare time, always re-assert level 3
(max) brightness; the sleep strobe requires a non-zero brightness to
activate.

Use a quirk flag (kbd_rgb_state_quirk) set via DMI match table rather than
ad-hoc dmi_match() calls. Use the standard dev_pm_ops .prepare callback
rather than overloading the Ally-specific LPS0 ops. Define self-documenting
macros for the TUF RGB state bitfields at file scope.

Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 14 ++++++++++
 drivers/platform/x86/asus-wmi.c    | 43 +++++++++++++++++++++++++++++-
 drivers/platform/x86/asus-wmi.h    |  1 +
 3 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b16..fb06013ca 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -155,6 +155,11 @@ static struct quirk_entry quirk_asus_z13 = {
 	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
 };
 
+static struct quirk_entry quirk_asus_fa401 = {
+	.wapf = 0,
+	.kbd_rgb_state_quirk = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -163,6 +168,15 @@ static int dmi_matched(const struct dmi_system_id *dmi)
 }
 
 static const struct dmi_system_id asus_quirks[] = {
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. FA401",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "FA401"),
+		},
+		.driver_data = &quirk_asus_fa401,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. Q500A",
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a65090429..8d7c9e8bd 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -129,6 +129,14 @@ module_param(fnlock_default, bool, 0444);
 #define ASUS_SCREENPAD_BRIGHT_MAX 255
 #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
 
+/* TUF RGB power state bitfields for DEVS(ASUS_WMI_DEVID_TUF_RGB_STATE) */
+#define TUF_RGB_STATE_CMD		0xbd
+#define TUF_RGB_STATE_SAVE		BIT(8)
+#define TUF_RGB_STATE_BOOT		(0x03 << 16)
+#define TUF_RGB_STATE_AWAKE		(0x0c << 16)
+#define TUF_RGB_STATE_SLEEP		(0x30 << 16)
+#define TUF_RGB_STATE_KEYBOARD		(0xc0 << 16)
+
 #define ASUS_MINI_LED_MODE_MASK		0x03
 /* Standard modes for devices with only on/off */
 #define ASUS_MINI_LED_OFF		0x00
@@ -5153,7 +5161,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
-	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
@@ -5166,6 +5173,15 @@ static int asus_wmi_add(struct platform_device *pdev)
 		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX_VIVO;
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
+	/*
+	 * FA401 series accepts the TUF RGB-state DEVS command but does not
+	 * advertise the device through DSTS. Keep the normal DSTS probe for
+	 * other models and force registration when the quirk is set.
+	 */
+	asus->kbd_rgb_state_available =
+		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE) ||
+		asus->driver->quirks->kbd_rgb_state_quirk;
+
 	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
@@ -5396,11 +5412,36 @@ static int asus_hotk_restore(struct device *device)
 
 static int asus_hotk_prepare(struct device *device)
 {
+	struct asus_wmi *asus = dev_get_drvdata(device);
+
 	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
 		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
 					   ASUS_USB0_PWR_EC0_CSEE_OFF);
 		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
 	}
+
+	/*
+	 * The display server may blank the keyboard backlight before the
+	 * kernel suspend path runs. Re-assert brightness and power-state
+	 * flags so the EC enters S0ix with the correct state. Always use
+	 * level 3 (max) because kbd_led_wk may already be zeroed by the
+	 * display server at this point, and the sleep strobe requires a
+	 * non-zero brightness to activate.
+	 */
+	if (asus && asus->driver->quirks->kbd_rgb_state_quirk &&
+	    asus->kbd_rgb_state_available) {
+		u8 brightness = 0x80 | 0x03; /* level 3 (max) + light-on bit */
+
+		asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT,
+				      brightness, NULL);
+		asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
+					  ASUS_WMI_DEVID_TUF_RGB_STATE,
+					  TUF_RGB_STATE_CMD | TUF_RGB_STATE_SAVE |
+					  TUF_RGB_STATE_BOOT | TUF_RGB_STATE_AWAKE |
+					  TUF_RGB_STATE_SLEEP | TUF_RGB_STATE_KEYBOARD,
+					  0, NULL);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5cd4392b9..69d224774 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -52,6 +52,7 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	bool kbd_rgb_state_quirk;
 };
 
 struct asus_wmi_driver {
-- 
2.55.0


