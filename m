Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65931339719
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 02:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786589862; cv=none; b=WWGJQyN5/PeTUIsSBQmOG8M79PxaSpJUI6gsq3F2jL3KZ6VtFRSULAwrBGliH9Dj1M7ml+gCB9Ply+anXz/zUlwWt+D6EEJKcncn4BpA9VN+j4FTUmRIxtQvNu86oHhTs+bsyjFZeLhv3aPG/Qs340v0WMIbuVJeh2CooudVlE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786589862; c=relaxed/simple;
	bh=+DG+ErOqL3MI1/uxM3oZ4HOBVJ5ceUMjv64DI0XGTqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrpAZH7tREEYWwaCgN7REMSh+pq0KGLKZmdAS4PLKg9CkKXXuql+l71+zwxqbz4lDN55wj6ECJaw4JkUkUjH/uFpNfqgv4CbEN6VYmEQhNdVMt5UvjoPklDoYa3o5dsLS/I4m2JQCoEO8/lNgerCTKb7OWN6VHmblGNS+QuZU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VomJEbsc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VomJEbsc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc73e322dbso3420595ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786589860; x=1787194660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPSVRVpAe9dkfC7tbQ9eQpuysvjIMyLxryqJQ4l+Z84=;
        b=VomJEbscW3B/BCk5ZJBKdbZNkEMJexNybVOx2+t36/pCieHlquw9zrpmXc0wbUkT18
         nxFrv6C1SuyAEBtmN4VA6hHrbd2mzxSsfTylsiKfbwN90SOhbxcXJJud2KUIe3g/RGmA
         fq07NovImW8FxTGB6e8bJxkP3fPI+EEwCL3Xxzf/OM7NRCWpUmXBUVj8DqsKo1j4Wkin
         QYZcD9q6646PkJ4/hzFIhrSbLGVcNdtNqMhQ2mkc43oBPjO0rkzo1Ooyvh6SVJFr1/bi
         0qX8jOYMXEC4bRfpihCeziRIKKwieytVie32FzUumXUDd/RAE8gUODh2XvpWSaZvTZVI
         l5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786589860; x=1787194660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WPSVRVpAe9dkfC7tbQ9eQpuysvjIMyLxryqJQ4l+Z84=;
        b=S/1x8jkQiQwYIMANyIt0ta7+5o+ycaoclscJMc1ldtoYN9f05LMF4qzu6Fi8gIoAO6
         VUz4JYlYweY/7XI7SYHNfQlc4pU5RkFzKFKDXgYJugdl8ysuZMk5KcG6u3w16G53vAUi
         zyxLx+6d5wWX4Tr0cnTvlRQ/PbgZYODuBiUPpE5qU+YUtCY08tAdoi181efkaKoWM0M4
         mn8kfvwqhMVZ1A0bCBPsHeLWgCGT40tIQuJw4mzvlks084ksyx8Gck6OEhyTqTQ/y+rb
         sYxI//OL6fPjtf5Wcv0lGGknyX54BWDTjKAK70VzNL+R29L6nHztfbtf5O4BEEEuvZUG
         67Kw==
X-Gm-Message-State: AOJu0Yys5dVyhHVrDGXdw8viJwhbWMINOQYVQ0xNxwJbh6d/UQVORzcy
	f7WxFY8Ak1G9us5Tw+bCaeSgF0zyD1M+QFcHV5hphv53WtNja7UGagso
X-Gm-Gg: AR+sD11hTDo9x+BaMSxchgpo6hnnhjQZL71Gsi+6AS7wpF7iGoKASC1tmFldMVgy3RI
	1MFvp8W6m3zo5YvPiE6Hc5vM88Ahp4LaLlqruyW6FLT+xyyJBry5Smp/r6tb1rcoyzgXiThPQOj
	gK5LUpgm9N7aHmm37cyv6zfKUbq9L6TlnwoojY+ilT0/WbBARojaIRBXkjOI0F8a5JUuIxHgb6C
	lHs4nxSY4aCkYLCjR3t+aQpwDeBkbmnKGA0xcFcz8CEYHjZwbYNps6l2lGFSgWZpuuYRH39PlZU
	td+VFXYw2lX8WxOdWO2KIAGwTSuOBjLEUcm6aoW858rFzeqCJF+IqZc9ej+0Igdu9yaD2yVnAgP
	e3GpZkOgSRemJ980d+fXnYKcp5BP2Yy7Rj9DOO2d+02wUMm1wvUyQOUy+DuffopLMj2bj0P7JOs
	C6Dskeic3onIzaIfVHmYoylcDEH/SYVJWWGhaW9fHcMxhdpsX07HVTM6SRBkXTDkJ+xE5OHVdeO
	2JBv89lWJmjuFaLdSOp
X-Received: by 2002:a05:6a21:7111:b0:3c3:af85:85e7 with SMTP id adf61e73a8af0-3cc55423424mr3821623637.34.1786589859561;
        Wed, 12 Aug 2026 19:57:39 -0700 (PDT)
Received: from sonic ([177.181.237.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebcf66340sm2097470eec.13.2026.08.12.19.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:57:38 -0700 (PDT)
From: Hilgad Montelo <hilgad.montelo@gmail.com>
To: Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hilgad Montelo <hilgad.montelo@gmail.com>
Subject: [PATCH 2/3] platform/x86: panasonic-laptop: Add driver for CF-33 A1/A2 buttons (TBTN)
Date: Wed, 12 Aug 2026 23:56:24 -0300
Message-ID: <20260813025626.24266-3-hilgad.montelo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813025626.24266-1-hilgad.montelo@gmail.com>
References: <20260813025626.24266-1-hilgad.montelo@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Panasonic Toughbook CF-33 the bezel A1/A2 buttons are wired to
a separate ACPI device, MAT003C (ACPI path \_SB.TBTN), rather than the
main Hotkey device (MAT0019/HKEY) this driver already talks to.
MAT003C was present in the ACPI namespace but had no driver bound to
it, so A1/A2 produced no signal through any channel: no evdev events,
no ACPI notify (nothing logged), no WMI device, and no correlated ACPI
GPE interrupt activity.

Found by dumping and disassembling the platform's ACPI tables
(acpidump -b + iasl -d) and searching for EC _Qxx query handlers that
push scancodes into a hotkey queue. TBTN turned out to implement its
own HINF/HIND/SQTY/SINF method quartet, structurally a clone of HKEY's:
_Qxx handlers call TBTN.HIND(code) then Notify(TBTN, 0x80); HINF()
dequeues one scancode from a small EC-side FIFO. Confirmed scancodes:
0x38/0x39 = A1 press/release, 0x42/0x43 = A2 press/release. Unlike
HKEY, TBTN's codes never set the high bit -- press and release are
distinct scancodes rather than one code plus an up/down flag.

TBTN.SQTY returns 1 (it has no brightness/battery data, just a
button-availability flag), so it cannot be probed via the existing
acpi_pcc_hotkey_probe(), which requires num_sifr > SINF_DC_CUR_BRIGHT
(assumes every device has the full brightness/eco-mode/battery SINF
block). Add a second, minimal platform_driver bound to MAT003C
instead, with its own small input device reporting KEY_PROG2 (A1) and
KEY_PROG3 (A2) -- both already carry standard XKB keysym mappings
(XF86Launch2/XF86Launch3), so no udev/hwdb work is needed for desktop
environments to bind them to actions.

Verified on a CF-33 Mk1: evtest shows clean KEY_PROG2/KEY_PROG3
press/release pairs with real physical timing; confirmed bindable as
GNOME custom shortcuts and launching applications correctly.

Signed-off-by: Hilgad Montelo <hilgad.montelo@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 168 +++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 730d7cb..0afd6b8 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -197,6 +197,42 @@ static const struct acpi_device_id pcc_device_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, pcc_device_ids);
 
+/*
+ * On the CF-33 the bezel A1/A2 buttons are wired to a separate ACPI device
+ * (MAT003C, ACPI path \_SB.TBTN) rather than the main Hotkey (MAT0019/HKEY)
+ * device the rest of this driver talks to. TBTN implements its own
+ * HINF/HIND/SQTY/SINF method quartet, structurally a clone of HKEY's, but
+ * SQTY only reports a single SIFR element (a button-availability flag) --
+ * it has none of HKEY's brightness/battery/backlight state, so it can't be
+ * probed via acpi_pcc_hotkey_probe(), which requires the full SINF block.
+ * Register a second, minimal platform_driver for it instead.
+ */
+#define METHOD_TBTN_QUERY	"HINF"
+#define TBTN_NOTIFY		0x80
+
+static const struct acpi_device_id tbtn_device_ids[] = {
+	{ "MAT003C", 0},
+	{ "", 0},
+};
+MODULE_DEVICE_TABLE(acpi, tbtn_device_ids);
+
+struct tbtn_acpi {
+	acpi_handle		handle;
+	struct input_dev	*input_dev;
+};
+
+static int tbtn_probe(struct platform_device *pdev);
+static void tbtn_remove(struct platform_device *pdev);
+
+static struct platform_driver acpi_tbtn_driver = {
+	.probe = tbtn_probe,
+	.remove = tbtn_remove,
+	.driver = {
+		.name = "Panasonic Tablet Buttons",
+		.acpi_match_table = tbtn_device_ids,
+	},
+};
+
 #ifdef CONFIG_PM_SLEEP
 static int acpi_pcc_hotkey_resume(struct device *dev);
 #endif
@@ -951,6 +987,112 @@ static void acpi_pcc_hotkey_notify(acpi_handle handle, u32 event, void *data)
 	}
 }
 
+/*
+ * TBTN's HINF dequeues one raw scancode from a small EC-side FIFO (0 if
+ * empty) and re-Notify()s itself if more than one entry was pending, so a
+ * single evaluate-and-report per notification is sufficient here -- unlike
+ * HKEY, TBTN's codes never set the high bit, since press and release are
+ * distinct scancodes rather than one code plus an up/down flag.
+ */
+static void tbtn_report_key(struct tbtn_acpi *tbtn, unsigned int code)
+{
+	static const struct {
+		unsigned int code;
+		unsigned int keycode;
+		bool down;
+	} keymap[] = {
+		{ 0x38, KEY_PROG2, true },  /* A1 press */
+		{ 0x39, KEY_PROG2, false }, /* A1 release */
+		{ 0x42, KEY_PROG3, true },  /* A2 press */
+		{ 0x43, KEY_PROG3, false }, /* A2 release */
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(keymap); i++) {
+		if (keymap[i].code != code)
+			continue;
+		input_report_key(tbtn->input_dev, keymap[i].keycode, keymap[i].down);
+		input_sync(tbtn->input_dev);
+		return;
+	}
+
+	pr_info("Unknown TBTN hotkey event: 0x%02x\n", code);
+}
+
+static void tbtn_notify(acpi_handle handle, u32 event, void *data)
+{
+	struct tbtn_acpi *tbtn = data;
+	unsigned long long result;
+	acpi_status status;
+
+	if (event != TBTN_NOTIFY)
+		return;
+
+	status = acpi_evaluate_integer(tbtn->handle, METHOD_TBTN_QUERY,
+				       NULL, &result);
+	if (ACPI_FAILURE(status)) {
+		pr_err("TBTN: error getting hotkey status\n");
+		return;
+	}
+
+	if (result)
+		tbtn_report_key(tbtn, result);
+}
+
+static int tbtn_probe(struct platform_device *pdev)
+{
+	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
+	struct tbtn_acpi *tbtn;
+	struct input_dev *input_dev;
+	int error;
+
+	if (!device)
+		return -ENODEV;
+
+	tbtn = devm_kzalloc(&pdev->dev, sizeof(*tbtn), GFP_KERNEL);
+	if (!tbtn)
+		return -ENOMEM;
+
+	tbtn->handle = device->handle;
+	device->driver_data = tbtn;
+
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	input_dev->name = "Panasonic Tablet Buttons";
+	input_dev->phys = "panasonic/tbtn0";
+	input_dev->id.bustype = BUS_HOST;
+	input_dev->id.vendor = 0x0001;
+	input_dev->id.product = 0x0002;
+	input_dev->id.version = 0x0100;
+	input_set_capability(input_dev, EV_KEY, KEY_PROG2);
+	input_set_capability(input_dev, EV_KEY, KEY_PROG3);
+
+	error = input_register_device(input_dev);
+	if (error) {
+		pr_err("TBTN: unable to register input device\n");
+		return error;
+	}
+
+	tbtn->input_dev = input_dev;
+
+	error = acpi_dev_install_notify_handler(device, ACPI_DEVICE_NOTIFY,
+						tbtn_notify, tbtn);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static void tbtn_remove(struct platform_device *pdev)
+{
+	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
+
+	acpi_dev_remove_notify_handler(device, ACPI_DEVICE_NOTIFY, tbtn_notify);
+	device->driver_data = NULL;
+}
+
 static void pcc_optd_notify(acpi_handle handle, u32 event, void *data)
 {
 	if (event != ACPI_NOTIFY_EJECT_REQUEST)
@@ -1211,4 +1353,28 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
 	kfree(pcc);
 }
 
-module_platform_driver(acpi_pcc_driver);
+static int __init panasonic_module_init(void)
+{
+	int error;
+
+	error = platform_driver_register(&acpi_pcc_driver);
+	if (error)
+		return error;
+
+	error = platform_driver_register(&acpi_tbtn_driver);
+	if (error) {
+		platform_driver_unregister(&acpi_pcc_driver);
+		return error;
+	}
+
+	return 0;
+}
+
+static void __exit panasonic_module_exit(void)
+{
+	platform_driver_unregister(&acpi_tbtn_driver);
+	platform_driver_unregister(&acpi_pcc_driver);
+}
+
+module_init(panasonic_module_init);
+module_exit(panasonic_module_exit);
-- 
2.53.0

