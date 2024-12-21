Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26191F2C34;
	Sat, 21 Dec 2024 06:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760823; cv=none; b=uGp3j0ADpKHrr2/gcd39HB5T72vutMSIQb8FihuKe6Pqcu6EgAj0a283blihvB41uS6s31y9HKp+wh7f/awVd2F3PGEZyyZR0bKjPFU8bgmcUcSFxsXU88Y2dqNodYhlM6jU93QJK+SJmxIkuKuO6S/CpbP38kOKaU28dxUxQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760823; c=relaxed/simple;
	bh=+97BEZqSOzUMHZcxl5gy9WNRc/ik8bUMYqhu+MNiJOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exuCIvSZEDGvq/d+PxYGTEEvSqL9KcY+tUnv74EQ2Cp4+cPgiC0hmbu7Q4RIx4GURnSlwGJQ2WxTvmJV4UkqPK1lNR66oAQyAuPuFE76O+Yhsis4Vn9+oeLeS2MKyslFA4I3miidZmw36l6BtqUiL/cOKOcFrkHELWZNpmLrAQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyW0KgCy; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyW0KgCy"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ef7c9e9592so30036437b3.1;
        Fri, 20 Dec 2024 22:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760820; x=1735365620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3JTkPPrMDBh7lvJhQshhnN1kh0URjRj/qqoCrwPV0Q=;
        b=kyW0KgCyihNr0FmRZALGvy29Q+P/Zvl/l+i1kphQGMF9J+f/BKblwri9xzxr0R0C3G
         b+GUDOLFJ3cVIySC5DzPk8bb8FdMWqMvTmfTq784ARaVkA7OS/N5jLrj1WDRG6+YF5Fm
         E8q8FN64CBc9Dp6dl9mleSUeiBAltkJmht8ajterN/9/ZwkDSGU3ZCPVySm35NzQa1Ql
         rigdo+eWkRC7tPQ84tS7loykCKAQ+uIsLq++bhYF2NiScXsrV0vXjjFH0BUmFWiZEdx8
         S+J6OehKn7bf4d/EWWYsiBBSFeDGW9eYfihxYiO9K/hHxB+dWgiHPlcPm8nRHF3v4cTt
         Dpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760820; x=1735365620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3JTkPPrMDBh7lvJhQshhnN1kh0URjRj/qqoCrwPV0Q=;
        b=sKdAeSJACvHblpxyB+LSlaQ/rtpj05AufcqvRalVjsiU7o9QLgvOahFZnW0rf2bb9R
         KftxjkjFPaAnS6yaxTLZ4VFc4eoPCHIdwkyz6JqBlPC3a2ak34JyCy5+FNId3zQ4kKdE
         22/AhzpcCs4JxWJTDpBstuL9On3+TqM13LOMLGwSPNm4TuZDrhqJlF4zWHsT1jlfbvBl
         Rt+k+e7chVaCpc9RH1J5uC+vOvSpPAJvU4F4Fk+lz+W+0wZN29PZLlcy33y65LjJL7W2
         wX2mJJjVk0JabkTpma8slwbh44thhO6R5TpsD9qQl6LL5Fk6+c1SUJXvltXrynhUt99N
         /clg==
X-Forwarded-Encrypted: i=1; AJvYcCXSOWxA0/PUH8ZLr9AHyfP0c8r0rBCQ1HIOvI+cJiAQ+5+u7Ntj+QXU4l/ITTzUZLBnvkoVvLmkLuThyZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Gfn92Tu3W5a9mwID/okMK8HH7GpEtKRPKhgUKmadtIheIwXB
	zMbrxquuzAdFXa8lf1PvFJ8DSUWmT2qjfJxUsId+SRVfmm49Z7Z43nPhHw==
X-Gm-Gg: ASbGncuwnG417elQevzXGdWcrnAMKEpRj2yieiRNcpBKh06rpVfJSZ3yarxhXg8QQxO
	OHK7dBJXgnHMn3dd3GUCIaski6m1JAYlUKOOGqSOH3xe/bRL+hMGEHXFw++NeqgLPraNzk9lVGO
	UpuVcTdv6vgSEixrE4qSp5zH5yWE1POimbHHvjf8xgQn5M/5UPtlJCBW5fXwAPFFdodTL5mCidq
	tTejv1hG1QVQ8GIx51fHjrKAkycdjtoq+/oJbh2a+SEsXv//0dFBjkPKie2wRm0
X-Google-Smtp-Source: AGHT+IEs4TAvURrZ5KZVyrf1ol73e36QRX6re82NHGCGVm24jRRljex7MOAFDSmKgFEtL3lPX9WY3Q==
X-Received: by 2002:a05:690c:88c:b0:6e3:37a7:8a98 with SMTP id 00721157ae682-6f3f8114d78mr52754447b3.14.1734760820539;
        Fri, 20 Dec 2024 22:00:20 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:20 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 10/20] alienware-wmi: Refactor LED control methods
Date: Sat, 21 Dec 2024 00:59:07 -0500
Message-ID: <20241221055917.10555-11-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
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
 drivers/platform/x86/dell/alienware-wmi.c | 180 ++++++++++++++--------
 1 file changed, 118 insertions(+), 62 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index c4ca141d628e..bcf3b2f80dfd 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -417,12 +417,46 @@ struct alienfx_priv {
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
 
+static acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+					 void *in_args, size_t in_size, u32 *out_data)
+{
+	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
+	struct acpi_buffer in = {in_size, in_args};
+	union acpi_object *obj;
+	acpi_status ret;
+
+	if (out_data) {
+		ret = wmidev_evaluate_method(wdev, 0, method_id, &in, &out);
+		if (ACPI_FAILURE(ret))
+			goto out_free_ptr;
+
+		obj = (union acpi_object *)out.pointer;
+
+		if (obj && obj->type == ACPI_TYPE_INTEGER)
+			*out_data = (u32)obj->integer.value;
+	} else {
+		ret = wmidev_evaluate_method(wdev, 0, method_id, &in, NULL);
+	}
+
+out_free_ptr:
+	kfree(out.pointer);
+	return ret;
+}
+
 /*
  * Helpers used for zone control
  */
@@ -453,46 +487,6 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
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
@@ -510,18 +504,20 @@ static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
 static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count, u8 location)
 {
+	struct alienfx_platdata *pdata;
 	struct color_platform *colors;
 	struct alienfx_priv *priv;
 	int ret;
 
 	priv = dev_get_drvdata(dev);
+	pdata = dev_get_platdata(dev);
 	colors = &priv->colors[location];
 
 	ret = parse_rgb(buf, colors);
 	if (ret)
 		return ret;
 
-	ret = alienware_update_led(priv, location);
+	ret = pdata->ops.upd_led(priv, pdata->wdev, location);
 
 	return ret ? ret : count;
 }
@@ -628,35 +624,19 @@ static struct attribute_group zone_attribute_group = {
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
+	struct alienfx_platdata *pdata;
 	struct alienfx_priv *priv;
 	int ret;
 
 	priv = container_of(led_cdev, struct alienfx_priv, global_led);
+	pdata = dev_get_platdata(&priv->pdev->dev);
+
 	priv->global_brightness = brightness;
-	if (interface == WMAX)
-		ret = wmax_brightness(brightness);
-	else
-		ret = alienware_update_led(priv, 0);
+
+	ret = pdata->ops.upd_brightness(priv, pdata->wdev, brightness);
 	if (ret)
 		pr_err("LED brightness update failed\n");
 }
@@ -1224,10 +1204,47 @@ static void alienware_alienfx_exit(struct wmi_device *wdev)
 /*
  * Legacy WMI driver
  */
+static int legacy_wmi_update_led(struct alienfx_priv *priv,
+				 struct wmi_device *wdev, u8 location)
+{
+	struct legacy_led_args legacy_args;
+	struct acpi_buffer input;
+	acpi_status status;
+
+	legacy_args.colors = priv->colors[location];
+	legacy_args.brightness = priv->global_brightness;
+	legacy_args.state = priv->lighting_control_state;
+
+	input.length = sizeof(legacy_args);
+	input.pointer = &legacy_args;
+
+	if (legacy_args.state == LEGACY_RUNNING)
+		status = alienware_wmi_command(wdev, location + 1, &legacy_args,
+					       sizeof(legacy_args), NULL);
+	else
+		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
+					     location + 1, &input, NULL);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
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
@@ -1267,10 +1284,49 @@ static void __exit alienware_legacy_wmi_exit(void)
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
+	acpi_status status;
+
+	status = alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL,
+				       &in_args, sizeof(in_args), NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
+				      struct wmi_device *wdev, u8 brightness)
+{
+	struct wmax_brightness_args in_args = {
+		.led_mask = 0xFF,
+		.percentage = brightness,
+	};
+	acpi_status status;
+
+	status = alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
+				       sizeof(in_args), NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
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
 	int ret = 0;
 
-- 
2.47.1

