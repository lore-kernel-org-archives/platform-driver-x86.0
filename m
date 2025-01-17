Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDC11F8AFC;
	Fri, 17 Jan 2025 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101685; cv=none; b=VR+5Vf5od0NGo6lLBYdTe53uwaFBCbUoSh2qL4zl+laOgh6ns3ksBU9x8Dh30q67hTNS4F06JtzjEeu3KCTO0r4KUfMj81rRhLDWVzqUPLoPt0ulemPSDTL1FlpSZK2705R5zQ7SHWOhBvgzk3vTW5A0+0B1yfpJLd+18WBz19w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101685; c=relaxed/simple;
	bh=KPjCMeCjuSpomQ/47uWDcRsf93H3YeKwjqNfGVRgoZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVkUDpTObH0UaiHvSe8g6O4slG11X37NOSwl11mpOvJzy90QKxzlkTP9H6wkeElGpXwc9F2NLfC2O3Db49o8OmQu2w1CeJMtGMER7CMgU5zlyHzD+qcf+lRiQkUROJ/etEmmoyw7nTGmEfOBd/7/EHAdJ+HU6rrHuQ9oZ4MBtLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZk4MoK6; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZk4MoK6"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afe4f1ce18so460606137.3;
        Fri, 17 Jan 2025 00:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101682; x=1737706482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdHh66QOBSFX+cnU/Ol0XkXtY/TaGxy79QZuKQ5Fph0=;
        b=mZk4MoK6mGmjAisw3XhJ4vO6z/+cb139hvbja14zUer9we/bdSrZj7eE+IZ/LPwsQL
         ynDrT46PEDa6nPP4DWSuWIfK8zYrLdPRuN9BkB2miy6B7ayuIxUe/57Pt7iRe4lwqoR1
         +f/4YwR9bQsvjlCXN+mn369iPXNBw5U9fYiuarmwzI2CRDqQMWD2bEi76QTz2e0blLDX
         LBobmAIwUjUgyVZ1Zu0qMxniogkHVOuMT/5ZdLHji5GlmWCdONuTjE2OuFNkBLNbmGIs
         nUZJKBOBcea9tL1GuY7kA1Zyy2uJvOAd1H3BZSvYjsdvZE7EaV4mFNOPdDiECEcJO0+A
         nq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101682; x=1737706482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdHh66QOBSFX+cnU/Ol0XkXtY/TaGxy79QZuKQ5Fph0=;
        b=fOwk09sCxEIQNxIsRcUBtiMDM35J6R6FhHtudu5sTTGu8Z5vx9h5s4WeJNfuCjNz48
         t1H2vLA96Fj6tA9AjUjiatcerfF9FoOtPng/Nt8oVy73SSKYZcQaDlsmOXWskZb9p4QT
         e+F5vdAQCSmLUj0lFdpizQlBQI7MhG+93J94XKnX3o/PZhP+DbdYvm85cMzBC0MUcYhR
         jjqAjUnDl5GSmJZ58/l8LUhUr5uzr4pfYvogTxpCNKBBEBWjHPp55sb8170OVCh0UQvy
         4EcWmOQAxjW/1eeAKw1M7G5ljqzIx5znI9sxz0I6t4LFaNIdOIWDxh2oZ1LyLiwWG/yV
         d9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfy4b+xWrufv+aA+974wctXHfNIpPDJaG4ItAFgHzf/qHIABbmT/NgP3sGsRruZo75ekpYP569GA7mw6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9jew+CbgiY7HHDqL9z65htWvzGv3lvkJDwvGccNf7Yco/qL4B
	0lGWfu94qZscrMCaej7I1qAzPx5dHBsz8bXxAPKcPSNqFZvJNvkTbg83Zg==
X-Gm-Gg: ASbGncsdo8PvP4Y0v9tE4hlli8g/qeML+xjtQLTji1D5NBbZ/CUl2PrFV6Bqxkjb4XJ
	Bhh5wvqnnpV46DKYWKa2GZZkYLBOnx7fPAFbh+0wWiFB4p3po0/T7iHY0989rZFmwy7YaV1l3p1
	6o8/Jm5Mr022UNhNkRiWs2+j1ai14rCaLBZeyJT/bzmkamlU3d9zRYgAqI0HhGUGXOHMOMftWET
	hFKyXXOjznJ2t2zMeD5RUA0OX4wv5XPAqXhJlr7ws25cT/GA0HqUaC3V5Gqk54t
X-Google-Smtp-Source: AGHT+IHvFVnt82S52NIQQzhl1eJWssWbqhswWz+QGVpbBGjrX5zdV4OwIrVM1eDi37ixGBG3QpJWbw==
X-Received: by 2002:a05:6102:b02:b0:4b2:9e8b:54c with SMTP id ada2fe7eead31-4b690ccd378mr1090161137.24.1737101681936;
        Fri, 17 Jan 2025 00:14:41 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:41 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 05/14] platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
Date: Fri, 17 Jan 2025 03:13:38 -0500
Message-ID: <20250117081347.8573-6-kuurtb@gmail.com>
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

Refactor show/store methods for hdmi, amplifier, deepslp sysfs groups to
use alienware_wmi_command() instead of alienware_wmax_command() which
uses deprecated WMI methods.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 80 +++++++++++++----------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index c9d9cf36b87b..7f442428e45e 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -700,53 +700,57 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
 static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_CABLE, &out_data);
-	if (ACPI_SUCCESS(status)) {
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
+	int ret;
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_STATUS, &out_data);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
 
-	if (ACPI_SUCCESS(status)) {
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
 
 	if (strcmp(buf, "gpu\n") == 0)
 		args.arg = 1;
@@ -756,12 +760,12 @@ static ssize_t source_store(struct device *dev, struct device_attribute *attr,
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
 
@@ -794,22 +798,24 @@ static const struct attribute_group hdmi_attribute_group = {
 static ssize_t status_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
-	if (ACPI_SUCCESS(status)) {
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
 
@@ -839,15 +845,17 @@ static const struct attribute_group amplifier_attribute_group = {
 static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
 		else if (out_data == 1)
@@ -855,15 +863,17 @@ static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
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
@@ -873,12 +883,12 @@ static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr
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
2.48.1

