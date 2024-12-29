Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C82A19E833;
	Sun, 29 Dec 2024 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501645; cv=none; b=FwFLlF8XspU10ZW4DsawzUamqhs1QZ6BxLm/VwclGodfxkjbdPcgAu5Fkp4H5GG72sPPmRH93HV+RmT1JlwEAS5UFeNxBqfsjn25x+sgHpi0MmeL1nwpO7ZUSaVJDbrPtXFpXeIs4Kq76O9v7VCD46D1Vnb94nTV3D3Eio+NzSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501645; c=relaxed/simple;
	bh=V99hW2bIJnjfPrm30/SWGyzuc7CgIWz2rkhYEhTuJF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKeghRzvQDOizqh432wsMXtwEbO+Y5Zc0b9w2GIGmvbEY/QYLyqVuWiS/8M85tpBTw7dY56uw406Vw2vLZ3Mh6ZW54u+EIEUGVNtO7gbiAtrQhfF7URXFL+xFfDH5nKBxAvaWbUS9mdJv9Wh9YLTaTPEy+FngW7QbniU2QL0bFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLSVsnkZ; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLSVsnkZ"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51882748165so2848487e0c.3;
        Sun, 29 Dec 2024 11:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501643; x=1736106443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TskFiLQdik3rOnbUibyKIbU6ybNOrpaOQ7Wsart79hQ=;
        b=dLSVsnkZTeoDmJjFZNk0QbV3mMRzt0eX+jOltbFmSxiwbxGubXOYgtgx7VhONvzsdQ
         g0Ms8h6R2BBUsDAP1a2TX+EsJc/J/+P0/U3YQCARlYk88Wxv+1QnyZqKmhx1sMDwSG5y
         jpcPmkkhrflZqJHIJ3wofiA8B4Pp3w+D4Cpw/oHSrOvz2mWFC7nIdiklUGJY9yjVqTjA
         WAMckX9imn5ERmHWZK7louupbOwSF6L0AebB6rDSqgyO1YOnj+ereEfGx8I2H8CQD34T
         QecVy75HEs67YbGVzljmba6B+nH/LgTrPiWDw7idj5jA91Q/e4B9HMyiZFuMcWu4njvn
         LhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501643; x=1736106443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TskFiLQdik3rOnbUibyKIbU6ybNOrpaOQ7Wsart79hQ=;
        b=Wc0P9Fi+ebUvU2YogOootZD7QnZF31amd3NqASYHX7hXW+K1CSyz6YJZfRnt6HGQfd
         0cb+8fRAqPnE37//qHa7I0V1eafNwB/MAhMEtlj4qiVRrIQLD+O0NKWkXTrv/5dp916v
         UtoxTMsEOEoixSGDJBbqkt+OqZxrYmrVV32lWErV1DWnPkO4CLgLENzaD5TS+ImW0cG1
         UqqGHLptmlqdr38LSYmcvaPH2CMFSrRVesOZ9lKLPXsUacFTKqpvi4VQOaCZrU/QQBoG
         ujj7jM35zmJwEqCRrS5NkHlEzyuJRyYAHvIaD0KeVjKWf+obFje19o7bJSYTyd7nFR9P
         nobQ==
X-Forwarded-Encrypted: i=1; AJvYcCVewFIh8JO6HTiaxcFtNTCHF6Fp6JVyAnZDprWJI+BOWwge6qbPRcoSey4shNL1W2zD0oFUZ9kTM5t1Rgg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/g0VEuZfVFb4aTyieXZqOsTqgqxkvUGNUO8r9f3QU6rarl6Du
	JxHksBfBqpIOXHvY/VvzAOwx9LP1EKl7hhcgIJqx9ELKLso/Wzz7YK77uA==
X-Gm-Gg: ASbGncsH3dPwiXhPGSSXW4AwLWJH2FtRvFWHi6lups+OKQIX+zlY4MmVD96FoOTNLG4
	H3fhoOTdW5WweUblfCee+EqPI9LGnAKxaRy9O1iwfO232CDUG1YO4dtOqfbuA139jO2iA3sfKGI
	SCLQoeCFWLSCKmGovOeIOLmBbXygfYOjUNVMgbTc07v5cKZGNIVEu8XbnVSATaKHp+cUko/wIHH
	QHBi86cJNybl6k0fD4vG8Z7SA0+tY965ok/1iByhbkov6TiTL+Epu9AeYumOEfc
X-Google-Smtp-Source: AGHT+IFa3EHMZhsyTd0ZQsmXp7GofIg07IVPO7aN/D31RVhEa7jKRMgl/gM+Pwe88iWaXbVQNiE1eQ==
X-Received: by 2002:a05:6102:3ed4:b0:4af:a98a:bd67 with SMTP id ada2fe7eead31-4b2cc313aaamr29436864137.3.1735501642828;
        Sun, 29 Dec 2024 11:47:22 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:22 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v2 12/20] alienware-wmi: Refactor thermal control methods
Date: Sun, 29 Dec 2024 14:44:59 -0500
Message-ID: <20241229194506.8268-14-kuurtb@gmail.com>
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

Refactor thermal control methods to use alienware_wmi_command() instead
of alienware_wmax_command().

Drop alienware_wmax_command() as there is no more users left.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 98 ++++++++---------------
 1 file changed, 32 insertions(+), 66 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index ea276d32cf14..f80e7d488b9d 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -663,34 +663,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
 	return priv->global_brightness;
 }
 
-static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
-					  u32 command, u32 *out_data)
-{
-	acpi_status status;
-	union acpi_object *obj;
-	struct acpi_buffer input;
-	struct acpi_buffer output;
-
-	input.length = in_size;
-	input.pointer = in_args;
-	if (out_data) {
-		output.length = ACPI_ALLOCATE_BUFFER;
-		output.pointer = NULL;
-		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
-					     command, &input, &output);
-		if (ACPI_SUCCESS(status)) {
-			obj = (union acpi_object *)output.pointer;
-			if (obj && obj->type == ACPI_TYPE_INTEGER)
-				*out_data = (u32)obj->integer.value;
-		}
-		kfree(output.pointer);
-	} else {
-		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
-					     command, &input, NULL);
-	}
-	return status;
-}
-
 /*
  *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
  *	It can toggle between standard system GPU output and HDMI input.
@@ -942,7 +914,8 @@ static bool is_wmax_thermal_code(u32 code)
 	return false;
 }
 
-static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
+static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
+				    u8 arg, u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -950,14 +923,12 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	acpi_status status;
-
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_THERMAL_INFORMATION,
-					out_data);
+	int ret;
 
-	if (ACPI_FAILURE(status))
-		return -EIO;
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
+				    &in_args, sizeof(in_args), out_data);
+	if (ret < 0)
+		return ret;
 
 	if (*out_data == WMAX_FAILURE_CODE)
 		return -EBADRQC;
@@ -965,7 +936,7 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 	return 0;
 }
 
-static int wmax_thermal_control(u8 profile)
+static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
 {
 	struct wmax_u32_args in_args = {
 		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
@@ -973,15 +944,13 @@ static int wmax_thermal_control(u8 profile)
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_THERMAL_CONTROL,
-					&out_data);
-
-	if (ACPI_FAILURE(status))
-		return -EIO;
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
+				    &in_args, sizeof(in_args), &out_data);
+	if (ret)
+		return ret;
 
 	if (out_data == WMAX_FAILURE_CODE)
 		return -EBADRQC;
@@ -989,7 +958,8 @@ static int wmax_thermal_control(u8 profile)
 	return 0;
 }
 
-static int wmax_game_shift_status(u8 operation, u32 *out_data)
+static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -997,14 +967,13 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	acpi_status status;
+	int ret;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_GAME_SHIFT_STATUS,
-					out_data);
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
+				    &in_args, sizeof(in_args), out_data);
 
-	if (ACPI_FAILURE(status))
-		return -EIO;
+	if (ret < 0)
+		return ret;
 
 	if (*out_data == WMAX_FAILURE_CODE)
 		return -EOPNOTSUPP;
@@ -1015,10 +984,11 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
 static int thermal_profile_get(struct platform_profile_handler *pprof,
 			       enum platform_profile_option *profile)
 {
+	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_CURRENT_PROFILE,
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
 				       0, &out_data);
 
 	if (ret < 0)
@@ -1047,7 +1017,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 		u32 gmode_status;
 		int ret;
 
-		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
 					     &gmode_status);
 
 		if (ret < 0)
@@ -1055,7 +1026,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 
 		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
 		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
 						     &gmode_status);
 
 			if (ret < 0)
@@ -1063,7 +1035,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 		}
 	}
 
-	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
 }
 
 static int create_thermal_profile(struct wmi_device *wdev)
@@ -1076,7 +1049,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
+	ret = wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
 	if (ret < 0)
 		return ret;
@@ -1084,7 +1057,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
+		ret = wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
 					       i + first_mode, &out_data);
 
 		if (ret == -EIO)
@@ -1124,7 +1097,6 @@ static int create_thermal_profile(struct wmi_device *wdev)
 static int alienware_awcc_setup(struct wmi_device *wdev)
 {
 	struct awcc_priv *priv;
-	int ret;
 
 	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -1133,18 +1105,12 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
 	dev_set_drvdata(&wdev->dev, priv);
 	priv->wdev = wdev;
 
-	ret = create_thermal_profile(wdev);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return create_thermal_profile(wdev);
 }
 
 static void alienware_awcc_exit(struct wmi_device *wdev)
 {
-	struct awcc_priv *priv;
-
-	priv = dev_get_drvdata(&wdev->dev);
+	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
 
 	platform_profile_remove(&priv->pp_handler);
 }
-- 
2.47.1

