Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F081547D5;
	Sun,  5 Jan 2025 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091092; cv=none; b=EdnN7pbir8SQthhBb6itlu3S8l7X/85zLJYQZegoMjYIdddNT24khP5izZJWZDwDiwRYcxpauad1R4UV/jayX0e7S5dS5iX6bonucXmm2EenHl1CsblD1+R2TGGSvfxsPUQAl1jqptwgoDu4bdYo4bxi4kB6KshtG4M97k5oBkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091092; c=relaxed/simple;
	bh=Wnxce9rK78lywp5p1IVlFeJPD4SaxVF9400PZSL+4z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1QvuRB5TFK2q41XfptIkZTEcBukV5fhkY0MIkfqdnl6NPdaPTnzFnYz4PTk07Zb9FruVFaZMLXw/kQfvcq0zoDBubcBLvIX3itc0TpY/W4x5JaSb3Ikl3HMtWBjFCnGhmzc6+DfXxKt7QGS+6hRwoS3xk6FsUaUmSmhu7VP1R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNxUzn96; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNxUzn96"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so3475323137.3;
        Sun, 05 Jan 2025 07:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091086; x=1736695886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnuAbbta73g3wcn3Uriub8zjWympfRjknG1MQ6B9blQ=;
        b=kNxUzn966BPykTUdcmvJ49nrohkcvdYVF9TOVlTmrCJx5H6fwTBtuH1/hJ3lST833B
         YaDYkxtm4AHlRo4sYLZZixQFIsD4OsuzShcb3H/TsTdZgsKYrmUNuRpLTcApRXeL1XsX
         dkXTtc9gQqIq/y5kVXheGhsHE7Qab78KMpOBJhWFkyn/mtvVAbSrWKaQSeP8KWkDIrwo
         9A6NaJu4AluRUg3AJkCkPbVtUP0RmglpOtKpqjF+yb03CsO1JyE2pWzeDxVL7DYD4g3o
         X+wAUVlkPhcaSa+empgBjIbbzlJBwEeL2DhwswnMZpy6grPdMITwiNAAoKs/GDt+DojU
         YDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091086; x=1736695886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnuAbbta73g3wcn3Uriub8zjWympfRjknG1MQ6B9blQ=;
        b=uZYI/ovyhGCA6byZAwxNKLnLeIEXVKksv6CBQjNMyTXJGzEeGQFzaewUZ7GQz8gsxZ
         8T0axUMfboYGDolGNZY1h6B0PPQeOZXCe5+4mhvissMhJ4lYYhtj+riSaWXbyd3l/txL
         L2/8tnMOFUNYgP4r621mJSTjg1H87YbtZmJpWgwUO184f4nfOurqHZLI0QJvm38aH34m
         g0k5JARKlRxV+Mg8VFPzr0I0DMhmxITy6PCPThHspCmENoehh/nH64XHYRaSZKw+CtH5
         o74opALVSa8KV0zRAJ2eqmEdPotMO0pjdz9CnhUYAuotpDTeymt38hkDnVqvCVXwGHCH
         RvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIq/UXuASjaCcWK06zZdgtIFCSJ6yHhHqGVL2Le0FuPsWDEprsbeMJZLGcbUdg5m8ReGCsLr0YgctlyGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBx+UJklcdG+VD3YVj+edg6UunUeBsHo5L8Bk22nSiMKmYkNh3
	j/nLHxTBCESScypUy81nS/b5X9jJ3WvGN4YWsSgC6gt25NghjXSVA8qTRA==
X-Gm-Gg: ASbGncsDUgPIv3uPpcQ9zBczma5QRMVyc5Tdlwb7sDEiz2rn7VOIarlQJH0f4YWFTo8
	90MfJHCEB08J5uyR8NDM48i7rPfKuXLgKXl4vGKgf8AYXNnQnKn8DXxyd1wLOh9Ztxjz9ZCXkqn
	G3QRaWAGHd5MUDK1MSb7t0y/ucogDAY+RuYclDEgD5wf3uD5Cj7pCFntegqZd/FO4ZLMDqZIQj9
	IQnP+QJ11nYNcsA0goaNQDCAtSfJmif9fVeImNn8g2nTLt3aI34gBo9510o8E+y
X-Google-Smtp-Source: AGHT+IG63/+QYwjvNOVUz3OJgpZ9Kf+rE5vBBD07e/rczO/gWUY1kzfv1UFyW3Bvcc0KC3VZHA2aaw==
X-Received: by 2002:a05:6102:1524:b0:4af:f32e:ea76 with SMTP id ada2fe7eead31-4b2cc31c4bcmr44201037137.5.1736091086380;
        Sun, 05 Jan 2025 07:31:26 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:25 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v3 10/20] platform/x86: alienware-wmi: Refactor LED control methods
Date: Sun,  5 Jan 2025 10:30:10 -0500
Message-ID: <20250105153019.19206-12-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
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
index da8a9592b1da..ffedb01e81d2 100644
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
@@ -1227,10 +1199,49 @@ static void alienware_alienfx_exit(struct wmi_device *wdev)
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
@@ -1270,10 +1281,39 @@ static void __exit alienware_legacy_wmi_exit(void)
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
2.47.1

