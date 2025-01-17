Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966EB1F9F67;
	Fri, 17 Jan 2025 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101704; cv=none; b=j1/m+NScMCeNbvUq5m0sRqp+Ir6hlISbHqZbWR9GHATBVXFIOySwtUTqlP0JeGJV6qLml3iZCN48A2KbmDnBuFOjRJCKTFroF57SHsAzfBfGDNPhJeI2Qw5xIyFfZrrdwif212nngnmb2Vl/q8TOrfmvaryHwnOa2eGN30bK4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101704; c=relaxed/simple;
	bh=4AvwmgNq0K8hg1b/NuDxZBgHBGQc4Xo1hmy0Q+V/UVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hv8NPXlWxpAuptGymz7vyrPTg8u8U+d5X/AFzubHgr+G6Z8Ol0Rg/TWKbZKTRVxyKEiI3nDcY4Lr99mc8L5YgnX3OxCstC/IgV0SqvaVHBoF/1+8uD05r0uKNUG/Bu/owfE+7xUwAc2HZldxB7wTlvydZzcnqHxsfxxB1K7Rrmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCL63CZk; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCL63CZk"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5174d53437eso1015241e0c.2;
        Fri, 17 Jan 2025 00:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101701; x=1737706501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShFZaM62gIQnS3Q6clqV2d1/YvoqISJ/NK1jrKyTtHk=;
        b=YCL63CZk1tetcnGysu3KnTynAct5Szmbq4lqDGUf4x6RWuy8gmGVMc95m65l/YzDsE
         R+GhTvzluHhzaA/XfRJIKiWkBlCkbB9t13znceoUNrt+QjiMXZ4GcFaj3JpdhnA1yZXS
         kFFZfExJEUNWBYV59GpezYTFK/fg+cAU5hj+/z+1rLca8jgk9G/YkluMt4vnCawHi3sz
         Jh6nwfCX23f/acvPrjIJ37ECzHLTsbYaMwpd7vm2/rfgiaSwNlBgsMEgeSUa47xsldoL
         /YW/N40LSEWREUK+5Y0hYaOgvpz2+Sqsy37RQqv5YvnnxPHH6sG8j4Gm3xxDjAt677Fa
         z0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101701; x=1737706501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShFZaM62gIQnS3Q6clqV2d1/YvoqISJ/NK1jrKyTtHk=;
        b=FjzA6d2feWWLh0zSH3kZobzZ0ZqLOoOZfcEIuhZj1hNe0P8HH9V/DQcMtgJtCtoF75
         VVC4enAqHrDSjuQ0EDsjgfIRURrLFZ37dmrh7An1dx6Qhuu2lWUL3OjTrmMTMxkDTT/I
         apHRCaUL6/EHMS68L7m4VgpVhPh5bjs7D+daxWCMyPu10UIQ3D3U3WVpSDRLlpRBCfnd
         E3Kfi8uIvXh3XQmj0VaheQBsTpuZBlTnke/wh/0PsN9DbBRYMYIF7tLHC+4Jnd/0udSh
         IUsfg7sMU9w7c0mYPj4J1HcTYz+2+g3Cg6Cx0SQ2JTHP98DUBugQV38bCTeIXWx1lowj
         9TUg==
X-Forwarded-Encrypted: i=1; AJvYcCVqkb3qNBbMY07PjrcuWxXcgcUqXPciaChrUnzRrw3HNp8tcxshslVelM5FBHBrodX67xD4I0CDOr4KVnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqHe4FmvnbYs0JWfo+UJVOKDouCWpc/Abrb7ubLRrSDRVs2qt+
	tJYyHcj0f/ccVH9JE6OQe+3540XVd9VKqkYV1udarP9bz2jYQOBXhFZR9w==
X-Gm-Gg: ASbGncvW/DkLX1o/O4P7y5pFWiCiPQMR6aVibjkBRAH8PsKfOteWLjMtNPI5F8YPhbn
	GKIzDuoU/TqM8V5or69wBEV2NolGH9gSVB1eo5AoFIkS2jJKhT0mDPTw2DO9OToCZQXIS0E9l1Q
	yoOPDx8eqo1aZg58n3e2AcpgH87pIVT8bhMx1SDEDXodCHRHTBekCYX+f5WwaqQKPC5l2jnJ/tw
	FnrsgqnXcxhKPuBMID5Jk6Toq12D1aUY4mTERyyXq64aUjY9Sg0fUpEnEcYSyfH
X-Google-Smtp-Source: AGHT+IECUosZg4dWNr46ZPNz1TOg7AivAz3pMSTd7LTifVekMasPj2B8WC20PrWH5ZB/u5Jt0N5NTw==
X-Received: by 2002:a05:6122:1b09:b0:518:a1a6:4642 with SMTP id 71dfb90a1353d-51d5b3739d9mr1133833e0c.9.1737101701127;
        Fri, 17 Jan 2025 00:15:01 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:15:00 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 13/14] platform/x86: Update alienware-wmi config entries
Date: Fri, 17 Jan 2025 03:13:46 -0500
Message-ID: <20250117081347.8573-14-kuurtb@gmail.com>
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

