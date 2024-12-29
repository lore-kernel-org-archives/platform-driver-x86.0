Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FF0199E94;
	Sun, 29 Dec 2024 19:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501620; cv=none; b=nAluYc9ppMAbL8OzRtydmgyPVZYprFyYAQq5QeSDV0y2EdDg0Faa5x5kjRcWxsKkI+NAi92zOVaGN7ptAoL2Zd+ExtvnJ1J4ulwtpby6PUanBCJ27Wd9EKvJ9m+7JzUcPJGvqkc+10a2EQ2ADzjTmCQS+CkcSVKFBtm+YdTX59U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501620; c=relaxed/simple;
	bh=hz56ulR9GCiEn1mijKFWg4AJyHwob7fn8JNRTQECb3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSb2SA3mxDfHwL98wAz91np9SncC6uoJMYzxegrXycS7/+D/7z0TNqrq35j1JdbfMgQMZFyPLzpvQKGpb9H3jHmkUtsNrwsk1ZieT8BLrYi0sLMmLTm1NT/pIggRYHMjS23YnsA/+OakOcTUWBeYEQZTf+ZZaGjhQH4550qkVTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9GRdOkc; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9GRdOkc"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afdd15db60so2304010137.1;
        Sun, 29 Dec 2024 11:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501617; x=1736106417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmaOCvgjL7d8XqDTzyguRtqYU50/ijsXAcYicl5jjLA=;
        b=D9GRdOkcmNUfcHktI5qi7psXPqsoKXcsy20PMTDbPb/W5zAKl+i0QEhQN/ifuwodUr
         x/wywrUzRi3mdZWl1npeidtL7s3PEzQNJMHRjKneLfKI0YT4MtlrUDdGKoB4KgvVEOTw
         V0BELap9SfuV3WsF/Re0fgq1fhMxo0a7+BAdy8VyR0nWQvzIuG90FEOkC6icRV9Bb/UJ
         QoJp+tyGq9nVKB17EBS5aLafKhVhp2DfEAyot4PGMU5/mk97Qt7X2kX6roh9g/eAwTJD
         KeGMxfXZHaVIoL/0mSTtJI0MLuAnMOUzklrudyVMx9WEEFAdhwoPvCxbhdyDXsp3wQS0
         rrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501617; x=1736106417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmaOCvgjL7d8XqDTzyguRtqYU50/ijsXAcYicl5jjLA=;
        b=BCLTAjvOy3mi4yCVzQ17FHg4QbzFAa2rW3xmUlMZ0V7cmM6aH0EDKW6vCUJz5qzw2J
         HtP1rBUmQnjEPtKMYfAbkavM9fGS8vl+sKAjGJxv6Q2A1+VwZwXZcGArMijLc5UkrGpO
         3rR5NLJDmQj7hnl8L77qybOkPPxm9T/P3gb7bltUwGU0jWA5qDYyg/CFSEbQveu6cEPu
         vD8/J4GshyXzMhgXBeOF80ALzuCzeYHXhx9Uv1ATwpzcRMP9pdYrCQM6CVVnjK429Be8
         nMVGu91EoxoBDolBnMGE08sqll4nlYkIpy+WWN9iE4OA0AStnbJdaBwyOeYUw1Y+JrPJ
         aj7g==
X-Forwarded-Encrypted: i=1; AJvYcCXvFJPj0U+tFpzmWr19bmBXoQL9FacpVR62cQ+/xtZ+YXnAel6HE+nO7bsQgKCV9SUx10G6mdimQ4DTSM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaqVvnFGM+x8TrXaG9G7KwY2sMy6cJKy0V8Ggui7Zb/IwZfN39
	8FJSTpOy3ldqLcF+jIWO9vGmoDUdbcADeDchF4xS/PpS4ppTvQqZdXoiiA==
X-Gm-Gg: ASbGncsepwXzgs33YsfSOC3mpCOAlOoiMdDe6mxcxHSsmdMtscsfO4pr+8aryBauWOZ
	brT4D054hF7MPcRY8Zons1R9wuivewQg6muQ9kQNgOJ7Ww443xz/3K9GbCxawNiCBKvv2unobsP
	tAWWcbsllp+g+dYuBeliQTxx+xK5Y7JKD8EHthUj/TiBwT6YP31tEpsRylL7B+1dy68NZHUVZqa
	tlcRNepKzTVrcVJMOfKQ5jthrP7txFCpDp/jdrOqRsQyMMHYOaWNi2arLQVxL8G
X-Google-Smtp-Source: AGHT+IEGy3hZd58v3c8USuoMcnfWHmMPjXImLO5gILOIKudYhci3FzYTI/p5naSYUdiYMD2lm/JAHw==
X-Received: by 2002:a05:6102:3f0f:b0:4b1:8b53:2987 with SMTP id ada2fe7eead31-4b2cc31f957mr26726816137.1.1735501617398;
        Sun, 29 Dec 2024 11:46:57 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:46:56 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v2 04/20] alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
Date: Sun, 29 Dec 2024 14:44:51 -0500
Message-ID: <20241229194506.8268-6-kuurtb@gmail.com>
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

Devices with hdmi_mux, amplifier or deepslp quirks create a sysfs group
for each available feature. To accomplish this, helper create/remove
functions were called on module init, but they had the following
problems:

 - Create helpers called remove helpers on failure, which in turn tried
   to remove the sysfs group that failed to be created
 - If group creation failed mid way, previous successfully created groups
   were not cleaned up
 - Module exit only removed hdmi_mux group

To improve this, drop all helpers and let the platform driver manage these
sysfs groups, while controlling visibility with their respective quirks.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 114 ++++++++--------------
 1 file changed, 38 insertions(+), 76 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 273ce9b10765..e010c94555e8 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -417,12 +417,6 @@ static struct platform_zone *zone_data;
 static struct platform_profile_handler pp_handler;
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
-static struct platform_driver platform_driver = {
-	.driver = {
-		.name = "alienware-wmi",
-	}
-};
-
 static struct attribute_group zone_attribute_group = {
 	.name = "rgb_zones",
 };
@@ -804,6 +798,12 @@ static DEVICE_ATTR(cable, S_IRUGO, show_hdmi_cable, NULL);
 static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
 		   toggle_hdmi_source);
 
+static bool hdmi_group_visible(struct kobject *kobj)
+{
+	return quirks->hdmi_mux;
+}
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
+
 static struct attribute *hdmi_attrs[] = {
 	&dev_attr_cable.attr,
 	&dev_attr_source.attr,
@@ -812,25 +812,10 @@ static struct attribute *hdmi_attrs[] = {
 
 static const struct attribute_group hdmi_attribute_group = {
 	.name = "hdmi",
+	.is_visible = SYSFS_GROUP_VISIBLE(hdmi),
 	.attrs = hdmi_attrs,
 };
 
-static void remove_hdmi(struct platform_device *dev)
-{
-	if (quirks->hdmi_mux > 0)
-		sysfs_remove_group(&dev->dev.kobj, &hdmi_attribute_group);
-}
-
-static int create_hdmi(struct platform_device *dev)
-{
-	int ret;
-
-	ret = sysfs_create_group(&dev->dev.kobj, &hdmi_attribute_group);
-	if (ret)
-		remove_hdmi(dev);
-	return ret;
-}
-
 /*
  * Alienware GFX amplifier support
  * - Currently supports reading cable status
@@ -859,6 +844,12 @@ static ssize_t show_amplifier_status(struct device *dev,
 
 static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
 
+static bool amplifier_group_visible(struct kobject *kobj)
+{
+	return quirks->amplifier;
+}
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
+
 static struct attribute *amplifier_attrs[] = {
 	&dev_attr_status.attr,
 	NULL,
@@ -866,25 +857,10 @@ static struct attribute *amplifier_attrs[] = {
 
 static const struct attribute_group amplifier_attribute_group = {
 	.name = "amplifier",
+	.is_visible = SYSFS_GROUP_VISIBLE(amplifier),
 	.attrs = amplifier_attrs,
 };
 
-static void remove_amplifier(struct platform_device *dev)
-{
-	if (quirks->amplifier > 0)
-		sysfs_remove_group(&dev->dev.kobj, &amplifier_attribute_group);
-}
-
-static int create_amplifier(struct platform_device *dev)
-{
-	int ret;
-
-	ret = sysfs_create_group(&dev->dev.kobj, &amplifier_attribute_group);
-	if (ret)
-		remove_amplifier(dev);
-	return ret;
-}
-
 /*
  * Deep Sleep Control support
  * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
@@ -937,6 +913,12 @@ static ssize_t toggle_deepsleep(struct device *dev,
 
 static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status, toggle_deepsleep);
 
+static bool deepsleep_group_visible(struct kobject *kobj)
+{
+	return quirks->deepslp;
+}
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
+
 static struct attribute *deepsleep_attrs[] = {
 	&dev_attr_deepsleep.attr,
 	NULL,
@@ -944,25 +926,10 @@ static struct attribute *deepsleep_attrs[] = {
 
 static const struct attribute_group deepsleep_attribute_group = {
 	.name = "deepsleep",
+	.is_visible = SYSFS_GROUP_VISIBLE(deepsleep),
 	.attrs = deepsleep_attrs,
 };
 
-static void remove_deepsleep(struct platform_device *dev)
-{
-	if (quirks->deepslp > 0)
-		sysfs_remove_group(&dev->dev.kobj, &deepsleep_attribute_group);
-}
-
-static int create_deepsleep(struct platform_device *dev)
-{
-	int ret;
-
-	ret = sysfs_create_group(&dev->dev.kobj, &deepsleep_attribute_group);
-	if (ret)
-		remove_deepsleep(dev);
-	return ret;
-}
-
 /*
  * Thermal Profile control
  *  - Provides thermal profile control through the Platform Profile API
@@ -1172,6 +1139,23 @@ static void remove_thermal_profile(void)
 		platform_profile_remove(&pp_handler);
 }
 
+/*
+ * Platform Driver
+ */
+static const struct attribute_group *alienfx_groups[] = {
+	&hdmi_attribute_group,
+	&amplifier_attribute_group,
+	&deepsleep_attribute_group,
+	NULL
+};
+
+static struct platform_driver platform_driver = {
+	.driver = {
+		.name = "alienware-wmi",
+		.dev_groups = alienfx_groups,
+	},
+};
+
 static int __init alienware_wmi_init(void)
 {
 	int ret;
@@ -1211,24 +1195,6 @@ static int __init alienware_wmi_init(void)
 	if (ret)
 		goto fail_platform_device2;
 
-	if (quirks->hdmi_mux > 0) {
-		ret = create_hdmi(platform_device);
-		if (ret)
-			goto fail_prep_hdmi;
-	}
-
-	if (quirks->amplifier > 0) {
-		ret = create_amplifier(platform_device);
-		if (ret)
-			goto fail_prep_amplifier;
-	}
-
-	if (quirks->deepslp > 0) {
-		ret = create_deepsleep(platform_device);
-		if (ret)
-			goto fail_prep_deepsleep;
-	}
-
 	if (quirks->thermal) {
 		ret = create_thermal_profile(platform_device);
 		if (ret)
@@ -1245,9 +1211,6 @@ static int __init alienware_wmi_init(void)
 	alienware_zone_exit(platform_device);
 	remove_thermal_profile();
 fail_prep_thermal_profile:
-fail_prep_deepsleep:
-fail_prep_amplifier:
-fail_prep_hdmi:
 	platform_device_del(platform_device);
 fail_platform_device2:
 	platform_device_put(platform_device);
@@ -1262,7 +1225,6 @@ module_init(alienware_wmi_init);
 static void __exit alienware_wmi_exit(void)
 {
 	alienware_zone_exit(platform_device);
-	remove_hdmi(platform_device);
 	remove_thermal_profile();
 	platform_device_unregister(platform_device);
 	platform_driver_unregister(&platform_driver);
-- 
2.47.1

