Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038E515623A;
	Sun,  5 Jan 2025 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091076; cv=none; b=ZmDM8jrhu/4odFySnukXk2Ug1WDPZ+cQ+QPPoUhaWh+RRQkwcFty6tMq4ukgNELBmZY3BU2Z5ctVOfUSANcPsurzHcDZ911vNYumLCMC7qkj6br4pYyFxteo3aVqeOkh4RPtyZsrVhBoFPbnFrpFNkG6Ud10HxTioN0RubKkwE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091076; c=relaxed/simple;
	bh=X5UqPOMCZ2pn9lTZB2JsjUpprMYvlXuqPvR7jHs00ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kx/w6Q0S8dUYJrhQoS74uJ7uP4y/8nFlD7+3i/nX6U/4wMHPvXmWd7lRtIWusTG6qN/qp2V5rPpSCH1UpXi503CobBbFY7bGNxRXtRNMH8cOoSVFEUA91+lAzaatVzjJBjceMs2JW6I5pJQShxbLhuSvqFiMbUB/NOuMraxBUfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJjPWUXx; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJjPWUXx"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5161d5b8650so4189673e0c.3;
        Sun, 05 Jan 2025 07:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091070; x=1736695870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZ/sijkWytnb1cS1jiHFJ2zUi4hUygkcuKiov36Ane8=;
        b=KJjPWUXxZTp384c30z75duJyEmX5xMEREXsXgolypOuaWJEU400rr9aOnyQFSvXNiO
         wjXhBPpf5/28Cw7+Vb57SKZzO3eTecsVQanfdE+luBy1AObWWWeqkZZ889jwKj0YB2b4
         pzETBD5yxOgDCepKLgRuI4N7fQAmsMda9K+QHCUdORfLHjy+PmdXH0p6v2LoG/fhRYou
         XsvCihzDGUAh7ksIQUqCOTysAAVV1Ctf0ovF4Eng8Oi38gxGn/1ELBnrGcncL+pA204d
         2edhcXdT7nEGhg3Q+ZnynmlgsmdCxZ5qt4eO+xrQT7MdDqTxSfrqUUnmR6+iOhM6cnPC
         Xf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091070; x=1736695870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZ/sijkWytnb1cS1jiHFJ2zUi4hUygkcuKiov36Ane8=;
        b=jHra8vEVYLHfPEONG1YKuorIJxUbZ8ZbU8pYQmJgKP3sQ9kGLNKdR2IGITCf+cdRGa
         IMuDSIP3M9eoAZDmsaQZ+z/b8aPHTmdFuKcTbAgC6ZGn49Tw/lddAsAUovzmHgct6U6D
         gwhzHpQAPHAwi1gT3Hu/YwR3BNrGRlNCpFFs9GDCQf09zSKcDKC8Pk3P2FYW47JNgRGq
         ENtEb1+QqCCEDB9s7zRD57SsQSOFYsmDxZXJyE5RuKLGsyEf3m4sQS/uxskCgw5DtRlA
         Zb03pvBsP8h3rcF/rdfbNiPC1H+YTkcXE4TGlyy2vgN1KFPBIimcGYXJlgW1oO2NA8c6
         9LPg==
X-Forwarded-Encrypted: i=1; AJvYcCXpzJygSwq9fMSFjpetbygeoYLSArG1awgWTjaC/R/VelZC4AhkW91ID69GUZsJXJG25YNsZGOYzBkiwUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY6/Ytq8H6u5RmHN6KfKvwl4VgIHOEcegcc13OTUcr96ykIf3b
	s9EynN++g4GezjNzqr1jroq/SsboM1EqZeUiWhI4cEfmSZf37VA3dsqQYw==
X-Gm-Gg: ASbGncuxwa67cGSORtdVKrPMWt0kjnOez4MLWYPY9131IpLS7MpCuvQPIjo/YzshjlM
	SGHc3HjN1XMZ7QVWr2UUISUUHgLPqKLMuVsPUtMzzWeAaaE2IaCyH6x79YC+bjXUwMhuz5iMh14
	TtfKq/Z1nISbKJjNmPRor31BO7lj7SU2tRdU57s/+tPalcbyEfrBBmEsXjDIAT+uIoEX7zLz9gj
	MCmv/nu/An0f70k92zmC0bEf2SS9XOd4lYMU4aKmotd4FVmEbbrym5yJ3x60Lnw
X-Google-Smtp-Source: AGHT+IHTUX3jw8K7Bib4RUdlGQiPFDqV6tBj3JkuW2hR/WW+a5Y64iHE3cfXKnh9wYaSpP8LKV9UXQ==
X-Received: by 2002:a05:6102:3913:b0:4b1:ed1:56ac with SMTP id ada2fe7eead31-4b2cc37e0b8mr47244788137.12.1736091070138;
        Sun, 05 Jan 2025 07:31:10 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:09 -0800 (PST)
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
Subject: [PATCH v3 04/20] platform/x86: alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
Date: Sun,  5 Jan 2025 10:30:04 -0500
Message-ID: <20250105153019.19206-6-kuurtb@gmail.com>
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
index e54e3cc45691..16a131cc9f11 100644
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
@@ -1166,6 +1133,23 @@ static int create_thermal_profile(struct platform_device *platform_device)
 	return devm_platform_profile_register(&pp_handler);
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
@@ -1205,24 +1189,6 @@ static int __init alienware_wmi_init(void)
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
@@ -1238,9 +1204,6 @@ static int __init alienware_wmi_init(void)
 fail_prep_zones:
 	alienware_zone_exit(platform_device);
 fail_prep_thermal_profile:
-fail_prep_deepsleep:
-fail_prep_amplifier:
-fail_prep_hdmi:
 	platform_device_del(platform_device);
 fail_platform_device2:
 	platform_device_put(platform_device);
@@ -1255,7 +1218,6 @@ module_init(alienware_wmi_init);
 static void __exit alienware_wmi_exit(void)
 {
 	alienware_zone_exit(platform_device);
-	remove_hdmi(platform_device);
 	platform_device_unregister(platform_device);
 	platform_driver_unregister(&platform_driver);
 }
-- 
2.47.1

