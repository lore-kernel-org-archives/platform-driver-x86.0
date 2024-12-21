Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A1E1EE7DD;
	Sat, 21 Dec 2024 06:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760803; cv=none; b=BEdyCC+fiL2uzeSHbQoGIOd52kI3sTPN6zNnd5HJJKExiCCUI4kwFRCazw37fzUC4KYp4Ltot5EP+eyy3GvxclOKP8ir4ccZMKO38Fc7FsI0SQWzEoFYQJUihrCs21WOvyoK8R2p2ObzTwCAMeoma3Fa8GgytC69iljCctVAfUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760803; c=relaxed/simple;
	bh=E8E8wxxFfTC5oYXh0qFC1FyTDteE+cIe83wwFVwUAyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwpxADEfeVcUIlSHLmPLatLx5rYZBerqnjp2LgEJQOTObFy1/hxCEdC8txVJLuhu2k6iVZGPFsQMUuU26l6iCNKhizUC6wiiBhnWXNlTWfBEHmslL6tRhOLloHSEJ1ZouhoQRMDymwxuoHq18zrNDlc4L2ZljIj+Alm2FCQXhu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBenQXhB; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBenQXhB"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f0054cb797so21088917b3.0;
        Fri, 20 Dec 2024 22:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760800; x=1735365600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j06yCL1SGn4M6xGgU0mz4/+MosEfAZ9tu5HVjjwGpNI=;
        b=YBenQXhB8kLPIuGdmbMrZ1hmDOA0w50SO0m9wQDYqqmARgJNDMlAworGi+3X0J78O+
         TavVY2owshti9xX+JbZUH1D5+Wi6VX3e2xOTrmS3PujYvV3ykLnIhFwrB2BFa2RqIzY5
         y62PiX/BxCzZ/sMHeO4vqeJf1r6Rc9umj2U+wi9h+ziccamhUJUOdOsSj634NdPFvgzu
         5VPaZuJMCSAiuKEsP5F011ILH68xs9KxGKvOagTV/YzPFjkeVjq5RKBr246M3qIfXBD2
         54iDo9uOPssXm0HGBUwPbydrc35r4urPOl7mWdhxm1h85wvVz+LuZVT22a/TtPLy3o5q
         9FXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760800; x=1735365600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j06yCL1SGn4M6xGgU0mz4/+MosEfAZ9tu5HVjjwGpNI=;
        b=e2RY73GKr0GX3RBkz/cqfcrtO1q52fX9ULUH3TsPJbbXobkJgtKha7i/sSmgHCRfla
         lcrLDxNQi42Qp1u0x7S4QJcMcXp51Y5W/pKSfVIhEsmsdh3XrTqT8uxhnJ0QnhBgsjVj
         ZZ1RYQXHFCcLyf6hpTUempVgwLgWyOFLj+a34dp/YHtSISXPea1jLYNq2x9I3JQeO0tk
         mvopXMHlvMN88bG2qFtOoc9di6XTWuykDU4V5bh6gIoUjvQz358ZINF8tdrbC20sb1J4
         2frOizj+zIt8CQo1Xh/H/AIcgCg+0Mag7hlhwf+eilt3xLdcz+oqn+thDUuzZyFfJ7/2
         U/iw==
X-Forwarded-Encrypted: i=1; AJvYcCUDLEgFQ+nt8/KU3ZfX8qr60j4JFHDKsJg+R8l2UzWSfdNGg1tcdE58L6YlcX8AFZBUvFrWQIfu4UkZuSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxK6f5tljRz8yuJfT0cUfWf45MNpALieW2AHNTey8ai+HOp8F4
	fQqnBTm8DJpS30miZRXjW7u1jyTDH0rlUuGC3g93HJoWJPuCoXo2y2Kj0g==
X-Gm-Gg: ASbGncskGdGriVKeLdT7gsGj0OwRP6AnwVXN5wj1q6suJwlJe6bkwXW2lk4PhJ/mE24
	dmn8mOdmtqCk1e29K0IFU/bbuPymduHGZR/VzePJQgcSF4gt3YQocu/dd9bi9L9t83KwDQbtwF+
	fsjnIq4kTKPRDdwVKFus5yADDea53tg03wRpDqFfYADlOaRW80eJD6A5Et124JrWs/t3Y1sXGD2
	RioB9SO4iAQ+wXNl0Hp8uB7b7eE1TdYase0AKuc6Ng0YOsKeDuoy1PG+g6UGbx+
X-Google-Smtp-Source: AGHT+IEw4TybRL1Bq8vCrFogKLsFgIVPDehHUQULO4z3pq+sSLE+9HVG4O7cbcFRWEJ00cLFTQQk7g==
X-Received: by 2002:a05:690c:650a:b0:6ef:81c0:5b56 with SMTP id 00721157ae682-6f3f8125b38mr49502977b3.14.1734760800601;
        Fri, 20 Dec 2024 22:00:00 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.21.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 21:59:59 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 04/20] alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
Date: Sat, 21 Dec 2024 00:59:01 -0500
Message-ID: <20241221055917.10555-5-kuurtb@gmail.com>
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

