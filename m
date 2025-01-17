Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4FA1F869B;
	Fri, 17 Jan 2025 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101683; cv=none; b=VWKamwuFUBicvHcv0p/fQsFv0zxed3wmL2EbEMVzF/qboNWK45dN+ESu6AXrKfmTf3mAplGfsDBV+vu4cTyhIc5FNT1E0/dbcif+SPtfzIR1JB+lVtuDkNlXTn3v6Et2qVVcG3Fed/5wfST/WxGevHpdxQVrgDmUH/2095l0H8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101683; c=relaxed/simple;
	bh=m2o8sm5ydBC0n7BJqnKsmmnlsOim7AG0G2A7usM/6+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XYJo6lXn/7r9kUoxtlfZIZGD2eKjmZGxR1DnCYtKMZ7lkloCd/gkNvbG6GCMaGpT838IYd8Cv4flHKzQ40+/BX2ZPclwlz5QYH3h08Sa90mI+sUeG+0tDXZm8gAPs2EJWUHkrub3iM4Gen7ducC/Ev8F4OFuDdm7fC+Sm2mRY9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOHEZUnF; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOHEZUnF"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so489065137.3;
        Fri, 17 Jan 2025 00:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101680; x=1737706480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYBFYusQfAvodSjOQub+NFVxTB4k0w2aaHHKwicGudM=;
        b=HOHEZUnF64JPE1cWo0VjBL0Do3oVMxfbgaTQC9fjerX8qQQERqjLsXfq0ZjfSFxB6W
         8fZCqpZJOGHGRLLwA4lkJIZUEPvW+ZREYbIUWF90hB0O4knzTJOCGlSIrUozsrqv/kaS
         br96YBpUv/3/ReoicGcMTJwFN23PrlfQY6o/PZ61OtM4j5TT4MwUunEbweOsyXQsd5aK
         5tQ8yB7ATN3MyHYz0Yo/isXYEJlrIsa3MvrEdOFrXjtEY1Q8wjXADOfJkSQBHebVydOR
         jnJAKtllcMdk0QrjiuWHDgM6y1C0xj2CjsZbBwTDP+WL47b3hpkJK0nilTBTkL0kpgTn
         YDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101680; x=1737706480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYBFYusQfAvodSjOQub+NFVxTB4k0w2aaHHKwicGudM=;
        b=QVCOocn2NyTDFX86YxO1cYxJVmB/Cn6Pkbni+WyYxuhVXxawgr36xJuU+eB4M7R5+p
         5sIxy1ZlEteiKdoXeejta/ZQpEGRqvIsq9caw17ELwUH3T0Da4XPEGi7hDfFRtdeUABA
         yjqVm+SiLWuxdyHM/vrrY9DHi33OfjvfiJSxgkAGRY4vOSTipmXc41EDYWsl/jHmTlOF
         8xkGLmG6yr8G3N8mlQztL2SueKMu9LB4SEsPwPPN8wjUxYJnv+mIQcqxP0rfLBlI0yhW
         Fo44u3IHzDT4SCav3Q21qRhYHRhyEHrJc39LFXNJ8fuUJ2ntjCYW+r6p/yXl/7eyC3EY
         cW1g==
X-Forwarded-Encrypted: i=1; AJvYcCW5MvNlCPI+cQBHk9BnNclIHutCBiZ4y+kx0H9eZAbRaIp9Cwyw/LGCgS1Eh53VjH1snqYsblwKyXH34Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbOisnZCqwT/2d+XbTwnRuSgagixK3UD1+hiMEDeYN1J85aq4+
	if5IisEqyFTt+vz+Nr2wQ4TgmrSUea/n9m11g66XcruNiQgqVs/hJSHq1Q==
X-Gm-Gg: ASbGncsLMg82S2t9/4bwMtL2ZV0pLPpupxB5NorEyOMpG57RLe9mNK0nfxJg4OWku5Q
	su/haOUMsP8XE/W1uqHR5o4T1mj1dzFQrmUFUUBXet9Ggt3AG/WkE/yCl+9shoEtITA7WjsTWar
	5oq1k87odJKcKQ18MkBFXm7RqYcGD5zU9FXFuCpIB2u9kwdJv0YUNjZmDYpLEibOnkxT+xh3Pr0
	NGJMywRZx4JUu9T+qi0KxQ8Tbv2C9lHSd0eRjHbsXhUuGQgW1jyHy7oKlsj9XtT
X-Google-Smtp-Source: AGHT+IGzGxwfsCs7s0iV4/iccVDS2S7RPWezOVgUctNTQDwdPaK5SbV+BF9YxA+w0Ur5KG6I7MfJfw==
X-Received: by 2002:a05:6102:15a1:b0:4af:f6e5:2b46 with SMTP id ada2fe7eead31-4b690bfc4bcmr938161137.9.1737101679947;
        Fri, 17 Jan 2025 00:14:39 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:39 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 04/14] platform/x86: alienware-wmi: Refactor LED control methods
Date: Fri, 17 Jan 2025 03:13:37 -0500
Message-ID: <20250117081347.8573-5-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117081347.8573-1-kuurtb@gmail.com>
References: <20250117081347.8573-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both WMI devices handled by this module specify a distinct interface for
LED control. Previously this module handled this by dynamically adapting
arguments passed to wmi_evaluate_method() based on the `interface`
global variable.

To avoid the use of global variables, and enable the migration to
non-deprecated WMI methods, let the WMI drivers define upd_led and
upd_brightness operations, which completely replace
alienware_update_led() and wmax_brightness().

Also define alienware_wmi_command(), which serves as a wrapper for
wmidev_evaluate_method(). This new method is very similar to
alienware_wmax_command() but is WMI device agnostic.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 164 ++++++++++++++--------
 1 file changed, 102 insertions(+), 62 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 7356260f7f09..c9d9cf36b87b 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -417,12 +417,42 @@ struct alienfx_priv {
 	u8 lighting_control_state;
 };
 
+struct alienfx_ops {
+	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
+		       u8 location);
+	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wdev,
+			      u8 brightness);
+};
+
 struct alienfx_platdata {
 	struct wmi_device *wdev;
+	struct alienfx_ops ops;
 };
 
 static u8 interface;
 
+static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+				 void *in_args, size_t in_size, u32 *out_data)
+{
+	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
+	struct acpi_buffer in = {in_size, in_args};
+	union acpi_object *obj;
+	acpi_status ret;
+
+	ret = wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
+	if (ACPI_FAILURE(ret))
+		return -EIO;
+
+	obj = out.pointer;
+
+	if (out_data && obj && obj->type == ACPI_TYPE_INTEGER)
+		*out_data = (u32)obj->integer.value;
+
+	kfree(obj);
+
+	return 0;
+}
+
 /*
  * Helpers used for zone control
  */
@@ -453,46 +483,6 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
 /*
  * Individual RGB zone control
  */
-static int alienware_update_led(struct alienfx_priv *priv, u8 location)
-{
-	int method_id;
-	acpi_status status;
-	char *guid;
-	struct acpi_buffer input;
-	struct legacy_led_args legacy_args;
-	struct wmax_led_args wmax_basic_args;
-	if (interface == WMAX) {
-		wmax_basic_args.led_mask = 1 << location;
-		wmax_basic_args.colors = priv->colors[location];
-		wmax_basic_args.state = priv->lighting_control_state;
-		guid = WMAX_CONTROL_GUID;
-		method_id = WMAX_METHOD_ZONE_CONTROL;
-
-		input.length = sizeof(wmax_basic_args);
-		input.pointer = &wmax_basic_args;
-	} else {
-		legacy_args.colors = priv->colors[location];
-		legacy_args.brightness = priv->global_brightness;
-		legacy_args.state = 0;
-		if (priv->lighting_control_state == LEGACY_BOOTING ||
-		    priv->lighting_control_state == LEGACY_SUSPEND) {
-			guid = LEGACY_POWER_CONTROL_GUID;
-			legacy_args.state = priv->lighting_control_state;
-		} else
-			guid = LEGACY_CONTROL_GUID;
-		method_id = location + 1;
-
-		input.length = sizeof(legacy_args);
-		input.pointer = &legacy_args;
-	}
-	pr_debug("alienware-wmi: guid %s method %d\n", guid, method_id);
-
-	status = wmi_evaluate_method(guid, 0, method_id, &input, NULL);
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: zone set failure: %u\n", status);
-	return ACPI_FAILURE(status);
-}
-
 static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
 			 char *buf, u8 location)
 {
@@ -509,13 +499,14 @@ static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
 {
 	struct alienfx_priv *priv = dev_get_drvdata(dev);
 	struct color_platform *colors = &priv->colors[location];
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	int ret;
 
 	ret = parse_rgb(buf, colors);
 	if (ret)
 		return ret;
 
-	ret = alienware_update_led(priv, location);
+	ret = pdata->ops.upd_led(priv, pdata->wdev, location);
 
 	return ret ? ret : count;
 }
@@ -651,36 +642,17 @@ static struct attribute_group zone_attribute_group = {
 /*
  * LED Brightness (Global)
  */
-static int wmax_brightness(int brightness)
-{
-	acpi_status status;
-	struct acpi_buffer input;
-	struct wmax_brightness_args args = {
-		.led_mask = 0xFF,
-		.percentage = brightness,
-	};
-	input.length = sizeof(args);
-	input.pointer = &args;
-	status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
-				     WMAX_METHOD_BRIGHTNESS, &input, NULL);
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: brightness set failure: %u\n", status);
-	return ACPI_FAILURE(status);
-}
-
 static void global_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness brightness)
 {
 	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
 						 global_led);
+	struct alienfx_platdata *pdata = dev_get_platdata(&priv->pdev->dev);
 	int ret;
 
 	priv->global_brightness = brightness;
 
-	if (interface == WMAX)
-		ret = wmax_brightness(brightness);
-	else
-		ret = alienware_update_led(priv, 0);
+	ret = pdata->ops.upd_brightness(priv, pdata->wdev, brightness);
 	if (ret)
 		pr_err("LED brightness update failed\n");
 }
@@ -1234,10 +1206,49 @@ static void alienware_alienfx_exit(struct wmi_device *wdev)
 /*
  * Legacy WMI driver
  */
+static int legacy_wmi_update_led(struct alienfx_priv *priv,
+				 struct wmi_device *wdev, u8 location)
+{
+	struct legacy_led_args legacy_args = {
+		.colors = priv->colors[location],
+		.brightness = priv->global_brightness,
+		.state = 0,
+	};
+	struct acpi_buffer input;
+	acpi_status status;
+
+	if (legacy_args.state != LEGACY_RUNNING) {
+		legacy_args.state = priv->lighting_control_state;
+
+		input.length = sizeof(legacy_args);
+		input.pointer = &legacy_args;
+
+		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
+					     location + 1, &input, NULL);
+		if (ACPI_FAILURE(status))
+			return -EIO;
+
+		return 0;
+	}
+
+	return alienware_wmi_command(wdev, location + 1, &legacy_args,
+				     sizeof(legacy_args), NULL);
+}
+
+static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
+					struct wmi_device *wdev, u8 brightness)
+{
+	return legacy_wmi_update_led(priv, wdev, 0);
+}
+
 static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct alienfx_platdata pdata = {
 		.wdev = wdev,
+		.ops = {
+			.upd_led = legacy_wmi_update_led,
+			.upd_brightness = legacy_wmi_update_brightness,
+		},
 	};
 
 	return alienware_alienfx_setup(&pdata);
@@ -1277,10 +1288,39 @@ static void __exit alienware_legacy_wmi_exit(void)
 /*
  * WMAX WMI driver
  */
+static int wmax_wmi_update_led(struct alienfx_priv *priv,
+			       struct wmi_device *wdev, u8 location)
+{
+	struct wmax_led_args in_args = {
+		.led_mask = 1 << location,
+		.colors = priv->colors[location],
+		.state = priv->lighting_control_state,
+	};
+
+	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
+				     sizeof(in_args), NULL);
+}
+
+static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
+				      struct wmi_device *wdev, u8 brightness)
+{
+	struct wmax_brightness_args in_args = {
+		.led_mask = 0xFF,
+		.percentage = brightness,
+	};
+
+	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
+				     sizeof(in_args), NULL);
+}
+
 static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct alienfx_platdata pdata = {
 		.wdev = wdev,
+		.ops = {
+			.upd_led = wmax_wmi_update_led,
+			.upd_brightness = wmax_wmi_update_brightness,
+		},
 	};
 	struct platform_device *pdev;
 	int ret;
-- 
2.48.1

