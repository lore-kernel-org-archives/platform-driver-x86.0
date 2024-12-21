Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6A01EE7B9;
	Sat, 21 Dec 2024 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760850; cv=none; b=IcDisr49GqNXzu4Ups5jO79IGTfHXy14ufzDZzq7qUmR7NJzeUAoxuOs0QBwmAj9gV0zQ+qw3iiIxv1t+F15+UyCJ3KYjQ/enjAhHgtpPhkqubptxAP3aN/Nu9Ltl1fi+KQPdgivPxlHpxBexEue5CvstNqVQ9DBvKVcup10kIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760850; c=relaxed/simple;
	bh=3CEvQPYouDEXkZWfuJ6qjewj+SI5X4iK+eXr1RpnnFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mt1hg7lOC4ZlQMkY29ORQz3O5v/nNmzlscza7YXG/O8vKu+M3rUL9ph5+OJlyNg2hdm3rTzOZQPh/7jugK2c36Ec7U6lX3Mb9hU8HVRbTXHXIanJ5NQeG/umBpoMqVhih4hXiTzmmP0V9k320RTSyccjLi3CfWa+XDM3vjtbvjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKQxAyQH; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKQxAyQH"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6efc58fae20so22628927b3.0;
        Fri, 20 Dec 2024 22:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760847; x=1735365647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5/pJG+VdN3oh+ueecu+Yb7zNrojEE6yI7k/7ZR+Cow=;
        b=LKQxAyQHt6+WskSkmT/WWf8GzSqlpVZafJff5+pdMkqGdxoRyxFZut8/XzSLJqysjV
         5yYn08n2vg0OB5FRxiN9XVDSoAUIpgUBq8Q/yaOEQXnJTMj/FNuJRbnWAqdo/vCx3x1J
         naUo82YxW1kA+ZS/wfufuJM+v0mUSzSb2N1+qWDkoVuoX2UajoI6ZS4j/ax+71NGzHa4
         QINUiyK7yK+Qym/YGhNAsf7eG3GI7jb3Fo01VBGAo0N+b7NiGeRgyBp4Tm/4P1yLH/Hs
         eRz7WovVv9mmqDVxYjrM3w+VgDjIOUc3HjS7PQRMTDXsKXGNzGCDvmGk/Y75BZ8osflc
         wUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760847; x=1735365647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5/pJG+VdN3oh+ueecu+Yb7zNrojEE6yI7k/7ZR+Cow=;
        b=Qzbmcqo14J4mfkSmODrnoBAE5gWVdO1N4Vi/ywxJDfWU/nMHZDIg3Bizc2WElpMDnY
         aGwYj/2st7SrApMjMPOXce32KY2TMF35NLMJ9XicKW8Fe2fz3pdYdYvnmE+Hp0zWYcVh
         JJD6acyB2MUoJVE+2a+G3JvnGKCwurrlrEvq6gaw+dtAqlWGbqJI2ratpK0ykYGHZe5h
         z72xNadfonflJMZWWwqrrUzGsxm5RoNeFi5RaS7tlNx1eTgDooGcf69r5Kg8bWCH8HbO
         WvAv7pDmHP2NRZRTcqnPIW+2y5+p/GD9krU8ItRMPWtUy58pOpJRJu1jSa24XjGScga2
         T58w==
X-Forwarded-Encrypted: i=1; AJvYcCXPVd7D8gFfPuNLMucLPBOrwUJUkUOF3EtUhputUZouXob8l+ynAIqXw36+Qj59oTXsWfT6IivfZLEHn8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiFoIwM2xClp8dG9ie7xdimTvNHc9agmUQdnK9b8leCsyDSuMy
	g6Te55KtvuqLmC1t8UUgQCQzud4Zcg7K6wB+u+mOZVCw+jEQPh80l2RbKA==
X-Gm-Gg: ASbGncst7GPc8SdbRJvdoIxVIkD/BhUp0bZ2eCplwoByt37p/u5YN6eHT43RbaWY3N4
	KJ3b7fxD4jTSm7XBTqdMkDnQa1wtLk9RxlQkH7ykFRYv/E1OsbXzVcbmS7g2C9bdOkHEmVopWoZ
	SFx6FPoSOtZqSimLj2XqoI/SAVwrtkezVkq+UsekXmxCNBwukN0v7aZlRQYD30zGjN1Fbj7dLKZ
	hERlrG+vuCA7G9edUFoakVCLX7vMRfS2pGdNj1HaRgHdq7EnPiQKTnmlVCRaQ9v
X-Google-Smtp-Source: AGHT+IGiMgzYNvaUHdPBS2HMNK0HAXa2jXfU9qWgsJ//zkuIQmSJ7TnHOn8D14WzKHa+gP9mudfpaw==
X-Received: by 2002:a05:690c:c1e:b0:6ee:4ce9:b33e with SMTP id 00721157ae682-6f3f8118d17mr40133257b3.12.1734760846999;
        Fri, 20 Dec 2024 22:00:46 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:46 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 19/20] platform/x86: Update alienware-wmi config entries
Date: Sat, 21 Dec 2024 00:59:16 -0500
Message-ID: <20241221055917.10555-20-kuurtb@gmail.com>
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
index 78ac10122155..97b52e51cd7d 100644
--- a/drivers/platform/x86/dell/alienware-wmi.h
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -94,10 +94,33 @@ acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 int alienware_alienfx_setup(struct alienfx_platdata *pdata);
 void alienware_alienfx_exit(struct wmi_device *wdev);
 
+#if IS_ENABLED(CONFIG_ALIENWARE_WMI_LEGACY)
 int __init alienware_legacy_wmi_init(void);
 void __exit alienware_legacy_wmi_exit(void);
+#else
+int __init alienware_legacy_wmi_init(void)
+{
+	return 0;
+}
+
+void __exit alienware_legacy_wmi_exit(void)
+{
+}
+#endif
 
+#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
 int __init alienware_wmax_wmi_init(void);
 void __exit alienware_wmax_wmi_exit(void);
+#else
+int __init alienware_wmax_wmi_init(void)
+{
+	return 0;
+}
+
+
+void __exit alienware_wmax_wmi_exit(void)
+{
+}
+#endif
 
 #endif
-- 
2.47.1

