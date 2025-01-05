Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607A1CC8AD;
	Sun,  5 Jan 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091094; cv=none; b=fY4UcaJYJXyS4vUpmcrY7Exe4bTmnp2UnjSOdpupSlbStawOcRB1L3UsTSJ5FmfcHH8VHzoyF5GA9oO3VCRwOZ+4J+Z99r3Z354lsI7XDan2OIFkJpOwj1t5umlBhy0K4v00jT8wyz9P1lL0O6IO6us4Y8OXNU6/RGnDzn5WrHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091094; c=relaxed/simple;
	bh=2rrwwcjIdyc+5ZAs1ih/MwgtbNiEaL4Zn7Jxkt+IFK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjct18DZEPiUuAabI4nClz6UPO7YFlefFzlYjxzErXrMk6HxGCrWK4sYXWZgKWb95ulDFTkGHRNETHHOg7jz2lO7YHbLNRIRl2lLN+FyKXnfJjnnS1+rDoi59JD6LVB7Mfp6q6K+/E2+wyl4bTjAWOmgEb8mZtpt9n3kSP7Dbj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PotKQtHa; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PotKQtHa"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51873bc7377so4367181e0c.1;
        Sun, 05 Jan 2025 07:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091089; x=1736695889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymBGq2V9LpEqeCXPuiErKmGNmd/ipd+KpY7e8Dau4PI=;
        b=PotKQtHaumeUaEBRQOMfz9tAZOmCVh2ZppTUU+x7vR2luOlMgcTVjOf+OEyU5Ql2TX
         s9txoUY6z1AlQ2wq5B2rYGNzqhHiq+4RdIq9bcLaRqJ9pLA4RMjNLD6x7nk6n3Oy+j38
         XZZOlal6JIFlf1KF7z2mVlCNr7b7uv32zKLRi27q4n4S384j/dcvSWdhxpCzOhuISkrI
         PgrDY/j3EIQxhX1ndbilXoNc7MJJ5Mo09vPJg4Y4Xew1mVNoD1GTG+Ueh+92bvl/IgfM
         aI22h3pIz4J3y5GlmtkpemjObL2vEjtC3bOdCcuCcuySQH0JPadB8Z+L5q96flnw5q1B
         J2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091089; x=1736695889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymBGq2V9LpEqeCXPuiErKmGNmd/ipd+KpY7e8Dau4PI=;
        b=ddZyUpuHlhzYdjfYi5QZW7J5m/X/kW2dyd2yVp86ZqqpORWdXejh5PdnHyHi51bkB9
         vYng9vDIPBJSrfkmvjPjjePUULiYBiCY0GVWUzpAsmLnxrdw3rfXf1kUFnJA/G8RHbNR
         BvkB7E+zNl8xkrONj7etX1ETt90P9n/6pk3WReOQALB6UjX4v3LNkJm0CP2Vg2m2u7A1
         njFloh6KAhHdQvbsTQS0asKL2JWlDIaDTIsSVn/fVNf/gzKLYlH6JP3JS5kTpQwdXNV7
         xomGqfeu55OT1SkTByyhjd78qUMGsGqdP9DHB15qIQlXcPoEBylYT62oF4f4aN3NkXgm
         zRWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZUvzCFjhvkI9sy/K+aYs4t1O9MkBTBfgHIqRRWi3aaKottZ1Lq2gXjaqyrjlnGbyrsSyfGXkaIJUMz/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tFMsDwY25YLnax18dHV+ccy+FNerBxVSoYaNzdc6ZIHFtd0I
	3smRfq5w8D3HdFJg6TJ30Iiuu87mGJw0imixRRxwE0AuU6hDcWJXsZ3DTg==
X-Gm-Gg: ASbGncvSGmCZgH/5M/DkMtWxkrw9ZCLZhvNvTuU9WjH8SL8QQw4ZVtENahrZYiWXd2D
	pOZ9Zkh5qkFG4Av7VTPxnrWIcV+hiDoXm+vsTm5iUnmKokszxV/5w7GWx8Ozl8LSl43Z5zp4jMc
	1RY8S4SVyb/qwh0XmH1QiJcu29feYNAbnnXoqm4td0p6YVD+xB3P9APgpnMrKlB/17fl6QMtJUp
	SYvDv7q0w6+DLNvpCnQf1iY/tfg8GhQY3HMslqN/9QTJhyzQjvo+I5p6RF651g/
X-Google-Smtp-Source: AGHT+IGJQjqQWsOuPFaLbo2/aHSfJvgmnbBJLSs08YNS0h4yObPJAHNCcG+DLHmBZ5sG+XhC7mjU6Q==
X-Received: by 2002:a05:6122:88d:b0:518:859e:87b4 with SMTP id 71dfb90a1353d-51b75d71879mr38236711e0c.12.1736091089100;
        Sun, 05 Jan 2025 07:31:29 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:28 -0800 (PST)
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
Subject: [PATCH v3 11/20] platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
Date: Sun,  5 Jan 2025 10:30:11 -0500
Message-ID: <20250105153019.19206-13-kuurtb@gmail.com>
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

Refactor show/store methods for hdmi, amplifier, deepslp sysfs groups to
use alienware_wmi_command() instead of alienware_wmax_command() which
uses deprecated WMI methods.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 85 +++++++++++++----------
 1 file changed, 50 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index ffedb01e81d2..5918750a3bb1 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -700,51 +700,58 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
 static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_CABLE, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[unconnected] connected unknown\n");
 		else if (out_data == 1)
 			return sysfs_emit(buf, "unconnected [connected] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", status);
+
+	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
 	return sysfs_emit(buf, "unconnected connected [unknown]\n");
 }
 
 static ssize_t source_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_STATUS, &out_data);
+	int ret;
 
-	if (ACPI_SUCCESS(status)) {
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
 		if (out_data == 1)
 			return sysfs_emit(buf, "[input] gpu unknown\n");
 		else if (out_data == 2)
 			return sysfs_emit(buf, "input [gpu] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
+
+	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
 	return sysfs_emit(buf, "input gpu [unknown]\n");
 }
 
 static ssize_t source_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args args;
-	acpi_status status;
+	int ret;
+
 	if (strcmp(buf, "gpu\n") == 0)
 		args.arg = 1;
 	else if (strcmp(buf, "input\n") == 0)
@@ -753,12 +760,12 @@ static ssize_t source_store(struct device *dev, struct device_attribute *attr,
 		args.arg = 3;
 	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_HDMI_SOURCE, NULL);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
+				    sizeof(args), NULL);
+
+	if (ret < 0)
+		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
 
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
-		       status);
 	return count;
 }
 
@@ -791,21 +798,24 @@ static const struct attribute_group hdmi_attribute_group = {
 static ssize_t status_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[unconnected] connected unknown\n");
 		else if (out_data == 1)
 			return sysfs_emit(buf, "unconnected [connected] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", status);
+
+	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
 	return sysfs_emit(buf, "unconnected connected [unknown]\n");
 }
 
@@ -835,14 +845,17 @@ static const struct attribute_group amplifier_attribute_group = {
 static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
 		else if (out_data == 1)
@@ -850,15 +863,17 @@ static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
 		else if (out_data == 2)
 			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
 	}
-	pr_err("alienware-wmi: unknown deep sleep status: %d\n", status);
+
+	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
 	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
 }
 
 static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
 			       const char *buf, size_t count)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args args;
-	acpi_status status;
+	int ret;
 
 	if (strcmp(buf, "disabled\n") == 0)
 		args.arg = 0;
@@ -868,12 +883,12 @@ static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr
 		args.arg = 2;
 	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
+				    &args, sizeof(args), NULL);
+
+	if (!ret)
+		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
 
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: deep sleep control failed: results: %u\n",
-			status);
 	return count;
 }
 
-- 
2.47.1

