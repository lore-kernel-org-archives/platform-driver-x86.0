Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336031FDE1E;
	Mon, 27 Jan 2025 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950690; cv=none; b=kX5gQBHBLbk8SsD+DQA7z3SYzbBbDWKQgFbIRi4SKuRwH/W8pTO/CJZca9vGpHvuxjIe4z+hPJcbhQYbVcqeaB8+WpxloM8/+RYAv/vENoZQ2JK8nm2x+/8IDiMOrvw/xJLxhPmIHw4vIg/TzZwIpeQPh6tQJ1YEPlxnmf36jSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950690; c=relaxed/simple;
	bh=4AvwmgNq0K8hg1b/NuDxZBgHBGQc4Xo1hmy0Q+V/UVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZGSflYMhlAGoOsVU+3961OoL7Se8TK0Dou3u8a33tOh7RPd2agpzYEEP3JZ74Bv46gVOYVG59vrVYnIc+UMv09C6zGu+33QSGUeU5HyPkqwjyRfOoTawfiUPow9kp6YTwB9Rs9kxSUD63gDqOQ+mNRuMFKHdqFxrb3U6swKDBfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrjjETuJ; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrjjETuJ"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso1159936137.3;
        Sun, 26 Jan 2025 20:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950687; x=1738555487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShFZaM62gIQnS3Q6clqV2d1/YvoqISJ/NK1jrKyTtHk=;
        b=MrjjETuJNii3As2235cPFaecOzMA8/usksGnhFYtM9a+Px0DO38S8jC+vXaX3K6io7
         oMj8bq1dUlbezuVr+6YDq8i7a0ioUuOCFloNyJ5R855ksPhSkJwTLAhF8goo4nQ+EXcU
         tp9gKqGETJj/48TCY67T2mmD0O92BzmbkfN7jdzr1fhFfeoJ2oTHzESjT5hkvFEl0vN4
         PQ1jFUFH+bo6jlzNk7brIk6QyKNQzkZj50EBdEDtaRafkeu9qVvhJ++6rFYMcy8crV7C
         wROJtnlhi/pFoXMoDuN6zYZBD+9fB9gRF908bVDSm1cNwB1lwj9x8xm6fgRWSfm0gQwY
         qOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950687; x=1738555487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShFZaM62gIQnS3Q6clqV2d1/YvoqISJ/NK1jrKyTtHk=;
        b=OBBG8fE1lSOboQIdfmnnFqnQkP0pQK+4gp4t8g8VFhEfZ7kyOvNUGvvRdpXiqE6027
         FvY17gTlcHWzkVxAXvHxEb2dMXNnIh0AQywDuIWauOHZNC2BWnXIpCVAj+bpzQzXtXFk
         IkN9OyczP8YJ6xIJCCPXpu+XiwetmntvwOecClyzJo/oOsQld/OPpkbaGay2lfZTqJv/
         IYyQ+PcGmtXpulk/EdywzJQGWwjgZFITIaLwsbRsiaWcdIeABGxiPjw509z8FVARPnfP
         mLAwUFcTGclV36IaiihyUQEDMMPjiV/pdRH03//KgVFsZ0lw9yiu/3ZlbXIzajALbhOx
         1eEg==
X-Forwarded-Encrypted: i=1; AJvYcCWNedc0ImJOW0jwrxKGDa5sbm+9nbBqesHe9f5TteTDSVchlx76zDSeatfRcgEmRcgHuA6OX+m84iAFvmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh9BEmPU4yxoWrNUbEqpDVVx3gDK3QA/xJxisQH8754/WxLSyV
	Jq3tNniCQX6w0mrBLbcSvtyQcjjX8t5l3BN8stSLzX9ud7C5Wyk0jW9REw==
X-Gm-Gg: ASbGnctknPEMXcDExdCpPFzx6KhxH0HTX8b17FALqU4g6D98AhBJFDpNehxeLcU2AcR
	9L8K6iXKo/MdEuYosIjzBF5EqhsKa9OBUO3FsnwoQyYpofjw8snuwCdRd8sGi2pZ2kzA+XjiYWE
	3sIOGEG7NWTbhwAgdtCWDPWjaRrkuFRFoxrD5HyABZIzrxHJydl9IPV/UmjIkRxAxrSzYuDar6+
	nWYgjvL/G/ZJrM2AwcalJU1DH3rEOSmhVTITVwPrg+Fik6GIloYfWpgXVD7y7evDRaolUeiFm6P
	64A5X/skarSu
X-Google-Smtp-Source: AGHT+IGgMkT9g6CRT1UVNf+bXwPeI5F8+IyNQ6zCu41lkafgAkGzuL9lD2u8Pbmq3wdAF4XS1bJQfA==
X-Received: by 2002:a05:6102:3fa3:b0:4b2:5ccb:1596 with SMTP id ada2fe7eead31-4b690cbd949mr36790293137.24.1737950687586;
        Sun, 26 Jan 2025 20:04:47 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:46 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 13/14] platform/x86: Update alienware-wmi config entries
Date: Sun, 26 Jan 2025 23:04:05 -0500
Message-ID: <20250127040406.17112-14-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
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

