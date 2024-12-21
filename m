Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77051EC4E0;
	Sat, 21 Dec 2024 06:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760828; cv=none; b=Zo/sTQpNpWWHIVLA/etPhKQkllgR6St5POkDAJoKQhxOP9B1BYFGoHuEvhAmTpS4XdhmcACZ9Gk1MQK9nV/2vrtIESePVoT8goqlqDkWVVLJZzY9ACClmLIzM8Da/OoLNBJu3kH2DJfWl1ESUskI8lctA73mskdYuG3MLS/Mzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760828; c=relaxed/simple;
	bh=psLckmhsobLJeOO/dpIkLth2Me8zNx+vLLptUHAcOos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxDeLYAVsMd4WME1VZFCJVvEnQV0ft8kZ+Ntm4uLBNfjrJFo0bJuOiS/k1M4e4uUpuYLrInz+InRhulnKZjE9fGUjmrmKj/SQxvET/92GbIgrvgeltd+4q7e+xGKmK9YI865g0hJgfB/TpFZ3te11pdBowqsoE4BOn1bPDNQxY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GF9pATbW; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GF9pATbW"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f27bbe8fc3so20451747b3.2;
        Fri, 20 Dec 2024 22:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760825; x=1735365625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXI8QbnRrPpL1WzHc5LtEEypsL+PMy3TXkjv2gjKxtk=;
        b=GF9pATbWtvRzwm+rDIIX5n0kBUgZeqyejyiqY9rBve70QMYImwY6u7XoLV8ptPssS8
         9CNy2m6csG/BTBvvcC+YbqmHaY274+i51Xs7TcV35XuCNhdYnS2FFEvAxqdGRKV72wPt
         MVu/zYbtH3Xnx0/bkRNkLXV/LDUZDAadr3Juc2cHilwHonYd2LIjwHiJKW7A0piLowYb
         VP+sNWldrbqhpTwKUsRzKZ0HOhvK+UGH3Mn/ezZB4ZfCBf8jGKmX+5EybOjSquqZchla
         ZiJDvCrVZ7trHYC0SAie/iJtC/ONGOrhtU8UTpCzh4uw77SokQIgs/xTfIMENKki/Zrv
         WhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760825; x=1735365625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXI8QbnRrPpL1WzHc5LtEEypsL+PMy3TXkjv2gjKxtk=;
        b=vsazUq6NyghYpv1ilh8TPHKSdg7oRS8aekCUHxybLS+xLr5LJfFtaBTDp+d8KDRQxh
         XNS6jbW2bbsLrQta2z+DPGj44OwdiRBkBSLOnK1LR8BxDQMJ7pP6U80hm/1/mFq5qtM+
         peQbK2k3q6z9tFEr2wfKVryG7T/dkCY2LSsVp6b0xuDjH9OwnL6TU8T4TofxYne5VwhT
         IDq7jyxWGgy2qaVFlffFoj2ZXr17Q4A2x/ZtQ3Vj+XokV0/y9GFqzjlJJR9pc3Qq07xd
         vhXZgC9yGoAx9u1HO2cgYUj3AY9jzkmyrTXIA2NZoieKKOHGE7iX3RcIFb7IL6FzgckL
         cNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBtXcNbjh8XMPv7/SqbPkdwczPag54mRlWHLXETv078OQXmqcibleRVDcBMWEi+lzirrqHsjUt4kH6bFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8shCLFfOixwfyiQRDMSenVKdUHlWlLAi4sws5HcD2R/0Spo5O
	KmbbicrnieTbFmCxUp5pLJGJLg97Pb7oHiPRlI08h7TvJUWPsphqzxu60Q==
X-Gm-Gg: ASbGncuidHzKnuzy9PLDBnN0mbXAON03cTLU5kZm8p1DUFcvNP4AoCk4CibgAizAanM
	qiYJJdY8V6mZKaPZL6xcWKpNWocfjXqGEq3CdUhRwdGLrjMxHeINewiMW7tK+X7A1bvfrnEee4G
	dyOBWwxAGlELiCcaCrL43LoukuDTqhUNV5n9/kCxl5QGFOP/D1R/Ol3dsYiu8QBYcXbJGxpuS7p
	hacoZ88iQI5vdIUtuz3xBJWP6nR1rlNRCLdpNPllbYHWY+17z4u05E9jwYUzjVe
X-Google-Smtp-Source: AGHT+IEg42d9AWTXB7WZWBMpPRRDbMvg8D2vl05bSWpXAtUVhlyR9QdrN+tqj6Y/NmU8Bjs1ZZQi5w==
X-Received: by 2002:a05:690c:6388:b0:6ef:6d61:c249 with SMTP id 00721157ae682-6f3f825a643mr51531917b3.39.1734760825358;
        Fri, 20 Dec 2024 22:00:25 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:24 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 12/20] alienware-wmi: Refactor thermal control methods
Date: Sat, 21 Dec 2024 00:59:09 -0500
Message-ID: <20241221055917.10555-13-kuurtb@gmail.com>
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

Refactor thermal control methods to use alienware_wmi_command() instead
of alienware_wmax_command().

Drop alienware_wmax_command() as there is no more users left.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 69 ++++++++---------------
 1 file changed, 23 insertions(+), 46 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index b9da5fe657a9..0a0b72dc61ea 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -650,34 +650,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
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
@@ -932,7 +904,8 @@ static bool is_wmax_thermal_code(u32 code)
 	return false;
 }
 
-static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
+static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
+				    u8 arg, u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -942,9 +915,8 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 	};
 	acpi_status status;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_THERMAL_INFORMATION,
-					out_data);
+	status = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
+				       &in_args, sizeof(in_args), out_data);
 
 	if (ACPI_FAILURE(status))
 		return -EIO;
@@ -955,7 +927,7 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 	return 0;
 }
 
-static int wmax_thermal_control(u8 profile)
+static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
 {
 	struct wmax_u32_args in_args = {
 		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
@@ -966,9 +938,8 @@ static int wmax_thermal_control(u8 profile)
 	acpi_status status;
 	u32 out_data;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_THERMAL_CONTROL,
-					&out_data);
+	status = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
+				       &in_args, sizeof(in_args), &out_data);
 
 	if (ACPI_FAILURE(status))
 		return -EIO;
@@ -979,7 +950,8 @@ static int wmax_thermal_control(u8 profile)
 	return 0;
 }
 
-static int wmax_game_shift_status(u8 operation, u32 *out_data)
+static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -989,9 +961,8 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
 	};
 	acpi_status status;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_GAME_SHIFT_STATUS,
-					out_data);
+	status = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
+				       &in_args, sizeof(in_args), out_data);
 
 	if (ACPI_FAILURE(status))
 		return -EIO;
@@ -1005,10 +976,13 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
 static int thermal_profile_get(struct platform_profile_handler *pprof,
 			       enum platform_profile_option *profile)
 {
+	struct awcc_priv *priv;
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_CURRENT_PROFILE,
+	priv = container_of(pprof, struct awcc_priv, pp_handler);
+
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
 				       0, &out_data);
 
 	if (ret < 0)
@@ -1039,7 +1013,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 		u32 gmode_status;
 		int ret;
 
-		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
 					     &gmode_status);
 
 		if (ret < 0)
@@ -1047,7 +1022,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 
 		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
 		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
 						     &gmode_status);
 
 			if (ret < 0)
@@ -1055,7 +1031,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 		}
 	}
 
-	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
 }
 
 static int create_thermal_profile(struct wmi_device *wdev)
@@ -1070,7 +1047,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
 
 	priv = dev_get_drvdata(&wdev->dev);
 
-	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
+	ret = wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
 	if (ret < 0)
 		return ret;
@@ -1078,7 +1055,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
+		ret = wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
 					       i + first_mode, &out_data);
 
 		if (ret == -EIO)
-- 
2.47.1

