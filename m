Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810883D6CC9
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 22:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659480; cv=none; b=WMxU704pRrstCqHtKYKvYT00cLhtbl5SFzfTwLTQq8NsQxEKtKRmQifueGHNCLtlTc3ZgLFWbgpVPthdBWkG+STodYoKhPuAn3Nroiqbtf/1V5HOUB0vyqJdjsVfMPp5P6YeAicSqhK0jr8658kgFQd9nGovPu5odCR+Yftf5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659480; c=relaxed/simple;
	bh=xsQDYjfQm1eCxXVjzDCszXGmvYXCzlN4tkF8rFLYnPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcQynFy8f/KUz9uabWGuOzLAvtwMOEWt25OZ3xiTfLjPswo1ZZ9JdXBluUVuEcbobIpenK/BOy5E+Of7vwIpxY2Nm/WtQPCY8F6m199o/ytSvRa9mehSpR1f3G3+Fg1Cqz6L16PEySEHftS38YZqovGpw/uJQibfzQQ3n/VoaR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOlcwfBQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOlcwfBQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e04df8c46so291621b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 15:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786659477; x=1787264277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0RUKgI78wtLWKhEVRZgKOfPx5UGL6e83+wjMlqNKno=;
        b=AOlcwfBQW6aX0650cgruInboaYXd6v4L/IKYfTJ6B1VuVEAFAUlokI5154CfjCE914
         LfLnVgZj3FvCQMFJH8sUW3EZAqa3aYdLC0JLWtaIDVAaMwH5gNcsYdGB7O4y9mQ1AKMB
         7eG86HW+bMvuHHOtKVnEqUmtpnrCgqIaMBFl9/rLlrTNh8K1DVRnaLL++0aQpW59JBcR
         80JX8N4+dm78s+7HncqRwo46CPnCicgkjQP3CiSaiY5CkSAgbzauEvJBlTfGUNmr0NrJ
         VhZU6lG1fc1cMCHLK4jMk7L7xq0GpiTPgtvhISd+o3jyJjZpuRHKa1Rr4ASsn15jJJTV
         dHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786659477; x=1787264277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0RUKgI78wtLWKhEVRZgKOfPx5UGL6e83+wjMlqNKno=;
        b=XPNqDbBs93xILsS90oyP6SINTKlMvKzdkpOBX8SKiF0nXInh/DTTybzV2lFw0DsCSZ
         Azlr8cJOtBTqzCHUlQErdv3RSQyC5URAyo0ycG9fpzSCbtkPnOMzEAQg+/cj3V2ohRKj
         o6S2OxxVl+wXbijRJqrZwwiaHSUl7Iqa93lm36fLwdHkWjunKDlDu4a0uDtW/0QpxH8M
         rIpnUwgUzeqgoPKxOgQ5ZdTB+vLA11pgT4u/PxH8YjED6G7IZiKHfvUH1hQsq/2VwuHy
         Fxcug+Cm36bGH4+wmZ03once0cZzvHzgkWWq/FEKKHiMHk51SsYSnDtDIjQiY3/tBNn1
         B9mQ==
X-Gm-Message-State: AOJu0Ywqmwr7qG/XbySRe7aVr67/VYwCQtCepxvQfGmyoHW/er1ZPDJs
	z/vnfJX5pP/lqQakOoHzsOn2rlf/XLnEDsraOyr/8Efi10fk3b2oRqn2cH8FElW4
X-Gm-Gg: AR+sD10edQ6ab/bHzDqieywPqfNzhPlcMs4ND/IlKLKaV5uk0eHlKfSxYjuxTTDImT1
	WIJ/XACd4ua+5XZI0/4GYc1uPikcwAhnH6B5R958puhDT40kn+hltYtX5BrEVUgifWRq02/iNnI
	x8qKErHAloRjWwGos2NipyOss3/OQ1GH15x0hrxt+eqR9rvWjm5o08pltrj6+/wQO64yhrkoLwv
	lIF6TUiWv4u/NeCV6uHLV2OKXj/LbonvFmjKvO4sN7asZ3R6Patjq3FxOAoTGHBNCVSTyQ/tWqQ
	17AIMWW3/Q98hbkRZmy9TzjGHFQjgGymR14TaICJ+EzdIjft++MPz5n+huRXdFiNWCXTchqP/DL
	ToasM+l4QK+EnaBss+LJAfMAChOEBgIHi+ofZXIvW46rTpN7pa2Vc3HVT1xF+Vc9yRZH4GfbKBT
	05/6GthMqg3F7wSeuvU7tIX33J6ZXfntxb1a19T/s5azrXEGanR4jMoSs6GWQfyJSoW0wPG2REQ
	2n1KxwUETrXjCYcu3Q=
X-Received: by 2002:a05:6a20:7d9f:b0:3cc:3d08:da39 with SMTP id adf61e73a8af0-3cc714e62bbmr1286185637.0.1786659476717;
        Thu, 13 Aug 2026 15:17:56 -0700 (PDT)
Received: from sonic ([2804:18:167:9e8c:e6b5:fa0:d068:30e3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc667bfesm11463318eec.2.2026.08.13.15.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:17:56 -0700 (PDT)
From: Hilgad Montelo <hilgad.montelo@gmail.com>
To: kenneth.t.chan@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hilgad Montelo <hilgad.montelo@gmail.com>
Subject: [PATCH v2 2/3] platform/x86: panasonic-laptop: Add driver for CF-33 A1/A2 buttons (TBTN)
Date: Thu, 13 Aug 2026 19:17:43 -0300
Message-ID: <20260813221744.25668-3-hilgad.montelo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813221744.25668-1-hilgad.montelo@gmail.com>
References: <20260813221744.25668-1-hilgad.montelo@gmail.com>
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
index 0c0e4a6..93e6511 100644
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
@@ -961,6 +997,112 @@ static void acpi_pcc_hotkey_notify(acpi_handle handle, u32 event, void *data)
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
@@ -1221,4 +1363,28 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
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

