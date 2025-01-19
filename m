Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DAB1E0DB5;
	Sun, 19 Jan 2025 22:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324371; cv=none; b=sTcEJYQl/s+fXvL8BCN4HqPXkWIXCaOuf450JNXnNrw56szlufAxpgo/2yorDaM7qu30AgPsznogSJ5IQCaLcSC4WpvXlELNrrnzILv3JgptdmZxoRtT7J9ths4Ps8IKEzdcCcrbixsUbJ3xTHMe3olfhRgZrCbAFktDdp0FEgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324371; c=relaxed/simple;
	bh=pIewIp0n8je7H/7kgA9gPSXhm1eAkus8bPryD6QRa0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2rPVmkwC+Dh+n0HbhU9fK5UP1gbWPHNjWIMvKES/8Rm8flcUIBP/NHLMhAiX21Y6FGW7pxqjonOqq9KH8UzkkZnO4qiUuH3Ral42Pa9tSD9/Vrvu/8HYtCMEdgZng7mh+JdoVvx/qa+VKOZzf+YOQRHNFht1OI50hfBo74aO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PW8E23U6; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PW8E23U6"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6f75f61f9so565131785a.0;
        Sun, 19 Jan 2025 14:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324369; x=1737929169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Y9APeuAfL6iQR97qdQAd6nOKRL80HJddmJvDteN810=;
        b=PW8E23U62/aAnOBoW1CBSF88WMEI7EAUShDSADN2HoCyU17tyBO50rFpQTG11lCWVu
         VYbSYZi1YHfpWkq4yq8xCZZc7BkIGfaYN0p+2f3HaUIAX6kwRT+3rE845lby2lj/VVDY
         Obclgj3hWhdcEZgQDAswoCrHnQZOoi4zvokH0IlYF7w2E5aBUwgMyS+6oKLe4ceKsk0a
         JbJHQYRYHPNjr5DidcODZqpCmEsfEE8/3m1rJYKDOYCzoXENP8bkBe0/CFMHsiiFmg7D
         3tuvAputStKEECK5xctD8NxZV26icMQTlcx8V55RLg77fYJU9v1YN54jNQxgMAR2AW+O
         eheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324369; x=1737929169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Y9APeuAfL6iQR97qdQAd6nOKRL80HJddmJvDteN810=;
        b=LdCYTk7fUXMEjD8vN+QUx+qIasZ8dipAiOYblBRK7Lg8mRLEvL7r5iBNHYkw0KIor+
         1RFLdC0iWlvTPajGwWLbx+M0F5GZvaVB1qnE7h2cr/acnsSQLRrQtBzNdSuQQqGIJG/X
         0xsQ3uEIEZozMy5Xdx32pEsLDyrrqinYshuzFKc1IV2V/mztsNS8dSBnKfzEWB/nNzem
         hFPkV7/6mNVhGXvUr1bZ5MmyP2AoPDJ72QwjXxhaINTjW45edayaKruUTumYLEkWJZBu
         SR524lk0c2CF23QbnjVTdrkW2ku5czg45rQ0k50NpyBDZLTCgjH9WZMmRUaSgCZcs5jI
         Gh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIrwjfC+chgoSIA6ngEUcpkq8pnfcqE9FimSWY1NVGqUtEqpwtgvaFsAY9Ffu7GnuQGt2y0ycqBGW7rgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWKdiJh7sNZz3bFNQ3ufaH7NPxe0NVUrXzBIrFJxCheStNdrm0
	eG/Yr6kBjUcd6RfMQ5ioT7JM57VswqrWQhsTVq/qy1LLrRH6IHyWu3RmDQ==
X-Gm-Gg: ASbGncsk0cg18OXmv4PreRq09E2Mq3u7hk1qHIuEDP/cA3tm5PKWieztD1ir/13W27M
	i8Lmn5pXsyMoWyTcfKi55/FoqSD6JETqSvx/gBDLNY9RaO/iMYjnx9nJDcuBwx4THJVB56PZqtB
	TCVaQ/OkgdjwGonPmqWHeSYbYWHm/zHmZnOUYVu+OKPIokR4CIFYvvx0gO1xo3V/k13jeuflLJe
	9TZwGFAXpa3F6xrdV/IC5zqp/uLkJH9L680mT9ZkxqGi2vq68k32ajdHcsjT9YfCet1wD6JLSQQ
	kw==
X-Google-Smtp-Source: AGHT+IFvyarFK2wpw1pXIZIitgCWfoxDiZAdRUz9LfgDYG+heAQxm15sNIivwvOywTjXSuf8RuEPgw==
X-Received: by 2002:a05:620a:24c8:b0:7b6:eab3:cdd1 with SMTP id af79cd13be357-7be6325dc77mr2011172285a.49.1737324368666;
        Sun, 19 Jan 2025 14:06:08 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:06:08 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 06/14] platform/x86: alienware-wmi: Refactor thermal control methods
Date: Sun, 19 Jan 2025 17:05:34 -0500
Message-ID: <20250119220542.3136-7-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
References: <20250119220542.3136-1-kuurtb@gmail.com>
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
index 3e9c00363a8a..d2a3d58a65dc 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -667,34 +667,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
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
@@ -940,7 +912,8 @@ static bool is_wmax_thermal_code(u32 code)
 	return false;
 }
 
-static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
+static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
+				    u8 arg, u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -948,14 +921,12 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
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
@@ -963,7 +934,7 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 	return 0;
 }
 
-static int wmax_thermal_control(u8 profile)
+static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
 {
 	struct wmax_u32_args in_args = {
 		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
@@ -971,15 +942,13 @@ static int wmax_thermal_control(u8 profile)
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
@@ -987,7 +956,8 @@ static int wmax_thermal_control(u8 profile)
 	return 0;
 }
 
-static int wmax_game_shift_status(u8 operation, u32 *out_data)
+static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -995,14 +965,13 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
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
@@ -1013,10 +982,11 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
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
@@ -1045,7 +1015,8 @@ static int thermal_profile_set(struct device *dev,
 		u32 gmode_status;
 		int ret;
 
-		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
 					     &gmode_status);
 
 		if (ret < 0)
@@ -1053,7 +1024,8 @@ static int thermal_profile_set(struct device *dev,
 
 		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
 		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
 						     &gmode_status);
 
 			if (ret < 0)
@@ -1061,7 +1033,8 @@ static int thermal_profile_set(struct device *dev,
 		}
 	}
 
-	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
 }
 
 static int thermal_profile_probe(void *drvdata, unsigned long *choices)
@@ -1074,7 +1047,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
 	if (ret < 0)
 		return ret;
@@ -1082,7 +1055,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
+		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
 					       i + first_mode, &out_data);
 
 		if (ret == -EIO)
-- 
2.48.1

