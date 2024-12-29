Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D587419D8BC;
	Sun, 29 Dec 2024 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501640; cv=none; b=U7nfMW1QCrHcjHQ/svXXOqikmjlZ3iHSJgIT9lmaG4ZL+EjXs8aDnJDnbOX6wqK/38vGBjLNJyYSmlNJIn8AXo01cBlKL0rfue5UKwZtdfGZdPEWe7t+9BQFKYXnugfpW7Eme1l/Ud0K3cObOCNSRVWnSWcwhEF+egE2laiP5K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501640; c=relaxed/simple;
	bh=vNFev5S2G19JKqQqAkG+2Io7Z2WHZ+HQKwUvrJM60ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBK4j2wEqoso7Is9kTcto/Nwqp6vO1iKGOe2nYgh57Eif+BkEID3rCwg1aFfZ9yEiWfYEpG3joN0nXZfDxTKHEvXKzrqLv8tDqnrM4BiScbFzDbEcNoPPwHeAqdIVRSO4a3+oSByfFkaQL42N854DFlALx6bsc+SmlGK66WEGf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw0tNgSe; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw0tNgSe"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afefc876c6so2654282137.2;
        Sun, 29 Dec 2024 11:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501637; x=1736106437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pVW7fGOpFgG5dQIbVa/SdAqGlxBCa7eYWjlROIiHGE=;
        b=hw0tNgSeme0gtd8oFvwxEXZuWrOfAL851cspgcKJmHfMo3vCu8v/IQ67mr9Us4rkag
         uATPwSzEz79tbGFPY8MFveI7TUqPAJO76OAUpbCScMlHVSv0Wg4A8i9nbvTJP5M/JfRG
         ihWTdchgV0yCZWTAzD6AXf/vNjn6H8/u4VpdZ8nm2o4wbYQU0/lMiz8sRw6/W/YGi+o0
         m2x6Liycxz01RMnfudmigT3MmFZjZgsW21BqEgSZiCpQrSmQypNAi4klI67UUMd/idIY
         8PuqcUlPkB02Ut/ewrLg5oIrRL6Rblea2CQJ2XDYyqHIj7Y9ebPEVPtKzYANcGY+MIUu
         XlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501637; x=1736106437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pVW7fGOpFgG5dQIbVa/SdAqGlxBCa7eYWjlROIiHGE=;
        b=nqiIqGEBCmNtwF1xd2n2a6t5i4j0Yq39xeGiqd/WMVms63HCC4T3rbxS+JDEKDmL+Y
         fhuKw0rlK7AWiNrFeZAKePkqTvFP3WDbTDHm1P4CGnazjNt+tqBOQmnsovAzDQ/Atr9W
         y3z03uVp1aeZ0wRjNHNC8dbaZ558qgoIh9dq72q8mA6NXaEtrhkQffwVtehnj70QNSdr
         xxoGD9ebCFWLPiTBZdVrVDEarOFz1zE8eOQfj/o92qYV8pD0mx51nk51qN9xKqMFlrDn
         mCr/CLRy+5xQ4dTB5iTY3Lrt+vOovwLdIvndLfsJ1aynJYoatOOrd0SmuVglKZEE3fmd
         dLhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkCiuSG+MwoFWv+uq/bLiROQHymn7gtEkXfbcozz+5CtymooBJcIh5Xop4XIee3Q2jxhypfoLZ4SnfH/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPP+qxWH7KaTurg05RfsWbG1wySNYblwsTOtwcwoKD6pmQsiIp
	j0bZQOHxf0w8V/lLvK6WSpjCZe83YES4KwyVTxXmoTJ8xnCNeUTPMxZtBQ==
X-Gm-Gg: ASbGncux7BenUzeTcpTt9qqSXifO213p5f2HXirjmmVViiZSlcox2Lf9jCTeep5jO8k
	axFxf50etvQg1vsJ+ZkKPzbvfU1o9EN6fXuqSLFmRlovYHSTyobSUugc2bjyZ0cNtMqfDMp34Ds
	88yE6vyXaddaiWNDwRMFBACNyGmELbKGrR+6+qY+ojrGHo0GAEf99ctqd9PBhIoJD2ZxKFOv79o
	u3EinhSOX84cUB8h/KHyUTxfJ1mal3DpzCo8SyRU9KrBMUN9UC+PmsheFRfGd9j
X-Google-Smtp-Source: AGHT+IFqq4Y5Wxzsds1hu1mYQFvI0DWCp221eW6sW35KgL6Hl4PgVsb/ytd+P+tEoaXB8q4IxNfTpQ==
X-Received: by 2002:a05:6102:2c83:b0:4af:eccf:e3b2 with SMTP id ada2fe7eead31-4b2cc493590mr26251017137.25.1735501637566;
        Sun, 29 Dec 2024 11:47:17 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:16 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 10/20] alienware-wmi: Refactor LED control methods
Date: Sun, 29 Dec 2024 14:44:57 -0500
Message-ID: <20241229194506.8268-12-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
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
index 512384635c4c..494a3772065c 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -418,12 +418,42 @@ struct alienfx_priv {
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
+	if (obj && obj->type == ACPI_TYPE_INTEGER) {
+		*out_data = (u32)obj->integer.value;
+		kfree(out.pointer);
+	}
+
+	return 0;
+}
+
 /*
  * Helpers used for zone control
  */
@@ -454,46 +484,6 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
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
@@ -510,13 +500,14 @@ static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
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
@@ -649,36 +640,17 @@ static struct attribute_group zone_attribute_group = {
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
@@ -1247,10 +1219,49 @@ static void alienware_alienfx_exit(struct wmi_device *wdev)
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
@@ -1290,10 +1301,39 @@ static void __exit alienware_legacy_wmi_exit(void)
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

