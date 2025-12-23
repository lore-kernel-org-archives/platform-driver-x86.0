Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51392566F5
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766504728; cv=none; b=WKRoIfNb76OnkC4gkfN00zyZvgIOi6rkh95KJMqPO3EwS/fLehJsZW1bv/8wMIyqjyCAE5Yub6jPfFGiCtJoYEVhw5w742oH2JKgPyULP8UiXMosbfANzba+9ISoEVZP6Pb49lPCjVWfLrnpWR9vQuMya8RxUy2qxk3HQBIgdn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766504728; c=relaxed/simple;
	bh=Nbr+595wzIlfQktoqESVqjE0AhgwC1Glx9IxPG70c/8=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=eWBO1BwzjPIIrIb81tWs5+Hl2UrbOCB7VE5tUFmteTCH3t9fYDEbneb4/UnfvNNW5s6sgHPPD2E47oqlXR4xx3ANTEmUhgXSturDiIrzaguVASYaXYAOsI1J+o4Xt70GmM85h7n+BnpWf6lhl8rcwkKZTemMSXtnhJRnDGtGQ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZOFfjKO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZOFfjKO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59583505988so7763145e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766504724; x=1767109524; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ALf8MaedbdPI72V8d/dNEG4Su8CUjZKSY9JmPqjIM9g=;
        b=dZOFfjKOPifjZHVqwB/UEtqGSmbSxacDLwLcpOeITRtVRaHVz2rBiF4wkLka5yXnWx
         9szpE4+9x+LawTeKWNN/KP3x15NXbwX6uAyBGd5kMUp4I7GPMkc5GgUUVRcD97uMTWaZ
         jMk7n2d3RNJgwUaBgQFNYIjWM2krEY6qvMMOxSIlwDqdXKDG9S8ASJW3x1UZ6qJQI1K2
         KKlVdZ15FlC21f6iW/Iv7BinJQ0tRALaLEEaWf2xxLDi/GQHyL635/ibMn7f0MWPcZ5D
         TmCIxejD5A48bQJgkMGGsQnbzeXm6A10kxx0gS7J7e15WoHa1LLFt0LwqTLq6w5q43Le
         IQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766504725; x=1767109525;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALf8MaedbdPI72V8d/dNEG4Su8CUjZKSY9JmPqjIM9g=;
        b=sRAqJUpmCCUx0OaVrN8kM7ovx28anTuxBG3kk2iU2VsJf0FgZsJIJO4Wlp2zc/jsMB
         /wSCpcIfd6Q9T9V1yk6q/1hlPoHPCm3EvKlqDHdSUenbzhKHsPOxAeGRMwUOycDEciav
         v2wZeqjmHdYaeJBQL5Imj6/u/ne/heHvtbnM7vIFc8ZAeYPncq0x8Aagk7sKxMFMd6XU
         QXaZh0kfkOWNlw4Dok3h5Vdqn8P4XA1snXvf7rnxVvP89/1lOtaSIuVyJ0zXLCPUvxxW
         k+rptdtaJMVaKk4/m88I4amRy0iuuCgYpWMRnE4A1qHpwJTMHKeQz3p6EHBCuU3d6OFk
         TyXg==
X-Gm-Message-State: AOJu0YwtzTVbVSsh2y6CeCP0Bh2BvFvO/7R27CSNZrkSzsa1rfQ5WkO1
	LWddssXCt0su3UDvE5Q3oT5fKDouD6OGuHbwAlpDoD5chS91wIx5u/Eh3vvymnZ1FZIZpn/Q6iL
	+6GErpy6RqrqW2OeZlnAX4Jq8Gngyfpf5aCVK
X-Gm-Gg: AY/fxX55tDQibArCbpdfPNWgV4HZGS+NKTxGR1CKZjFq/Ca53cJI4vGIJLKgZRYvwvl
	xBTkw5Mtq54JQz8i4pBeN+N4jMci8EL6UQAqoqt4yvcwOUiNFFFBlGpilheRL5b1iEyFptdSEoQ
	tmcWllZI5CBEoOPrCzfPGz/XVHWkjGYc+a7B1ebOZaBMNiHIMGbkKNayvA2ofHvbceJT24EYKxo
	IuawzjoMMQd5QVpiE+Qr8KjY4FHgLVq/10ceNcamhlwXNYFwRCUcjDeQPgTNUzsZCjE8Kg=
X-Google-Smtp-Source: AGHT+IGKXn8CvNdJZ3wBpTQc5VgFKkoN0BfrlPmpP4+ias/h/3PcHyJSI5zoTkdLVWNDMK3cd94Oe4qQzmYXiz3CTLg=
X-Received: by 2002:a05:6512:3d24:b0:598:f400:6683 with SMTP id
 2adb3069b0e04-59a126e9aacmr7076683e87.17.1766504724327; Tue, 23 Dec 2025
 07:45:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 15:45:23 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 15:45:23 +0000
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Dec 2025 15:45:23 +0000
X-Gm-Features: AQt7F2qqrQGoOfIH8cMa_Qcy5Fnwkay18o2ty9H2kPG4UbQchzAq3X8Jipduz3Q
Message-ID: <CAMEXYWfjDe4+H=19PVNNYkEFs0S2ApAnRCPdiZ36khAHNKDtuA@mail.gmail.com>
Subject: [PATCH] platform/x86: yogabook: Clean up code style
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Benjamin Philip <benjamin.philip495@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

This commit cleans up the following checks flagged by checkpatch in
yogabook.c:

- CHECK: Prefer kernel type 'u8' over 'uint8_t'
- CHECK: Unnecessary parentheses around '...'
- CHECK: Comparison to NULL could be written "!data"
- CHECK: line length of ... exceeds 100 columns

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/platform/x86/lenovo/yogabook.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yogabook.c
b/drivers/platform/x86/lenovo/yogabook.c
index 31b298dc5046..ee6c625076df 100644
--- a/drivers/platform/x86/lenovo/yogabook.c
+++ b/drivers/platform/x86/lenovo/yogabook.c
@@ -57,7 +57,7 @@ struct yogabook_data {
 	struct work_struct work;
 	struct led_classdev kbd_bl_led;
 	unsigned long flags;
-	uint8_t brightness;
+	u8 brightness;
 };

 static void yogabook_work(struct work_struct *work)
@@ -160,7 +160,7 @@ static int kbd_brightness_set(struct led_classdev *cdev,
 {
 	struct yogabook_data *data = kbd_led_to_yogabook(cdev);

-	if ((value < 0) || (value > YB_KBD_BL_MAX))
+	if (value < 0 || value > YB_KBD_BL_MAX)
 		return -EINVAL;

 	data->brightness = value;
@@ -338,16 +338,18 @@ static int yogabook_wmi_probe(struct wmi_device
*wdev, const void *context)
 	int r;

 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (data == NULL)
+	if (!data)
 		return -ENOMEM;

 	data->kbd_adev = acpi_dev_get_first_match_dev("GDIX1001", NULL, -1);
 	if (!data->kbd_adev)
-		return dev_err_probe(dev, -ENODEV, "Cannot find the touchpad device
in ACPI tables\n");
+		return dev_err_probe(dev, -ENODEV,
+				     "Cannot find the touchpad device in ACPI tables\n");

 	data->dig_adev = acpi_dev_get_first_match_dev("WCOM0019", NULL, -1);
 	if (!data->dig_adev) {
-		r = dev_err_probe(dev, -ENODEV, "Cannot find the digitizer device
in ACPI tables\n");
+		r = dev_err_probe(dev, -ENODEV,
+				  "Cannot find the digitizer device in ACPI tables\n");
 		goto error_put_devs;
 	}

@@ -453,7 +455,7 @@ static int yogabook_pdev_probe(struct platform_device *pdev)
 	int r;

 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (data == NULL)
+	if (!data)
 		return -ENOMEM;

 	data->kbd_dev = bus_find_device_by_name(&i2c_bus_type, NULL, "i2c-goodix_ts");
-- 
2.52.0
