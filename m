Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60131E2607;
	Sun, 19 Jan 2025 22:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324389; cv=none; b=WKnLVK1Ckong+bKqSJRV1Uh+tSOfNoEPhr8RjowfVjF9HXdevUvpFhniTq3Xo+jhjp1pt2VPKpSpK3CFOPqSR9F/aM+8uGUPLE3XRra2bExVMDsFajYtSosnc+Z+8g2dkj8n3JHbNRrKi3ofYd3+Z8q5zbotz2/+dxxeIKkmBdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324389; c=relaxed/simple;
	bh=4AvwmgNq0K8hg1b/NuDxZBgHBGQc4Xo1hmy0Q+V/UVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGSB1DwBYfPEihAgUGr5qPkp4Rk2rZsi/xfrrY/8Bm/fcrgEHZGUMxwJQt5SjJ2QISiEJx17QAIkFQnfisXcu3VIbRsNFiK6eduiFsUF5l8XMGm4oXpQn+SPQWy4y1myswVEfQIrDMRmeJH4r7N4klvCXGxWIdF58vXxO4b2D9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFLY4drX; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFLY4drX"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6e8fe401eso367812385a.2;
        Sun, 19 Jan 2025 14:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324386; x=1737929186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShFZaM62gIQnS3Q6clqV2d1/YvoqISJ/NK1jrKyTtHk=;
        b=GFLY4drXW9gV9Vtr6GVIpg6qCBP37ECfXRtoMoiecJWFlX+kFhiFgZBMt8YHpvsSni
         oWVcIGi31bd48pVt1pZqfRcgyy2zKC8i+fxQO0BeNEZ0ELrmLrH3LfB7sN4kBIc1ky5j
         bq/WquFb/2z6Od156mfp9kg6ClGPtbxduscULQvLzlRFBbhdiyqd3r1SvX7hXx/NKy2i
         7j6uqVadyBZQHpwpde3cds9ZSnqS4xcu8IYE4U1Bb1V4tZ/Qcmw3XTo4Y17o908IW8Lk
         nCn43Z+HufeKu4Z/3ojwAxonM3sDT6hc3xXSV0eDF0dvNh6VC9b4FWSi0EbpeT/tXR3+
         7gNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324386; x=1737929186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShFZaM62gIQnS3Q6clqV2d1/YvoqISJ/NK1jrKyTtHk=;
        b=WJ04D5PeH72RPTk0XhGv+wlUBqYaPvsIbg5HCHFK3L26VIyouExdHLcJkxZEjBcHfC
         iNDSghBlLxrvfjmo3dTedpIW9kiYrGDDXOA3hpXCFT3WMFFmcZKFRrzslHKkX6Y7tIy3
         L7JgJBRt/Xle61oVH+z4plCI9HM26qisfjGvzCKavAQnKCdpPfCjqf5w+VO+bx/X220z
         0FMzS3IvNQ2XFzW3+keC8f++xMXhEZG2Xgo7nv4JK18oMF2/cHds77TfqZWF1uppkBxK
         PeFqHapwxFmvtTo76g4t7n2E79N5AU4emKjIB/bRqGBjAxZTmyVYBv5mhba8uX+YBINx
         oKEg==
X-Forwarded-Encrypted: i=1; AJvYcCXgAjmwXVPArotrl5R4W5YLUVT5iUvYXd91tFpYpbuv8xzfYTGYTlRyENVe7Qbzvl59D01h5qEMb40EYew=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfdXDoopUvtO2XwfgUwHvrJLeFYCWVTL8SifCJ7cnRyMqMDRIL
	ETDjZe6pOIEU//tBglbpopWduKu8ofwzsthTJABBUScI0xoU+U3c3blnVQ==
X-Gm-Gg: ASbGncvhAPLx+kFWfr4q4JA6cY3832KEUxhgErVNuhDCDwX74I/O/GjwzW/XpGedBqJ
	JRVOojkDEOU8G6B8SCF8ekam1u6oj+eKDbBl1leXgkw9BWcQhSnj4d+6ukdlJ5ftqLg+rmlxXlu
	gPzrjB+L/02x+kPJDfBiW3wCLBhgr0iI+0NrMv759DJU5JnrQsAoqLvHtUD21nJ11fae2VD1qZU
	s/A8ijMVC/+gK58PaqgVz0TBZeOABMGibPV3V8/WJdiOHMpAl9YkF1eBHkmeOXzt2oqIlF/2a+9
	Sg==
X-Google-Smtp-Source: AGHT+IG2SyrN4WDx6df/z93rBgjBHmDGHqx0cUqzobmegCEwO3Gu7zqOk/y72TWUm4ioh31wiCd2Fw==
X-Received: by 2002:a05:620a:6888:b0:7b6:f997:1d41 with SMTP id af79cd13be357-7be6323eb0fmr1639923585a.29.1737324386309;
        Sun, 19 Jan 2025 14:06:26 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:06:25 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 13/14] platform/x86: Update alienware-wmi config entries
Date: Sun, 19 Jan 2025 17:05:41 -0500
Message-ID: <20250119220542.3136-14-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
References: <20250119220542.3136-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add config entries for each WMI driver managed by the alienware-wmi
module to be able to conditionally compile them.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Kconfig         | 30 +++++++++++++++++++----
 drivers/platform/x86/dell/Makefile        |  4 +--
 drivers/platform/x86/dell/alienware-wmi.h | 23 +++++++++++++++++
 3 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index d09060aedd3f..f8a0dffcaab7 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -18,15 +18,35 @@ config ALIENWARE_WMI
 	tristate "Alienware Special feature control"
 	default m
 	depends on ACPI
+	depends on ACPI_WMI
+	depends on DMI
 	depends on LEDS_CLASS
 	depends on NEW_LEDS
-	depends on ACPI_WMI
+	help
+	 This is a driver for controlling Alienware WMI driven features.
+
+	 On legacy devices, it exposes an interface for controlling the AlienFX
+	 zones on Alienware machines that don't contain a dedicated
+	 AlienFX USB MCU such as the X51 and X51-R2.
+
+	 On newer devices, it exposes the AWCC thermal control interface through
+	 known Kernel APIs.
+
+config ALIENWARE_WMI_LEGACY
+	bool "Alienware Legacy WMI device driver"
+	default y
+	depends on ALIENWARE_WMI
+	help
+	 Legacy Alienware WMI driver with AlienFX LED control capabilities.
+
+config ALIENWARE_WMI_WMAX
+	bool "Alienware WMAX WMI device driver"
+	default y
+	depends on ALIENWARE_WMI
 	select ACPI_PLATFORM_PROFILE
 	help
-	 This is a driver for controlling Alienware BIOS driven
-	 features.  It exposes an interface for controlling the AlienFX
-	 zones on Alienware machines that don't contain a dedicated AlienFX
-	 USB MCU such as the X51 and X51-R2.
+	 Alienware WMI driver with AlienFX LED, HDMI, amplifier, deep sleep and
+	 AWCC thermal control capabilities.
 
 config DCDBAS
 	tristate "Dell Systems Management Base Driver"
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index d5718ef34c48..8ac9a933c770 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -6,8 +6,8 @@
 
 obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
 alienware-wmi-objs				:= alienware-wmi-base.o
-alienware-wmi-y					+= alienware-wmi-legacy.o
-alienware-wmi-y					+= alienware-wmi-wmax.o
+alienware-wmi-$(CONFIG_ALIENWARE_WMI_LEGACY)	+= alienware-wmi-legacy.o
+alienware-wmi-$(CONFIG_ALIENWARE_WMI_WMAX)	+= alienware-wmi-wmax.o
 obj-$(CONFIG_DCDBAS)				+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
index 188440ef096e..f66ae2a6e5c5 100644
--- a/drivers/platform/x86/dell/alienware-wmi.h
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -70,10 +70,33 @@ int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 int alienware_alienfx_setup(struct alienfx_platdata *pdata);
 void alienware_alienfx_exit(struct wmi_device *wdev);
 
+#if IS_ENABLED(CONFIG_ALIENWARE_WMI_LEGACY)
 int __init alienware_legacy_wmi_init(void);
 void __exit alienware_legacy_wmi_exit(void);
+#else
+static inline int alienware_legacy_wmi_init(void)
+{
+	return -ENODEV;
+}
+
+static inline void alienware_legacy_wmi_exit(void)
+{
+}
+#endif
 
+#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
 int __init alienware_wmax_wmi_init(void);
 void __exit alienware_wmax_wmi_exit(void);
+#else
+static inline int alienware_wmax_wmi_init(void)
+{
+	return -ENODEV;
+}
+
+
+static inline void alienware_wmax_wmi_exit(void)
+{
+}
+#endif
 
 #endif
-- 
2.48.1

