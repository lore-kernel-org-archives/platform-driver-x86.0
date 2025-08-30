Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52225485A
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756532069; cv=none; b=Q7HDTiYC3hAfx2txJnGAtwoy0PKcViBzKOHLThGJ4TE7polCSZ+fvOR6enMlEklfnMSOb90i0xYG8GHxJZoC5G/onXCFntPKeabB1ew+14RHuOZeZ3ltt/37msWOBnUS2/vsCGhasDoHOLVowWYw9qAcs8QNMO2rdn5nEEtPO5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756532069; c=relaxed/simple;
	bh=yh1s/4XdOm4bfUnjYYkKcPd+/Q0qGHqKo6VPnyJx6aw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N8YVxny08EYsdsRTtJ6MJVmUxWMN/g32fHlysUcAyOESMlmvUfXahTlBD9nay8oYT2zeOIZK3Fq1Kd3W/TJLJLFUM41mhfLD0Q2nBFbRI5eAbvGqK/QKbXbyzlckBQf/x/+HFLGtaL/lVERxTq9VJu5m/VybKhfgeudHBpw1C5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=36vHN7AF; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="36vHN7AF"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-61d2ab4bc04so129674a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Aug 2025 22:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756532066; x=1757136866; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGlMhdHsRDhXgZTq2403xXjFFF1JZ/LTlsCLMGC7kp8=;
        b=36vHN7AFl/J69y0HFghxDuQ/x/ZRvkhRijIq1XGBn5f3m/uV3dH8nTH9IvMd0A2DnH
         U/m/R7H7bkRhfT1ZOGhyoaVoYEVsm3xF2tTGv011Q1b6jCWdzGe9rLydS8j7z3c7tLO6
         KCsJvzXtkmyd3jWrnQQg733qok+UX/KlOR+mXGrFPEDsuI9d+E2rT6dQmVAPF+BMJXVA
         mS1EKpYrCjKpPxsUKMKMW2SbEMdmBH9nrzLThLSLnshHWcWilaQqGMK9sdeLLxMUS3kW
         7YVdkHd1iqiqevQqU0zu3KNFqG19kOKIA1kQ8dMvTfxapNxeE49iXRLWirCLY34z8hZo
         HBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756532066; x=1757136866;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGlMhdHsRDhXgZTq2403xXjFFF1JZ/LTlsCLMGC7kp8=;
        b=lXJ4IiG2niRe7pExW+SdDl7QyLRAPFjHV7LwPAQcDYeRn8YNEN/id/HSD3+NstcAJJ
         unuZa19vVA02FWlZoNU2xPprAb4jIAwDZBJIdthtDdecRNVx5CPKPXAqDuVnFAFTAR+6
         2CkMflTyH58EFSUGmI5871cA6w5Q3JwEgAJDVRWxcJ7IouA/TwNvxt+o/1O5+YYsRZLP
         ZESyRooLzOEv5SCd8L5FuOn6IZ9h5qMIhcj5Jk++mTu3IrROre8tXcfNphuIjeGPg0hv
         C6CNb1XU9jBOVRRFkjsYhNO0ar4wuk++bbnxzeZHmuNW/0mGcaDMHI3h3t/bWEEJt/Ig
         9PhA==
X-Forwarded-Encrypted: i=1; AJvYcCWjAkUakqEypSvXmIbUtDgmPkQF+Msur7XULDC64ct9eheH6ZTMJKoO+9TBGZKrT57I2gqQjqkdYxk8oYv06P1wt1VJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy08olZT69VFg+dORFUhQAj0IYr37lxfbGzJP8VQjmBdArw4JT2
	uLf/O+qIdG+e/JTRCe6eqWmvffWq6r2782ClLe+DAWVEWOuaT+4ZMJC7Hg/P4Em0IDxv5mcIK2U
	ftfqkww==
X-Google-Smtp-Source: AGHT+IEu5x1ALBVIzEezIw0LvztceM59QoeusqIvEaPTRqp1/Ww5fpBS+OVA8nT4EL6qEP+OLj4cZeZZbLo=
X-Received: from edf15.prod.google.com ([2002:a05:6402:21cf:b0:61c:a931:8740])
 (user=srosek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:84d:b0:61c:ea57:6d6a
 with SMTP id 4fb4d7f45d1cf-61d26fd0f04mr806898a12.24.1756532066455; Fri, 29
 Aug 2025 22:34:26 -0700 (PDT)
Date: Sat, 30 Aug 2025 05:33:56 +0000
In-Reply-To: <20250830053404.763995-1-srosek@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250830053404.763995-1-srosek@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250830053404.763995-5-srosek@google.com>
Subject: [PATCH v1 04/12] ACPI: DPTF: Move INT3402 device IDs to header
From: Slawomir Rosek <srosek@google.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Alex Hung <alexhung@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, 
	AceLan Kao <acelan.kao@canonical.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zhang Rui <rui.zhang@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Tomasz Nowicki <tnowicki@google.com>, 
	Stanislaw Kardach <skardach@google.com>, Michal Krawczyk <mikrawczyk@google.com>, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org, 
	Slawomir Rosek <srosek@google.com>
Content-Type: text/plain; charset="UTF-8"

The ACPI INT3402 device IDs are shared between the DPTF core
and thermal drivers, thus they are moved to the common header.

Signed-off-by: Slawomir Rosek <srosek@google.com>
---
 drivers/acpi/dptf/int340x_thermal.c                     | 2 +-
 drivers/acpi/int340x_thermal.h                          | 3 +++
 drivers/thermal/intel/int340x_thermal/int3402_thermal.c | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/int340x_thermal.c
index 8fa85c866675..cf2e95a4f65a 100644
--- a/drivers/acpi/dptf/int340x_thermal.c
+++ b/drivers/acpi/dptf/int340x_thermal.c
@@ -15,7 +15,7 @@
 static const struct acpi_device_id int340x_thermal_device_ids[] = {
 	ACPI_INT3400_DEVICE_IDS,
 	ACPI_INT3401_DEVICE_IDS,
-	{"INT3402"},
+	ACPI_INT3402_DEVICE_IDS,
 	{"INT3403"},
 	{"INT3404"},
 	{"INT3406"},
diff --git a/drivers/acpi/int340x_thermal.h b/drivers/acpi/int340x_thermal.h
index 3ecd6c4bf2ca..cc1dfa56fc09 100644
--- a/drivers/acpi/int340x_thermal.h
+++ b/drivers/acpi/int340x_thermal.h
@@ -21,4 +21,7 @@
 #define ACPI_INT3401_DEVICE_IDS	\
 	{"INT3401"}
 
+#define ACPI_INT3402_DEVICE_IDS	\
+	{"INT3402"}
+
 #endif
diff --git a/drivers/thermal/intel/int340x_thermal/int3402_thermal.c b/drivers/thermal/intel/int340x_thermal/int3402_thermal.c
index 57b90005888a..213d4535f2c1 100644
--- a/drivers/thermal/intel/int340x_thermal/int3402_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3402_thermal.c
@@ -11,6 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/thermal.h>
 #include "int340x_thermal_zone.h"
+#include "../../../../drivers/acpi/int340x_thermal.h"
 
 #define INT3402_PERF_CHANGED_EVENT	0x80
 #define INT3402_THERMAL_EVENT		0x90
@@ -84,7 +85,7 @@ static void int3402_thermal_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3402_thermal_match[] = {
-	{"INT3402", 0},
+	ACPI_INT3402_DEVICE_IDS,
 	{}
 };
 
-- 
2.51.0.318.gd7df087d1a-goog

