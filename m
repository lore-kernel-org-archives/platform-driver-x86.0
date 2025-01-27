Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F101FCD0F;
	Mon, 27 Jan 2025 04:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950674; cv=none; b=rh+rjOmgzKYAnpl5zAZx5+Uxa53Byf7pmsxC9rZGZUQFWLZU8hkwhRI4nP9jqJKaDPuE+b+IzrDAQAkp2ryckNbkf+yIMb2k1ehxQtb+NLTfVd1X7AuBMs+wvsc2Y6TE8EXFzqZwVsrdNovSzNHDUKZ+IeMx2WGI5+IDnoLuVWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950674; c=relaxed/simple;
	bh=fHI4m/Oje8Ryria7VccWqLnfvI9YVfJmZg77Dtbl1Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpjzKmVyBbBSGG20b/cHknQEoa3VU+fzGkHXY2uc4SFu2Li7CsIpiwC7e9NSAidmcubSnOR+h+HHcS5vJKPRyamNCpLBgqQlq3i5e7piqyjWLeJtpu+TZumJn3tP9DrzyWx0U90sB9Rqa2UFGQmQS9H/aXyEa9qMQs19ui5xywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGrzpBRC; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGrzpBRC"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85b83479f45so720355241.0;
        Sun, 26 Jan 2025 20:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950670; x=1738555470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAWB5RQklM3C2ywwTH+XmhIc6sj+0+mcpfjHWcxM4BA=;
        b=HGrzpBRCs40kpuJrZdyh6wGTBood3gSICpBX6XuyeUjH0N21W7hKAwpPW3QwMA+dVt
         iyOLpNaFoHsehx/RfvFDKzESs/1aOBhEnvdLODmfqzvs5rBJzQjvMfxxDL4PJBVH9/xX
         ysCgzq1gFEER2xxsBztbBTMc1Gt9BeRaVyqvKpafaFH7lma4+nIk/HrCQzwdceCzpHMx
         Si1wyZj+eBYYHeEHp6F0pg5umW5IhfxHb7ebyQFno6YNvMUJaK5E8eJDWa9wU6Z1i+Dk
         TFvVUs3wCL85hmIEdibgeBfFnMacc4YZcQvLCr+S2VSAt+ceFq2rrolmswLKX+peZnBT
         zoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950670; x=1738555470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAWB5RQklM3C2ywwTH+XmhIc6sj+0+mcpfjHWcxM4BA=;
        b=IOfQkbxrWGk7TDmfgrBK/YCSIKEpqYg5sl2pT6xdY/esbSwbR3kidf/jnCzaBS0rsP
         o7feDOwkPPX9eXWl5th9JOnSlfowNlySSgKoeYsSchEs999ureTVs+V4Ne2NpwCsglYn
         aTsk+u/JPHaYMd9p+x15fSnkOAKwOj5UBau8nUh1+CR0KRhTA+F0hlIl+9Ladm39eMJA
         rRzRNdzct6XSHWZEP4VcX4IMDTIqUfQSh0LrHIO7w2yvaayrLjhkuvpIYtpjEFDfhzWx
         OYo3am+LqPkCB/baWnpRriWGLD7+IZkGE8bGUaiRvof1l7SW9borrfsCv4qNKy8R8uLl
         eoDg==
X-Forwarded-Encrypted: i=1; AJvYcCVt4UxLocm8R9nwPGg0MduTBV0BxA/uu+W+4/oT2MnF2dNqoHqJKEaDu7o4b8ahcPnplrgESSjf/nw6KyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2KNAVfEUmjf0gF0cAHY12M06tBRuTAVVeqzPGG3S9TZTjz972
	8zXT8IOEVcfIwWZ2mH4vfh3QqKgEYVZkMC5s2srYkAf61XIkzb6tZ4syNw==
X-Gm-Gg: ASbGnctAA5bWP0QmaPlanNdamXBwIydlGDsJTotMzkN8GCu9bj8dNcl75k9oZVojis+
	i4eMseFoH7pngkUSp8yMfIQnHic9B+y6Sy+N5687ufwysoW4eTj9LZHQfSp8dN+82LO9ss+yluA
	65ZoYNHhl5vj41lwMKPuqKksyTOVYpU1iDV+79Alic+1OB7/B51ADUB9MJ3oumzEDdF3+OoDNph
	n0AaFDjBq5FghNrjClbmB5kdxTZRNylodSE0jJJ4xDAf1XWehvPw9F0QQv6ikADRRBvnAfAnBRa
	jtq//vnbFhC/
X-Google-Smtp-Source: AGHT+IFcqJpeBEGfYFOSwq+yVxG/mFCXQPfVZGw8K8b+ocJq2qvhwLyHtyldmXB4CzBC1Qfu894VEA==
X-Received: by 2002:a05:6102:cce:b0:4b6:1efd:5c with SMTP id ada2fe7eead31-4b690ce3fa9mr32980888137.16.1737950670053;
        Sun, 26 Jan 2025 20:04:30 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:29 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 06/14] platform/x86: alienware-wmi: Refactor thermal control methods
Date: Sun, 26 Jan 2025 23:03:58 -0500
Message-ID: <20250127040406.17112-7-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
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
index cfdd9c1cfebf..cd2bcc0af282 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -676,34 +676,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
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
@@ -949,7 +921,8 @@ static bool is_wmax_thermal_code(u32 code)
 	return false;
 }
 
-static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
+static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
+				    u8 arg, u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -957,14 +930,12 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
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
@@ -972,7 +943,7 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 	return 0;
 }
 
-static int wmax_thermal_control(u8 profile)
+static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
 {
 	struct wmax_u32_args in_args = {
 		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
@@ -980,15 +951,13 @@ static int wmax_thermal_control(u8 profile)
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
@@ -996,7 +965,8 @@ static int wmax_thermal_control(u8 profile)
 	return 0;
 }
 
-static int wmax_game_shift_status(u8 operation, u32 *out_data)
+static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -1004,14 +974,13 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
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
@@ -1022,10 +991,11 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
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
@@ -1054,7 +1024,8 @@ static int thermal_profile_set(struct device *dev,
 		u32 gmode_status;
 		int ret;
 
-		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
 					     &gmode_status);
 
 		if (ret < 0)
@@ -1062,7 +1033,8 @@ static int thermal_profile_set(struct device *dev,
 
 		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
 		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
 						     &gmode_status);
 
 			if (ret < 0)
@@ -1070,7 +1042,8 @@ static int thermal_profile_set(struct device *dev,
 		}
 	}
 
-	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
 }
 
 static int thermal_profile_probe(void *drvdata, unsigned long *choices)
@@ -1083,7 +1056,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
 	if (ret < 0)
 		return ret;
@@ -1091,7 +1064,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
+		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
 					       i + first_mode, &out_data);
 
 		if (ret == -EIO)
-- 
2.48.1

