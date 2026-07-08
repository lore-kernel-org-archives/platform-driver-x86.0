Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEBD43934F
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523360; cv=none; b=V8J7sUkS7JIFRYduRmcHnr9FoRPVaWwIJJC8dptQApvMS7npga0b0jBKAcJyh2cHZGZkJEm+Ampu/J/q0TOquQUkcLLGeNUCUYbSxGaJHn7+MxfT5eGGZ5bL/RGuFgrGhweDDb2BAA1t8biPLG6sgZOJA3N+Lr78lU2OU8kADaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523360; c=relaxed/simple;
	bh=RjcmqHddOPJFPlXAo7SY94la3yf/PIGdxvDHfx5w/Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acl5QwZgvrAPD/+8dRANvranRZbPk1sLdzP0m15QDezcufJtGwnANSlvvFV7BCbcAFXp4E7LWJHqBoeqmnUPIpJhtYVcq8y8HGawi58/U9to5Z+vSOtvVC+OoHI14Vq8jNrvDqgj0Q1ScRDQvNvJGdkvGMArPAMPnVKyLfd7448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vu003P0L; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vu003P0L"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664c6304683so781101d50.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783523358; x=1784128158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=Vu003P0LsEhPQKM9kECDoz3QBb/dzNJuvU4ici145F+iNbg5UHO/ehUN/86V/8xPj8
         ploxgsZMwZynKyJ3VrZzJZZXjjsEek1t8dsUmVLOxF46VL+BucPgs2c+ptA1v+KHjs3U
         Ajl2hUZvB8MYi+wyQ7DHBI1dfhdu/qJSEdva7NHaWXB+FYgOogIdgoTdrTVu/LVA6+W3
         3bECx3FSpPWAgI19okUszLkZUXy5BQC//ZaXLK+nsVTaTzBW3ksSflOCpp7uMKqUuMxP
         ky+g3SZWvGcOLFQP8/X4rDIyEj6DMvg0uCMuPm8TE7e4T/CIP48s3BNqEYQ92uRzlBxp
         1xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523358; x=1784128158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=QlwSupemGcVUtgz70io7CF4SxpC1QmxfeSjxDKCPLam3ABuxYf+7sXlEx+AgBhDVvA
         4a/CAgPNY+cKLGrSC6rF2sBksnoH6Fut4N/gDtGIsOe5TLYn9VbihILVBxnjOJL+5CoH
         312Zj4ujRIStwGiiAJBCjzbPlVMSXrCgmM0VbipnU6+6lu3MvlhRzHcoVpoVZuGI8x7N
         WOkTANB1ZD2wAfCvHTferhiedwg/oevcvdAzRwqtTHsHZyOmHtvXDnQ7u58flLkVO3LN
         KJpJD6KXl0ehY0LSvl2F0e5OWkeQ/vGOfEwFu1ubNi5e00Ut43yIrlfIkNVLcHB+l2bN
         es7g==
X-Gm-Message-State: AOJu0YzgQ6eR8QadjwvuxGx3nQwu8kMvML3gen48mqu5phbGwLgJq/+Q
	5su2EUJdWGOU5JqpVp5CEgQ6aK68JHv/rU6OZGvL9zDvQUxVavo7BFJfAPXEmSyv
X-Gm-Gg: AfdE7cmi6baASJlDemZbOEzQxfj3iSh5cWwUsprra8UjZoSLOE8QLcE9IuoBu9J9MVv
	5W8hp+HmxKYW5SXzNviFSDmhMMVsufd7sko0lgNntyAAJhxmGdu8kBygb8YjbdrKSdZw5bVs65S
	VHcK9EoekAN/xg+jGAK+Yp7mF8pilBItNpb+yHaCkPExYSEUFlAifqsj9maYMWXpcR9Mx6ltt4C
	zBfd7EYBOEGMi6+2tGhzK8QZwEt1RlIC9SyPnxOkCBbQviZ8grPEY41x+9ipKowK598R3fFK+ll
	NVGXUCKpQFqozM/QgNcFvKe06vfIcSTo8c+Jr2OLNnTqZjTfNETMG9oJUKtJnGid0R26Vny6bAU
	t/cYYdt7+CM37gm9jaax2z817GfHLo1jBS5tq/1IuBESRxXvXbK4ciEuUcDip6d2lLcphhJwZP8
	j3c4kmqbfn878=
X-Received: by 2002:a05:690e:4542:10b0:664:c928:5d51 with SMTP id 956f58d0204a3-6679f0e899bmr1694369d50.28.1783523357844;
        Wed, 08 Jul 2026 08:09:17 -0700 (PDT)
Received: from fedora ([2600:381:b514:354c:5185:bf38:e2f9:b87d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a35d07sm2189485d50.15.2026.07.08.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:09:17 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de,
	johannes.goede@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v12 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Wed,  8 Jul 2026 11:09:08 -0400
Message-ID: <20260708150909.23404-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708150909.23404-1-carvsdriver@gmail.com>
References: <20260623125914.833063-1-carvsdriver@gmail.com>
 <20260708150909.23404-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book 9 14IAH10 (DMI product name "83KJ") has a dedicated
yb9-kbdock WMI driver that registers an input device reporting
SW_TABLET_MODE to track the detachable Bluetooth keyboard.

lenovo-ymc also loads on this machine and creates an input node with the
SW_TABLET_MODE capability bit set.  For input switches, the presence of
the capability bit has semantic meaning: userspace (e.g. GNOME) reads
the switch state at startup from every node advertising the capability
and does not expect more than one such node.

Add a DMI match for the Yoga Book 9 14IAH10 to probe() so that
lenovo-ymc returns -ENODEV on this hardware, leaving yb9-kbdock as the
sole SW_TABLET_MODE source.  The ymc_ec_trigger EC write, the only
other action taken in response to a YMC event, is guarded by a separate
DMI table that excludes this machine; no other functionality is affected.

Signed-off-by: Dave Carey <carvsdriver@gmail.com>
---
 drivers/platform/x86/lenovo/ymc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
--- a/drivers/platform/x86/lenovo/ymc.c
+++ b/drivers/platform/x86/lenovo/ymc.c
@@ -23,7 +23,23 @@ module_param(force, bool, 0444);
 static bool force;
 module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "Force loading on boards without a convertible DMI chassis-type");

+static const struct dmi_system_id lenovo_ymc_nosupport_dmi_table[] = {
+	{
+		/*
+		 * Yoga Book 9 14IAH10: SW_TABLET_MODE is reported by the
+		 * yb9-kbdock driver.  Suppress lenovo-ymc on this machine to
+		 * avoid userspace seeing two input nodes that both advertise
+		 * the SW_TABLET_MODE capability.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
+		},
+	},
+	{ }
+};
+
 static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
 	{
 		.matches = {
@@ -100,7 +116,10 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 	struct lenovo_ymc_private *priv;
 	struct input_dev *input_dev;
 	int err;

+	if (dmi_check_system(lenovo_ymc_nosupport_dmi_table))
+		return -ENODEV;
+
 	if (!dmi_check_system(allowed_chasis_types_dmi_table)) {
 		if (force)
 			dev_info(&wdev->dev, "Force loading Lenovo YMC support\n");
--
2.54.0
