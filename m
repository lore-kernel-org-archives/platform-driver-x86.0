Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33AE1F8EFB;
	Fri, 17 Jan 2025 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101688; cv=none; b=FAKwWMz5pkBYPNqmnGCTL/oxUCKtobI34XuKp+wgRHpAmIZz0VITcaMDrwYxQemhhY2vmgiVpCOnuGLaUzsbCIzUC7VOKpa0YLw5319xnDUh/5ollkpV43Ov/rCRKlDeT4iiyShMYpV4bWU+I5W/WK/msa1WCTumkrAhwkcoX4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101688; c=relaxed/simple;
	bh=BdK/0dFkE3kAzFfYpLQ4pMFiRqHU0jtf+kPrMZxgsjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thbp6yjIki8vQmcGQswffjej/3DsgAsOXUfDMcVp7uEpjiPwQd6QUD7pQe5L+0yqxT1fF+DHASKTDwDdUs5G3OuXECmpXyNmxvVHztOT8puHnZxIJ3l71/AlUB4Q6yfmz2ZWm0ZNL/BxFCPaJJiNid3HIGOwuCWXF/ju5FvIO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc/BlkBh; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc/BlkBh"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4b11a110e4eso436601137.1;
        Fri, 17 Jan 2025 00:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101684; x=1737706484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgphEluZrZKzTChH7FvLNqpTzPyQlhjY5swHS5HHxoY=;
        b=Jc/BlkBh9JcBsOEH0KjX0WNa0Q0Nil8YqfJrIMtYPcePEmjabMkG89T2yk4hiAUDLD
         FsXmxjtSFT7ny7d2ttiw5SLdXn1Hla7fyq/wINcNQzP12O9cygp4ZzaHj7Jz0wgsVOhK
         qj3uLZlB2ol72jjiJEddNQ7kCNPzQr06zRtqaK1XR1GzBFf3sEdyVvrLtAUiT/v+X+QD
         NyQUaa5bRzcQGq1aD/LqZYVO4W2+xgnhZHlsHpslxgzY+1iWdEtmbzcLNEvWT06ggfxD
         Mv0F6iL9tZWG1RJrgyQaSTAjitQAnV9tyLfUOL7iot+HBSAJhZHOyq6ao90HqAid5AQR
         BbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101684; x=1737706484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgphEluZrZKzTChH7FvLNqpTzPyQlhjY5swHS5HHxoY=;
        b=QAJdDdyKTT8CbgttmgvauE9HtRDqdXskx7/v7Eh6caNmL85LrM1Buqzo5RRJw2+AK3
         uzUqO24mNbhdkHO9ShBVRL1Qhwv+PHScerfOMpWOqRnH4dOY9i6UPa4HwdUYlyZKCJrF
         iixKaHE1zQrPnq/Jibt8XKBWN27CS2RVhM+tSkdTVmQehSmP6ti6Nde2SE5H/fsJ6wBV
         yh5yVLCGHR3A9hdVlgn3Xn5d7oLP9H15XvbYAswCQcm54J55RdcTewbiV7fYgP3pTTwj
         JBgBGaWG3NXm/38e/0ac9gxoLQOeBhYyi6ZzFbZkMGn80PBgH+DjzVVVZxwvHx9rclWN
         jCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFjBXFXaUUdMHnE89EvWUPWS+HaQLblqe6KT0QjLFMJDSu9eoRAjsadjk68Dj96Tx8AFBPIkUsH5HNLiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB3gEhnjOiSUZod395wL5jgaMnJBzinWEv5BjpI2gNV+ARIH4D
	zLugU0frO88pN22dpyWPR5jPS3P/v8PUaIatpxAMialXKo+PB8qMKdStlQ==
X-Gm-Gg: ASbGncsNrSH/6nislGyAMFr3v6rRbYug5Pas4Ra4zKBjsT9L67zN249v0NFKzYArNZI
	gR+7L5msJN7DZaVM5HYNraOu3NToHs3ej7LeoLS7aV2CXdDQIDxVRXUlWj2HZYkiC26mCqtUyYJ
	/KX8LiUrVZGXfFt5Ata6fSPLXs93zUifQ9v4Ya5jdMV8BvTgvOSZrZ0s+g26GFx2QIyY0VLLNeZ
	AupulnHNLPNoLY8hzyyy7qVIgOsj+DQky/8U1lj9b3Ep/+tnG49wgjUKNS/pqQw
X-Google-Smtp-Source: AGHT+IFWKpQeK8Fsr7L8DPCkTqoVjaFrGMFezUETrgrQUD23BBKrqfdOIc2LiIwOcsIi53OizWMEgg==
X-Received: by 2002:a05:6102:38c9:b0:4b2:cc94:187e with SMTP id ada2fe7eead31-4b690c854eamr991825137.18.1737101684351;
        Fri, 17 Jan 2025 00:14:44 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:43 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 06/14] platform/x86: alienware-wmi: Refactor thermal control methods
Date: Fri, 17 Jan 2025 03:13:39 -0500
Message-ID: <20250117081347.8573-7-kuurtb@gmail.com>
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

Refactor thermal control methods to use alienware_wmi_command() instead
of alienware_wmax_command().

Drop alienware_wmax_command() as there is no more users left.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 87 ++++++++---------------
 1 file changed, 30 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 7f442428e45e..877b3d9d7cab 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -665,34 +665,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
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
@@ -938,7 +910,8 @@ static bool is_wmax_thermal_code(u32 code)
 	return false;
 }
 
-static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
+static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
+				    u8 arg, u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -946,14 +919,12 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
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
@@ -961,7 +932,7 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 	return 0;
 }
 
-static int wmax_thermal_control(u8 profile)
+static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
 {
 	struct wmax_u32_args in_args = {
 		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
@@ -969,15 +940,13 @@ static int wmax_thermal_control(u8 profile)
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
@@ -985,7 +954,8 @@ static int wmax_thermal_control(u8 profile)
 	return 0;
 }
 
-static int wmax_game_shift_status(u8 operation, u32 *out_data)
+static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -993,14 +963,13 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
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
@@ -1011,10 +980,11 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
 static int thermal_profile_get(struct device *dev,
 			       enum platform_profile_option *profile)
 {
+	struct awcc_priv *priv = dev_get_drvdata(dev);
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_CURRENT_PROFILE,
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
 				       0, &out_data);
 
 	if (ret < 0)
@@ -1043,7 +1013,8 @@ static int thermal_profile_set(struct device *dev,
 		u32 gmode_status;
 		int ret;
 
-		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
 					     &gmode_status);
 
 		if (ret < 0)
@@ -1051,7 +1022,8 @@ static int thermal_profile_set(struct device *dev,
 
 		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
 		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
 						     &gmode_status);
 
 			if (ret < 0)
@@ -1059,7 +1031,8 @@ static int thermal_profile_set(struct device *dev,
 		}
 	}
 
-	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
 }
 
 static int thermal_profile_probe(void *drvdata, unsigned long *choices)
@@ -1072,7 +1045,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
 	if (ret < 0)
 		return ret;
@@ -1080,7 +1053,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
+		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
 					       i + first_mode, &out_data);
 
 		if (ret == -EIO)
-- 
2.48.1

