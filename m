Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56671D63CF;
	Sun,  5 Jan 2025 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091115; cv=none; b=jpHU7eIxxOYaOp26BOjoPHVYrhGs7gxJY3S/7Hbfm17PfMwI2c6+RIm0j3mE5w8QZ4uwBZgQHejSSCrYKuZ3i93fIedinf0xHYkEKXp8e193xvE9gmWD04f4qnJ1HyMIWP2OVmIwGYkrzU+WAcWMy00pVRsQhRKnibJT/OwQCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091115; c=relaxed/simple;
	bh=mofHRnjzZBeMrOixowVvjsphMdWpR8UxyDDKlQ5oUgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6hV4nIKd3pZJCrZ3+ZQYsDvqVok2qoRoxai4bI5RtedDIyGPUyJxmfD5sAp+ksIQAnzU3bZvyO9Mc0Xnx+HyrC+0crRuGPmDsr+0exAJ0FOS2BtrXsf+0K2qTobPEWOVivtx4IHOEGgcPfV3KnWi8z+yZ1HADNvHyqhV8B7Zx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPa97OTU; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPa97OTU"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85bafa89d73so2050750241.2;
        Sun, 05 Jan 2025 07:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091110; x=1736695910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61DglG1nwpVdhL1WtytyiQkVAjk3omk/B7echDEv+BU=;
        b=YPa97OTU+YxRJ6wRaX0JF1xHP8OfDUmsHJuKaHNNy84/h+FB3JCZoj50JEzEZqVkLI
         t4znPXjKNYIFfKWa2uvImfLor7yHNbAu+xPxlcOOn7eg1xpL2q0IjpyYVAfCjK38BPKs
         XrK+tKM+DWwRjXVx7NVjBMII9v/E8mP9CrFJw1viASlO/IUWh9djJYxukuShoKxT2GsF
         VKABVvRu8HmUsCzR0RO76GH8+Cl81myNnXcx1f7XQNrTM1gqeL4J1E6tVMABFCAMtVhy
         8x7RSDXJuCi9JvbwnBfubUSLVsCN+QOtWijuzRu+zjWranpxdXXMCastJZDvN0OEtoTy
         ndow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091110; x=1736695910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61DglG1nwpVdhL1WtytyiQkVAjk3omk/B7echDEv+BU=;
        b=sDyeyeZK0NkKtH76ffQkw5Xu1RecLQIn8TlaSqq9XoybNqR8jebPlWUessaXepscnJ
         idSDPAeXsRFZvCKAF8V6LKwHBptPH7ucXsfQ7vgLk+h9O5SVyiiCImECUPD5KiHpZvk9
         9jeZeptFHbFP7TnQGmgXp1AHp6afBiiMNUmynrOn+8u/BHWz5LuNxo4d9nmuqpJW0e0v
         CwAWnxVOWG+55QNMba5DFzu+/oo+9JEYeOs9+wpgL57zeOBvjDzaXvqoUJG0M4UYkKN4
         067iXAERkrRS9w9Eg/+eih7I/XjOKh97lwGHyL24u6UeCOdQkXX7m7t4GXA7fdLT86KH
         arEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6EB1HG4TMHgBbvhk/S3IGTjYzVU068TOVs0HV3KmKCOSCuh83b3Bi68vneL7A0dAmuSVwMSjq9wjO+LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL2UwBzsK/P5xH4jDjLpXBiwVe6I0qWC1wAIDIVgKZx5XbQoNb
	sVy6FbquBdduiok5AKSMxQ6zLBf/Vy4xI0mzOOVz9OQPxF+S97cBpcaBiQ==
X-Gm-Gg: ASbGncvFUHouvFwfkpQivUxMXhMJ4oEIXdAub2l5SawvrYOH3qXNLVNe8Cyf/x9Y6MF
	CRje0HfnW+hDP0pZVN0NLCcFGcv3mEryQUlqxLMaX2nOTm69fELolusg7GzyuzwO7vY2ubvXDNo
	GO3FlF4mNbGIeuzsiI+emeC62s0sIPUBDbpFMy0nLPMjsyMAJ/ZK26QoFyg0b2TGCHGLd5uOqTu
	V2aJOVuSC0WS9ESBokFKE/fcO3URdlVvzE0nr6h+WX8Giu7a2j8d6Gghz5HLx/y
X-Google-Smtp-Source: AGHT+IHkCIjecNaxsEtwTGE643jCJ/ctTJeK0sfDu7DeHNzgwPcy3LuwlAJImAcCG5Hy/Y/KpiRByA==
X-Received: by 2002:a05:6102:38cd:b0:4b0:2d7c:43e1 with SMTP id ada2fe7eead31-4b2cc4592f7mr44699886137.20.1736091110194;
        Sun, 05 Jan 2025 07:31:50 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:49 -0800 (PST)
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
Subject: [PATCH v3 19/20] platform/x86: Update alienware-wmi config entries
Date: Sun,  5 Jan 2025 10:30:19 -0500
Message-ID: <20250105153019.19206-21-kuurtb@gmail.com>
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

Add config entries for each WMI driver managed by the alienware-wmi
module to be able to conditionally compile them.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
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
index e4b75b1acd10..a810767a0eb7 100644
--- a/drivers/platform/x86/dell/alienware-wmi.h
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -72,10 +72,33 @@ int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
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
2.47.1

