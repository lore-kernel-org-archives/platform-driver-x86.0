Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA13812C2
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 02:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611089; cv=none; b=gbZW+pLZSZY1Y4Mk05P7jB1aDlpT9ipNuz0pV6ZAreHZfjbeSn/+1AkHQtbEK7kE1w4vzFeJjduLLEb4pxpr+Ca5me//6yLvIATDr4ZqxLui6IPmtZbC+yWbeOFyvnRSGVW9JVTRDrXHEhKY+YPZUZUKm6MHY8ct35xKjNvgKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611089; c=relaxed/simple;
	bh=HZBXv4jU+OH7HPxkBvcIcczFxFHKKG0jFS4KYrWsCr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkAk5LyXgL+x/D2nIMVAnhltdzkZKiwpPY8RxKIBo1T+0iDyTweiy9P1cCIkQxzAS4+hFYh7Nzf+3Z+RUfAg7hf4+ygo0djdbXWJineXdhuddmBnGKL4UdeAQ1Nsr00ynLhaHkSo2rhNEJ8tEHlkSLiVubBnoMhhjNJbS2r04Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDpjiPO0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDpjiPO0"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso289773a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 19:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611086; x=1790215886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gsVWXpnjX78h0nmw4XlSnFALx3t9o8uakK9lz3EF6E=;
        b=HDpjiPO0ejwReNHOfXmIBm3Sk6V2MJzJ8HfUhc99Q0MpPLV6e7VxZxvBQ9AFDQylmQ
         W3YJnespGd+MW9JUJ7Zxvnc37VZ12y1yasBAgjig2jVQp2/LmeA+xmR6VrpoE2xKsMA4
         WTsC48oJyignIWj5gVseFVxzY1+lmByuf4QcKdwUfBUoZxcRkO/75rRzE1h0AcTky/74
         ZREo31ife4Y/CquG0uZR9fzKcVFazVnBZLsP/9p6sQ5BpUXOk/1e9WoOy98swVHK3r/V
         hiKhB6BbTtKMphyheERjZ1EeFd87HNLTUn21mM5d1xKlRe6gJ7SS2ifV0+2yeu2oxpc6
         S4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611086; x=1790215886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4gsVWXpnjX78h0nmw4XlSnFALx3t9o8uakK9lz3EF6E=;
        b=TwcxhNYiw6r3QeZeclPLA+oButoEHsA7qPDckGLheOI3RcGtJdGJMTmtQJ+xufo1Ab
         fz/xcDK3F1Slzm35hgCPqyUHhj3HxS2qjR+U8lC95uHy4AQJnufCjcX5d+MKPrJrWpm5
         cbcMQVOgLwhwQnH59dW/yeK13yDvChwZYXRmYdKPUVs/Lpv5KBculmL0YD6ZnGjOdw8L
         aYoqBVivRku1IBaYlT9I+c884zQAudlDBIqBTgvLHURZyy7VwjipzUiBsIuihUTKzSfO
         WvkJR05dWdtK1PLFSag+xRXpHI7kfcny4O2/qi+QvtdRuZkcAxe6NPRo7X6H59iCWo+q
         7iOQ==
X-Gm-Message-State: AFuF++mF+i9ki+9J3DIb8+R4M75zw10Jd0mB7FntFhbJCKxx7e64wGdv
	CMKEtCMmNSLdW5gphxJa+lhF8hNQ4wr4JRM0zznyeGRSfWjLzA4T2+abrn43gjjRgio=
X-Gm-Gg: AYBFou2G9kzJM/DHhBRHiA66M0VcfNAXW9zihE0fL5F6QmHyOa2ihFK1CTF8fpu/q3B
	sENjFqK3HdUceR7aGQWi1eYS0AmjXSobC/lO+zpu0tWTzJASu2A5AoqxAkYd1Zo4i1L6wIYAqQz
	dD+w0hoxPG9nImItzovAR1T9/lZvfCLDGGYlXtyCZrSpNOFemKIRPMpsct9iojpMZ4h7alb8lQ2
	tdHi2ARH6MD0A6y5tE9Vl1cAfvjaHxKUag+cukPcJIsO6m1PC2+s/m6vuMLreFILJPYSerdekrc
	sDaqydhDE8AZhtFFEQzLwQa9DriCnylQrn35DD+xelzH6PZGYCuhp2uu5+UOwAf4KE+NbrPamYT
	TyEqsZKDaIiZKWZYs1yqGB72x+wLiVZVugReyl868oDpuQ8LEoupMPUuC0WalZBKgcfTraNIaRn
	viWch9xq6J3ptsR1zGZVYqyb5aF/J4Pa3wN88Y52fhc5kJjxexo3ASUefifvWHBme0y4tJaR92u
	3IQYSQlRtIJTJmF+L3NTg52aSnPYUEbgoM=
X-Received: by 2002:a17:90b:524d:b0:39d:eca2:5c81 with SMTP id 98e67ed59e1d1-39e1e2dea05mr11005754a91.8.1789611086223;
        Wed, 16 Sep 2026 19:11:26 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36096735sm2341821a91.12.2026.09.16.19.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:11:25 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	bryan.odonoghue@linaro.org,
	W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chipang_kao <chipang_kao@asus.com>
Subject: [PATCH 2/2] platform/arm64: Enable ASUS WMI driver support
Date: Thu, 17 Sep 2026 10:10:55 +0800
Message-ID: <20260917021055.8029-3-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917021055.8029-1-chipang_kao@asus.com>
References: <20260917021055.8029-1-chipang_kao@asus.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire up the Makefile to build drivers/platform/x86/asus-wmi.c
and asus-nb-wmi.c without duplicating driver source code.

Signed-off-by: chipang_kao <chipang_kao@asus.com>
---
 drivers/platform/arm64/Kconfig  | 46 +++++++++++++++++++++++++++++++++
 drivers/platform/arm64/Makefile |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index e32e01b2a9bd..59aa389d9aab 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -103,4 +103,50 @@ config EC_QCOM_HAMOA
 
 	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
 
+config ASUS_WMI
+	tristate "ASUS WMI Driver"
+	depends on ACPI_WMI
+	depends on ACPI_BATTERY
+	depends on INPUT
+	depends on HWMON
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on RFKILL || RFKILL = n
+	depends on HOTPLUG_PCI
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on SERIO_I8042 || SERIO_I8042 = n
+	select INPUT_SPARSEKMAP
+	select LEDS_CLASS
+	select NEW_LEDS
+	select ACPI_PLATFORM_PROFILE
+	help
+	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
+	  Asus Notebooks).
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-wmi.
+
+config ASUS_WMI_DEPRECATED_ATTRS
+	bool "BIOS option support in WMI platform (DEPRECATED)"
+	depends on ASUS_WMI
+	default y
+	help
+	  Say Y to expose the configurable BIOS options through the asus-wmi
+	  driver.
+
+	  This can be used with or without the asus-armoury driver which
+	  has the same attributes, but more, and better features.
+
+config ASUS_NB_WMI
+	tristate "Asus Notebook WMI Driver"
+	depends on ASUS_WMI
+	help
+	  This is a driver for newer Asus notebooks. It adds extra features
+	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
+
+	  For more information, see
+	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
+
+	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
+	  here.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 7681be4a46e9..d608b2aa8c12 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -10,3 +10,5 @@ obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
 obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
 obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
+obj-$(CONFIG_ASUS_WMI) += ../x86/asus-wmi.o
+obj-$(CONFIG_ASUS_NB_WMI) += ../x86/asus-nb-wmi.o
-- 
2.43.0

