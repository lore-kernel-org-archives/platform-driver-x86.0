Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE634155C88;
	Sun,  5 Jan 2025 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091079; cv=none; b=Hp5oOSZKADIOO87yFr9suh735XOZWa3Saoz+Sjdjfu58eTYPBM2bgMQBQy4HHsmy5O2FommxXoge6njScJH41RHnThef+nUkPixxCvNZLm5D7STbOFGWNmq3UMREKcmb/BU1YX74Vw76v6fD4JFUCmeVmFA/g8p0NCmslZmlmAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091079; c=relaxed/simple;
	bh=oShe4pLeM7LOpbU/TmP4vDIO/k3qHvNV/+mA9FQNNtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mocUCezvpcF+j7Tv8Y3pv8V/rYS7nqEcHKzfGPfa6HMf8ORi1IGN46q5/sd3h6ovK3APVsnLdbaotHE634YP9T2kSJfV8jbo/nWUf2eRMdY5ZsRcrWfk46DvUZhAVoBJhULEAyxRfll+xbYDmLY5TYyb+1GvGYfb7Wxp9AJBJik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V29G2DHe; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V29G2DHe"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aff04f17c7so8460384137.0;
        Sun, 05 Jan 2025 07:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091075; x=1736695875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uav5TmLEjJRghDn0i82XJ/BEXJCW5HI2DwMuKG+Hhy4=;
        b=V29G2DHeEd8tQe8onqo5fVlcuZBVScHptinbe3qlIrazRpbhZEcGcFAdfH07VNS0Eh
         /1ERYZDN3BTP14BYDOtWW3wWOATXD270lF7aasSY1LmkGBON6fyx81ZH8+PklNH5kGBx
         FHjRKu9a3Sz2dzHISYKKzeBqGO33c8NL3tGlV9HxxFrCKEeCyOFuEZPvDSnzHbgRoiq/
         FHqctJn2slxRhZ2IJ0m6xHcFCgDRYLsTQO2KrBWzQuUySrYnuFRA/LpiuLoKeAZkcz6I
         McL4XqICcRIY6G0ViKI16P1RQa0eYkFWUhuEC3+o+GsbxAMjRg9mvMLIAcz09JagFRTp
         4R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091075; x=1736695875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uav5TmLEjJRghDn0i82XJ/BEXJCW5HI2DwMuKG+Hhy4=;
        b=PIW5OD70xaMHX6bB2tfCqaHVcA6Pymy9W8qhVWrVPAJWkLPZLRQR7R5LTA9hN2mLOv
         tsNHCvHMYixqyMB3QmiphSH7gaOyx5/vpY7Vxt2H8DH7cHyda8hur7J93H8vZKJyc3lz
         ZDfztOp+F5rZb73SwAhSig3FaAJx4BCisXrM7K3AJyKIL9SNrKpnNC10OI7w5EuUI/4S
         Sn8RGTySczcivuYTA6yKAkZpS8YwzJAbQA0dQcgcRhl3l+jvooeLkRXr6hLQB/QKszJp
         uSAhFb3HR9PGKXhwGni8XVBxqb9HlrP/xoAUSVtx5xFQgkCqKeKourSTnwIIF64s9PMt
         UJwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCmLt9FVLv/lXvp7ZAAdx6DjDHQZ10O1Hr8OKiIaXoJmLyDt58Q7WorD3yBS/B3dIKfnkvjPRx7dUNtW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE3m4LJKQ4i3GZdelh8g6mCh3xWP3ORt0/ICyK8BeXYhiuZ7C6
	UuKfnMaCTC/xnG9LFWuM6yOeTIJUY2rJre8e79hVuitAOvltYP9lWZ2scA==
X-Gm-Gg: ASbGncvSslKZJwEAfa3L1FjeWIna9yCe+7Z0gGD1dc+c/sF5oLfZEFCVVK6aMnUSRys
	hGViJs94yhFkczD5D1B6dG+JHOXsDSxb9SN8qiihGuDPrdP4T3jtuZmezgut1wCPqgfTMN4PsZx
	nigUrid/ANdgKjA8dZv4wUFHVSRPhU+IfUH/lygStf8OG9Y9jzhCOxg5YCH6mCjCDrbwg+aDrr+
	LyI7CTiQlqLK4ekl2eF4aR9i6cnysc+Xu6qklamrtkZS9TU8ZHgg2napYs9jArv
X-Google-Smtp-Source: AGHT+IEpz+FOw9lpI98Fk+jRT7JGtIIRqvFrW0YP90Z2WIaSUzYakpkkeupAZ6Mj8+I4zY8nGqW4uQ==
X-Received: by 2002:a05:6102:334a:b0:4b1:f903:98d3 with SMTP id ada2fe7eead31-4b2bc01044bmr52673261137.7.1736091075616;
        Sun, 05 Jan 2025 07:31:15 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:14 -0800 (PST)
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
Subject: [PATCH v3 06/20] platform/x86: alienware_wmi: General cleanup of WMAX methods
Date: Sun,  5 Jan 2025 10:30:06 -0500
Message-ID: <20250105153019.19206-8-kuurtb@gmail.com>
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

Reorder variable declaration from longest to shortest. Standarize
show/store method names of WMAX's sysfs groups.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 67 +++++++++++------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 418abf46b593..190fee7539bf 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -725,14 +725,14 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
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
@@ -746,14 +746,14 @@ static ssize_t show_hdmi_cable(struct device *dev,
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
@@ -768,12 +768,11 @@ static ssize_t show_hdmi_source(struct device *dev,
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
@@ -791,9 +790,8 @@ static ssize_t toggle_hdmi_source(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(cable, S_IRUGO, show_hdmi_cable, NULL);
-static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
-		   toggle_hdmi_source);
+static DEVICE_ATTR_RO(cable);
+static DEVICE_ATTR_RW(source);
 
 static bool hdmi_group_visible(struct kobject *kobj)
 {
@@ -818,14 +816,14 @@ static const struct attribute_group hdmi_attribute_group = {
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
@@ -839,7 +837,7 @@ static ssize_t show_amplifier_status(struct device *dev,
 	return sysfs_emit(buf, "unconnected connected [unknown]\n");
 }
 
-static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
+static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
@@ -862,14 +860,14 @@ static const struct attribute_group amplifier_attribute_group = {
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
@@ -884,12 +882,11 @@ static ssize_t show_deepsleep_status(struct device *dev,
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
@@ -908,7 +905,7 @@ static ssize_t toggle_deepsleep(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status, toggle_deepsleep);
+static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
@@ -956,13 +953,13 @@ static bool is_wmax_thermal_code(u32 code)
 
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
@@ -979,13 +976,13 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 
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
@@ -1003,13 +1000,13 @@ static int wmax_thermal_control(u8 profile)
 
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
@@ -1078,11 +1075,11 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 
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

