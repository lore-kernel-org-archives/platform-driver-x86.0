Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC063199FC9;
	Sun, 29 Dec 2024 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501625; cv=none; b=QEAFJF12VWT88yBj3WfHBz7oh3PRYg7GFm62CWtm8m2wRW6V2zLHdW6HuIwM3uuDZQNzIg1u3dVRSq3Zw2TKPtM4JFpwrejBXVpj4GgFLAVkiRflxJI3U3ieO3vMtjt4L7pYQ5CwWdlLfCQb18rD1HQgDeSKyebvCaDznYASqmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501625; c=relaxed/simple;
	bh=aWtmfYbUGt3AUntl2kId8jHcp6YGM5O7BSzUPltkV7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWqch3W98vzxfn1AwbclDBEtxA3aGQUQ+vMSt88GIFbXvDtdqQ2ZMAv8P8/EVdTaF1zs9PKAHMlbNjhuGfIprfGvl3nKmUZNIF6bU15k1Z3+GKzAY+WP+/F5+Z7QGNZNo3KrnDkZ0tVVfXPNaKtMYfPBtH8FkCT1/rOxD47mfDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFMDQr26; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFMDQr26"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4aff620b232so2668634137.0;
        Sun, 29 Dec 2024 11:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501622; x=1736106422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wye+J3w3PBzCSEvlZi6NGIkahK5mwUxnpk9LeMxtZXc=;
        b=EFMDQr263KBTepliD8DFNzLF3rypqsjQncqq4MNh/hoCch9Mn47qpOWvGEqMnys8xe
         1NN06/TNgns5thJsrTthT/u+F6OEI//tyYCHLrhXxIpD4tm8ixQvz3RzgwBKu55MRcfP
         tfAz9VsgExKZTFT1SFZudpf8Xa4o+zVYXKKLEt9yaVFjAmHRMLsWKh74jsiytp7f8vXW
         NFY50AjKPSGzRRY37ZTpIKSCwrkWs3Y5k0F/T8CvrmA1DuWfigBGbHyJ3K1LcrdMrZLk
         erK41Cd6pparuxz14OUaGDDeO73/jGiHrb/3P+2EDJrzZo8FqVmHVMA1HwvXW4hBIgDt
         FIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501622; x=1736106422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wye+J3w3PBzCSEvlZi6NGIkahK5mwUxnpk9LeMxtZXc=;
        b=sxqUhhnAPlamPOM0vWA0A2iolnyhx69AXEqdZb6EJjX1vJNPK5PobL4Vl7CMpneg23
         /K3+/OzW1U9OPPpLgQm4CQ/w0c30b/Llocdi5W5Y2mvbLuK5htCCH7qFO1dAft5gd2kD
         4YOv4yswRlD5vwVYSXytcZMTTSztCtIOLzhQuygSCX1pxd4/FFG7pzwGfSJ6sNXuLDb/
         EC05brGmAlPyv5M0xPyJgIkzVdWwVkF/VKBFOgkztoF9m2m8/QLZUhkDWkZ+KvUMWH1C
         REcEsGOv7WDJdPyT6XHrxbD2TiA4xXR4n40crl8TxwwnBiVzsxQsYNs7skvO4BBA8ZKf
         Hi0w==
X-Forwarded-Encrypted: i=1; AJvYcCUomShbS3Oe5u6btsknXifKxSPGicVEFbwy/qYxvRKVDthNTiK6Q5pHmZpH5NbnFzmGP4N5A3ihgQYjLr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YypEcUnMQVmSenG76MieAxrT4xzOHgoZqapuS5bx2NMOXX/1C4g
	n19VcaynfXjQyZ4IvyDVOHiD7xKaMZgqIMcvZoxh9+lfNGAuoEZxsQ+Hiw==
X-Gm-Gg: ASbGncudK2rnwcnAlty884C1C0ELqKDOUqKfO6WXwv82jklU8Mi4/5BbxQkibsl4Owd
	YzmRL1i1oUSnL5G1nyCMOls/AMSnuMFbjWTOy2Xe15IEWlaisb/RtnV50GFXZ9VIsQkocZqldIF
	74KJKuUuw+OJk38u/ZfoTmDkk/f9NvW28nOY29FUmcZ83L3Zj+JfJu0A3KnOpsY2CBnxcVmDNB0
	/nmbbLHpH05rEoCfoLLlvYhE+TCfcHoYPjnSg2UEyV14kfx8/dUNcOY7s/CCIeC
X-Google-Smtp-Source: AGHT+IE8Se3XCQO8/eiW+RtTfaq0e/IGnEPbGd19/aHu7A4BghMWMcZkKftd28q37z119CfSHtoeWQ==
X-Received: by 2002:a05:6102:c8c:b0:4af:de39:216a with SMTP id ada2fe7eead31-4b2cc31e717mr24043076137.6.1735501622560;
        Sun, 29 Dec 2024 11:47:02 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:01 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 06/20] alienware_wmi: General cleanup of WMAX methods
Date: Sun, 29 Dec 2024 14:44:53 -0500
Message-ID: <20241229194506.8268-8-kuurtb@gmail.com>
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

Reorder variable declaration from longest to shortest. Standarize
show/store method names of WMAX's sysfs groups.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 67 +++++++++++------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index d97e5e15a8f2..2c17160473a6 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -722,14 +722,14 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
  *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
  *	It can toggle between standard system GPU output and HDMI input.
  */
-static ssize_t show_hdmi_cable(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
-	acpi_status status;
-	u32 out_data;
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
+	acpi_status status;
+	u32 out_data;
 	status =
 	    alienware_wmax_command(&in_args, sizeof(in_args),
 				   WMAX_METHOD_HDMI_CABLE, &out_data);
@@ -743,14 +743,14 @@ static ssize_t show_hdmi_cable(struct device *dev,
 	return sysfs_emit(buf, "unconnected connected [unknown]\n");
 }
 
-static ssize_t show_hdmi_source(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t source_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
-	acpi_status status;
-	u32 out_data;
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
+	acpi_status status;
+	u32 out_data;
 	status =
 	    alienware_wmax_command(&in_args, sizeof(in_args),
 				   WMAX_METHOD_HDMI_STATUS, &out_data);
@@ -765,12 +765,11 @@ static ssize_t show_hdmi_source(struct device *dev,
 	return sysfs_emit(buf, "input gpu [unknown]\n");
 }
 
-static ssize_t toggle_hdmi_source(struct device *dev,
-				  struct device_attribute *attr,
-				  const char *buf, size_t count)
+static ssize_t source_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
-	acpi_status status;
 	struct wmax_basic_args args;
+	acpi_status status;
 	if (strcmp(buf, "gpu\n") == 0)
 		args.arg = 1;
 	else if (strcmp(buf, "input\n") == 0)
@@ -788,9 +787,8 @@ static ssize_t toggle_hdmi_source(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(cable, S_IRUGO, show_hdmi_cable, NULL);
-static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
-		   toggle_hdmi_source);
+static DEVICE_ATTR_RO(cable);
+static DEVICE_ATTR_RW(source);
 
 static bool hdmi_group_visible(struct kobject *kobj)
 {
@@ -815,14 +813,14 @@ static const struct attribute_group hdmi_attribute_group = {
  * - Currently supports reading cable status
  * - Leaving expansion room to possibly support dock/undock events later
  */
-static ssize_t show_amplifier_status(struct device *dev,
-				     struct device_attribute *attr, char *buf)
+static ssize_t status_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
-	acpi_status status;
-	u32 out_data;
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
+	acpi_status status;
+	u32 out_data;
 	status =
 	    alienware_wmax_command(&in_args, sizeof(in_args),
 				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
@@ -836,7 +834,7 @@ static ssize_t show_amplifier_status(struct device *dev,
 	return sysfs_emit(buf, "unconnected connected [unknown]\n");
 }
 
-static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
+static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
@@ -859,14 +857,14 @@ static const struct attribute_group amplifier_attribute_group = {
  * Deep Sleep Control support
  * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
  */
-static ssize_t show_deepsleep_status(struct device *dev,
-				     struct device_attribute *attr, char *buf)
+static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
 {
-	acpi_status status;
-	u32 out_data;
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
+	acpi_status status;
+	u32 out_data;
 	status = alienware_wmax_command(&in_args, sizeof(in_args),
 					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
 	if (ACPI_SUCCESS(status)) {
@@ -881,12 +879,11 @@ static ssize_t show_deepsleep_status(struct device *dev,
 	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
 }
 
-static ssize_t toggle_deepsleep(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count)
 {
-	acpi_status status;
 	struct wmax_basic_args args;
+	acpi_status status;
 
 	if (strcmp(buf, "disabled\n") == 0)
 		args.arg = 0;
@@ -905,7 +902,7 @@ static ssize_t toggle_deepsleep(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status, toggle_deepsleep);
+static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
@@ -953,13 +950,13 @@ static bool is_wmax_thermal_code(u32 code)
 
 static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 {
-	acpi_status status;
 	struct wmax_u32_args in_args = {
 		.operation = operation,
 		.arg1 = arg,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
+	acpi_status status;
 
 	status = alienware_wmax_command(&in_args, sizeof(in_args),
 					WMAX_METHOD_THERMAL_INFORMATION,
@@ -976,13 +973,13 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 
 static int wmax_thermal_control(u8 profile)
 {
-	acpi_status status;
 	struct wmax_u32_args in_args = {
 		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
 		.arg1 = profile,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
+	acpi_status status;
 	u32 out_data;
 
 	status = alienware_wmax_command(&in_args, sizeof(in_args),
@@ -1000,13 +997,13 @@ static int wmax_thermal_control(u8 profile)
 
 static int wmax_game_shift_status(u8 operation, u32 *out_data)
 {
-	acpi_status status;
 	struct wmax_u32_args in_args = {
 		.operation = operation,
 		.arg1 = 0,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
+	acpi_status status;
 
 	status = alienware_wmax_command(&in_args, sizeof(in_args),
 					WMAX_METHOD_GAME_SHIFT_STATUS,
@@ -1075,11 +1072,11 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 
 static int create_thermal_profile(struct platform_device *platform_device)
 {
-	u32 out_data;
+	enum platform_profile_option profile;
+	enum wmax_thermal_mode mode;
 	u8 sys_desc[4];
 	u32 first_mode;
-	enum wmax_thermal_mode mode;
-	enum platform_profile_option profile;
+	u32 out_data;
 	int ret;
 
 	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
-- 
2.47.1

