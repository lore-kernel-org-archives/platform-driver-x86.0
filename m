Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A8157466;
	Sun,  5 Jan 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091097; cv=none; b=ipNPlFtMwWPdp64w7CGfu+JsZ+L6HEgTBvozc7K+2SYgfe5YYvdjrUlJyvBCEVHNmFwdjeKriJSpp8nCJ/tvBnXCDcjL4uAL4iZdDSjCsNFeW1s6jDeEhtHVuNZEFDW0mgFSjPoPjV2D63Xl6SplYsgAlKBZJPOjUCv8j62fAc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091097; c=relaxed/simple;
	bh=quTStQICPnEeyOaRj434h3zO/qzGXijhZhMycUBFDxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YYQtKylqss8xoElJgR2LyCrD0pK97wkPODIZ8cBVloG/jCUgjycJXfWY4efPHGr8bNn/zwtqc2U0YNswueAK5Qc0OKEQBS20E8u9IAWGldbxbyfBnR4sE0csIvNrkvpYFTI8N6llGy3mcCt6rtMdkcIz99gz1lFnIwQUMhZ8PQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cODWmsG9; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cODWmsG9"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4aff5b3845eso4907901137.2;
        Sun, 05 Jan 2025 07:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091092; x=1736695892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2qwtTU6ZYZaknQwnWFEkd4Qbc6jF/mwpsElYqofglw=;
        b=cODWmsG9UOdAAljbSPde5mb5b8LD3j2/CKpGSusk0Ps6W+FCT5xL3bk5RrXHAFnmIk
         yQLiXuyqC2HTVk6cpL1A4KZaSiyveG7bw5dOFaZPrtkBpqZmda0RVG+yjVfBA3Q7MjRb
         p5sJ8ktwl8QPHKxhcTl7MbOkpCbxWViMQlJukZlalYKYZqkcwzHcpl151HyHnESvspFS
         b0bEKxkDBbJrV05XB0JhH1GRzvMwxDHHLin1rW4CqYvZgPE0nS9X88ypFLIG47GiwQ0E
         n6zihzVUWMiBSz0/aLAVdPSW/KHZlafmmTuxT/fatIUV2MVwouY22OlrE9gFHt2DBNIp
         oN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091092; x=1736695892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2qwtTU6ZYZaknQwnWFEkd4Qbc6jF/mwpsElYqofglw=;
        b=mxhfyv1P1LSsjEBq7i2W1pONGyIUhO9ZBxIA8d316RK8zNJQ4nVFTtkC4/6R/TzlQB
         +JlZ/RDeGUDwEJRf/khw8iAzctARmhQezjQ2PQaqdWND3gWaC90kEiYdzKxv1zXDAY4r
         yX9SoJRfYkIXZADcJEXrpISpujgx+xHEgAKmG72NKmO4qVIGsXzrKCG9HQljfjW5Vir/
         jR4fA94LXeQqx6I1NoEkvr3+aRNcgqAmfpwuooS3lSy7NFGTDhV5TdCymF+g5c3VNSDk
         aHKxqJt/vFLfSAJhLBLK5emx2sOKQ6uNQAx71K2lAEJo7EJDM1rmJuxB2kbkJ5G7JYzZ
         ZWeg==
X-Forwarded-Encrypted: i=1; AJvYcCVwwGS5ArB6rpte8FRPGP7UD7gZLyn3Bd/OCHcyYRRgnOUap0heygSM/cH2VGU/RRx6NpZbOW4JI71I+8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/6J/WCb14Y/pg1dOjjh/iYu0HSQhbKuE2o1ms2HboaZZZr1s
	3DS9HFmf65haZ7aT/ZypWhjmWiyfKnXZ9Q6VFG755BZSwtn7D/Kyx52Zxw==
X-Gm-Gg: ASbGncsseNq/utCawcqFqrbUiGpH6j5TJIUqic7TPaHaD5GhpfbaeEWmCr7CNuW72zI
	aTWyX5yebJJIvMkHU5JwrPTp0PHZxnpqs1ReGt2dhIwXwWpJrIpsb0edW4lMG84aF/PwBogqebe
	Lg954aLqNjKxrf1wbwf6KVRSvrZFo3NQff6YU3BhQG91Nxvpf4gspqx4Fg25AbiiV1PPi0e3wWC
	sVElN5vyeykOgbIOlJSpb8xdVdNXJ7ubDLV2kE/uCVdAnGVEQ0lmCf2wU8Og22+
X-Google-Smtp-Source: AGHT+IHZOjAVpuHiFUh588MVyRAJwAGuXut5BeqwSHa9HAEFBcgcPDmA5nQMP2cFICHD2G1XV8800w==
X-Received: by 2002:a05:6102:3a0b:b0:4b1:2894:1048 with SMTP id ada2fe7eead31-4b2cc351e2bmr44293486137.10.1736091091658;
        Sun, 05 Jan 2025 07:31:31 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:30 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 12/20] platform/x86: alienware-wmi: Refactor thermal control methods
Date: Sun,  5 Jan 2025 10:30:12 -0500
Message-ID: <20250105153019.19206-14-kuurtb@gmail.com>
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

Refactor thermal control methods to use alienware_wmi_command() instead
of alienware_wmax_command().

Drop alienware_wmax_command() as there is no more users left.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 87 ++++++++---------------
 1 file changed, 30 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 5918750a3bb1..c75ad7ef3d54 100644
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
@@ -1043,7 +1013,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 		u32 gmode_status;
 		int ret;
 
-		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
 					     &gmode_status);
 
 		if (ret < 0)
@@ -1051,7 +1022,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 
 		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
 		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
 						     &gmode_status);
 
 			if (ret < 0)
@@ -1059,7 +1031,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 		}
 	}
 
-	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
 }
 
 static int create_thermal_profile(struct wmi_device *wdev)
@@ -1072,7 +1045,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
+	ret = wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
 	if (ret < 0)
 		return ret;
@@ -1080,7 +1053,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
+		ret = wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
 					       i + first_mode, &out_data);
 
 		if (ret == -EIO)
-- 
2.47.1

