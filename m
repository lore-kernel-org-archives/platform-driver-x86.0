Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADC21F37B2;
	Sat, 21 Dec 2024 06:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760826; cv=none; b=uqpP8FCXYRjX2BvU6FykqP0entkB3tRl9YRIEhfaYnLXjMsGkMuWQwapLRGlxCgd59L6olfyge+InnJW5MlizekpHuIUweScSMgyGR7ugbPKV9VVOkeEEarIiW/EABA9x+naYB29frGTst53hMNlaNQWhvn1Y+MVx98KRJdLyFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760826; c=relaxed/simple;
	bh=xPA6R5La2E+9MfodB0Sl2AfXcf5WmAYv7SEq+INex6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnoodZ9BGZZQh3UlNcv6AWz5I9GsOcG+lLayy3wBTJsIhOZKMgMgg7gx0AsJv9i8hA4cnV4iw8B1EaOF6BImWiun1AGAETPlZhSbzpgKKoBLaFuofT2QrmOGy4jgGjmbVziKcjdv55oNMdOeeiwptT760OJIqsusZZGCkUTtIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnQpEMXv; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnQpEMXv"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ef9b8b4f13so22989017b3.2;
        Fri, 20 Dec 2024 22:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760823; x=1735365623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P216bbBhvCShPSkXdAJnbA17pOkwI5/lxUifQLEloWc=;
        b=HnQpEMXvFB3vow7XfFMrVGzXHPgqyq7Qj9w7dBeX1SD3KV3IXzl0NLaAj6MpVcUgvW
         iHjrEkFHk9jrAVZBdROzEdKav1SNzJCy0NOEakOfAPvFvCDh0cf9+2N9+ytk//rpcA35
         L61RniRLiSyNf0os+cV6dQAUsABI9u/7WMUjE8HhzG7AdwLn7ZbCjBesde0va3TFXz+G
         sSshxy8TZ07qGVrAJiDHYvQfUwzICLn2fbWbptNnUqNITpU8UQE6hQFx17Sr22gEmGXz
         7+bpGNS9Kwu2uKpUHr6nw91JG8vRZjqMY4TWiq4Ju2LeR1lY/hIhazYeGNAR8iMvGar8
         p8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760823; x=1735365623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P216bbBhvCShPSkXdAJnbA17pOkwI5/lxUifQLEloWc=;
        b=MdurSFjdxc3WYxf6yt1ihOK4puxb+MAodZKeOm+1H/aLk439Yfggs166vclMAytggM
         jVUZQhwx07VeOT+/MuhmBZcwNkxy6xLsVs5qyI5iP8MPJV2mLMVj2jilPmfK5EG2PMbs
         L2UKFk09T00JYe48JLEc34Ri+16uwrm2TPJcqpiVJv4rqjrls2U38D5mhzDXwanAAFTu
         2uh8RwIPTsi7GkgdAVyhTfKZKOybO/aGCfXonHgrqNv43M6VOR9yOppiMfG/5f3SjyZF
         6LLIA6/cPUSfAbbDLBt2XcjqmAN24vjwyz0cp395Yc2kKEw0c/IJaMCjxmJlUKXgH0HF
         +cbg==
X-Forwarded-Encrypted: i=1; AJvYcCUkQEEHn+yiQ+gQcCBAUYme2Q4C4AoCaLHEf/tcRv48sNiGTE8MPm5fWEjSHm7uAwKLlKgXBgl8wZw5CiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhF6FjV1cTb+Ts4P5VKf77DwpWnRTW1eSC91xykfsjuvQw2y5f
	kgx1vQf+evu+fFCU+hH7mzG4f4PX1YMTihOyT8q+JqqGl7ViZy+RYTe83g==
X-Gm-Gg: ASbGncuhmvvMjTjlbbrA03OoaxzCNzqQFfljuvUur5ykgtgHB0arHUtpOZH5BYnhR34
	0Z13kNzWi6T1OlC4TkI8gSTavvYoVn4AQtwvfm4Bqi1N5Rww3KnzZeDmD/4VicYyc45B3r7GOe/
	+kHukO3gFTIgKKdMwuIZ5e9w10wA5KcKiE2bF+jWjfgyWpUCpASANgq/98z7KTh54h39QL2qtpq
	sN5enTVKCFokhPYA//jyw+1zZEpgHWodrAvgphp6MTfig+oLeVjOlAsKIL4eHPz
X-Google-Smtp-Source: AGHT+IGJuUFiCMVGVKQTTNlgbP4ncdLIcpJ1thDVDBYNVTfdKdcPZYe7bOPWY8WA64rgAX747YG0PA==
X-Received: by 2002:a05:690c:10c:b0:6ef:579c:38f4 with SMTP id 00721157ae682-6f3f8134cbfmr38387527b3.21.1734760822882;
        Fri, 20 Dec 2024 22:00:22 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:22 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 11/20] alienware-wmi: Refactor hdmi, amplifier, deepslp methods
Date: Sat, 21 Dec 2024 00:59:08 -0500
Message-ID: <20241221055917.10555-12-kuurtb@gmail.com>
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

Refactor show/store methods for hdmi, amplifier, deepslp sysfs groups to
use alienware_wmi_command() instead of alienware_wmax_command() which
uses deprecated WMI methods.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 51 ++++++++++++++++-------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index bcf3b2f80dfd..b9da5fe657a9 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -685,14 +685,18 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
 static ssize_t show_hdmi_cable(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
+	struct alienfx_platdata *pdata;
 	acpi_status status;
 	u32 out_data;
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_CABLE, &out_data);
+
+	pdata = dev_get_platdata(dev);
+
+	status = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
+				       &in_args, sizeof(in_args), &out_data);
+
 	if (ACPI_SUCCESS(status)) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[unconnected] connected unknown\n");
@@ -706,14 +710,17 @@ static ssize_t show_hdmi_cable(struct device *dev,
 static ssize_t show_hdmi_source(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
+	struct alienfx_platdata *pdata;
 	acpi_status status;
 	u32 out_data;
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_STATUS, &out_data);
+
+	pdata = dev_get_platdata(dev);
+
+	status = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
+				       &in_args, sizeof(in_args), &out_data);
 
 	if (ACPI_SUCCESS(status)) {
 		if (out_data == 1)
@@ -729,8 +736,12 @@ static ssize_t toggle_hdmi_source(struct device *dev,
 				  struct device_attribute *attr,
 				  const char *buf, size_t count)
 {
+	struct alienfx_platdata *pdata;
 	acpi_status status;
 	struct wmax_basic_args args;
+
+	pdata = dev_get_platdata(dev);
+
 	if (strcmp(buf, "gpu\n") == 0)
 		args.arg = 1;
 	else if (strcmp(buf, "input\n") == 0)
@@ -739,8 +750,8 @@ static ssize_t toggle_hdmi_source(struct device *dev,
 		args.arg = 3;
 	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_HDMI_SOURCE, NULL);
+	status = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE,
+				       &args, sizeof(args), NULL);
 
 	if (ACPI_FAILURE(status))
 		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
@@ -778,14 +789,17 @@ static const struct attribute_group hdmi_attribute_group = {
 static ssize_t show_amplifier_status(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
+	struct alienfx_platdata *pdata;
 	acpi_status status;
 	u32 out_data;
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
+
+	pdata = dev_get_platdata(dev);
+
+	status = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
+				       &in_args, sizeof(in_args), &out_data);
 	if (ACPI_SUCCESS(status)) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[unconnected] connected unknown\n");
@@ -822,13 +836,17 @@ static const struct attribute_group amplifier_attribute_group = {
 static ssize_t show_deepsleep_status(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
+	struct alienfx_platdata *pdata;
 	acpi_status status;
 	u32 out_data;
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
+
+	pdata = dev_get_platdata(dev);
+
+	status = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
+				       &in_args, sizeof(in_args), &out_data);
 	if (ACPI_SUCCESS(status)) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
@@ -845,9 +863,12 @@ static ssize_t toggle_deepsleep(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
 {
+	struct alienfx_platdata *pdata;
 	acpi_status status;
 	struct wmax_basic_args args;
 
+	pdata = dev_get_platdata(dev);
+
 	if (strcmp(buf, "disabled\n") == 0)
 		args.arg = 0;
 	else if (strcmp(buf, "s5\n") == 0)
@@ -856,8 +877,8 @@ static ssize_t toggle_deepsleep(struct device *dev,
 		args.arg = 2;
 	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
+	status = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
+				       &args, sizeof(args), NULL);
 
 	if (ACPI_FAILURE(status))
 		pr_err("alienware-wmi: deep sleep control failed: results: %u\n",
-- 
2.47.1

