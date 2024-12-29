Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D4819CC08;
	Sun, 29 Dec 2024 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501664; cv=none; b=u08wINVIzX0PhogH7O3C22IKUFTahKJ6XpjNvE3V7BG4FmqtzLYrMLIeTbuRS5HXtO3kbniZSPKT20RngVgRaoNaeEAjQ/8NPKxlZjoqBK95dcrscATPuJ9LuOJ8G/XA5xY2PKEU6lTYHUB2+PjIlT4wvhhb5qWnYygbfWN9BP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501664; c=relaxed/simple;
	bh=HzbGEIclIlEM9XemoHD9vKHRyM0aBa+zNp/SqhhWF/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eq1GLAtL5x8z5LlVEj+WXPcDUL5GB4kGti8xBE5TiNcgDTq0B0zCDktBb/CF9iEggBwKqj5foOmeLdpJjKVri+mLIH5IPBQ4SUSow8YP+zZKkBPuxFR9DVsTvEt0c+zQ7P+qxDNP5vUjZJB5wgE1taGEn+HfBzO/rCazCu6TmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLw3su6H; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLw3su6H"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85b88a685e6so3577323241.2;
        Sun, 29 Dec 2024 11:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501661; x=1736106461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6ajtEr9BoQ+Z2rv8v7sYGFTSjGW6Mt5CIO3J5hN+R4=;
        b=RLw3su6HKAhBzndaqTG6edWCTLZ+vNxoEQEeRp3pQXM3MfGFrf0mLmVeg8s1R+EQKY
         VjujUzxC21xR/FbxUKjiJ5fm6OszE5jCUh2wUFXDHb9q2djMBmrPHZiNY7BPSf83+Mgd
         81OyO8cEDIm6+Wtx/AwJQXdDduPg7gY6PeCYAT8CGRfAKgJcnbZTN/eDuh2diifhskJq
         wYd6HnmOmH7MVbEW5WhsINZ5kynYSnL9HvB4ll1XfCG0EzEo8RFhdCXMTD/zDeZHY5Oh
         rbChjPt5PLtdWLrsJJL/zSBlwbSRWUjuDG86eX6JBls+k2xRCcblyw1x815nJ5NReMXQ
         NGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501661; x=1736106461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6ajtEr9BoQ+Z2rv8v7sYGFTSjGW6Mt5CIO3J5hN+R4=;
        b=n5JYehLabkYUyAD5whLZP36Q8/S8vzJ43bmzf2GmOeJWQTZaH4AwGROfVSR8rPR9oc
         TRaCfqDdzQN+s6avDsfMcvv0e4SrLagFc/xqarQXH4uKEs523cg4boI4Kj9KOJCwiFhs
         MeUgzRCTOFGMwgQJo4FwAM96VRjcQBiH8nHy0dlUQ9v/ppLHaYCXt+oJIOpUcsoAAuji
         g7ECQ2wAvZjdrTQcsSMFXEQZf3arvyrMIjUofpDevINMNzRGpSyfVQGsu9PUlf+uLs11
         Wr+t+hIlJ+PUYsWtS4gbdfeyYJYfGWlCjbBZtUwOv1MPz59rTZT3IqgeN3WHeWsjMv+p
         Nusw==
X-Forwarded-Encrypted: i=1; AJvYcCXZbSkyUDtS5fAYaXa36sl78+JkL6kX+Ir9wZxqaVGGXsGhJwnkY93Em8h3+lIFo2cxfIxv0GNJH7HQ4Fc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9OShO0uqN5YwzzjjEKyYTYedj2Z+9gT6jD4DyUEGCr4iltOft
	Bt4b39CxQ22Ea4kPV1ifAqKrqL4oDIhxVszjsaUrhVoto+PQUq/UooB6wA==
X-Gm-Gg: ASbGncsYsi/ToJ+UOJEdy8y2r6v2MKhiKmlYCtTtmGNdCTniQNt/qGS2IFKPh2hZbmz
	+6IClTidgx3BnLwXqbPhbEeVEfhsuIsDbI+hF50Fey4wnV970fwnjJreaolJaGKlpF+Cbyjh/JF
	HUUjJMg18GI/QAc/wxIrMTEZmkUmE9qTwadLoHsclUXQ8gHR+MUzWHOb2kwHYv2u9/TtjA2hgB5
	fEJu/wiInSc2hlb7Ueje0cW3IRBI1Br9s/3RWYdLGp5TvBMo8Pd+9zwnajyKdyl
X-Google-Smtp-Source: AGHT+IG5EvukNEKmTyZ7U2mTigQEn4ga4xN6nDKYWRYiYf+i4+/dHh9XvrkX3fBUriL4t1E+LlzQ3Q==
X-Received: by 2002:a05:6102:5689:b0:4af:b94a:3c3e with SMTP id ada2fe7eead31-4b2cc322226mr25267446137.5.1735501661558;
        Sun, 29 Dec 2024 11:47:41 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:40 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 19/20] platform/x86: Update alienware-wmi config entries
Date: Sun, 29 Dec 2024 14:45:06 -0500
Message-ID: <20241229194506.8268-21-kuurtb@gmail.com>
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

Add config entries for each WMI driver managed by the alienware-wmi
module to be able to conditionally compile them.

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
index dccbf4f95da0..ae3731f2fef2 100644
--- a/drivers/platform/x86/dell/alienware-wmi.h
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -69,10 +69,33 @@ int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
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
 
+static inline void alienware_legacy_wmi_exit(void)
+{
+}
+#endif
+
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
2.47.1

