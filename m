Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D72B288C0E
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756532074; cv=none; b=ZOM5eDfESPVGMetC9qNJKNXEaFyzaeCuM/00e8+hyHNLYJJeIifXsJFFYPVerg1F0UJheMz44cpv+Qs+V2nZ8wL6SLNRCxUD0/vwdKK6fVMeeMaamj95XZE2lUxSTRky7ifLaz8UlepF7i6kWS4b72Oe/vS0xIMAirFD/LGLB5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756532074; c=relaxed/simple;
	bh=WeyAMMzLWYrZ1HG1ditJpkumwo7ZPG/kpSkpToknfn8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i2Kgpt9BfyF4of0lfOECDxly+z+mHlkyOOsnZAqo+yNxz1/e2akjtNqRD3opeL6DpEEg4cFhAnGNvSfQcvZKZAshuC5sVJZwc7sDctIKMaQrKLf1FyeGeB/X+bWGF54YCRYyCnzfILo77DhRnH50Jc2Rx5ZNGUHoV3+/7+XLfdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QtHDm8Nx; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QtHDm8Nx"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3d226c3a675so106283f8f.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Aug 2025 22:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756532071; x=1757136871; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=53oYVzVPYcV4OUV7zinEsToKunRqJxZFVC5fXAK1M5o=;
        b=QtHDm8NxqNHOMCtJxXi13BW+u+p0+Jpl6uivD+uNCOQ9jNzDFmfM+wo4+tWSwzb87f
         zIY5VgSwKjS9GxOfiYK2gjg1t0FGg50ZEWcVB9zL0XaZcs81rOAZPZ8iZzQA+2Yeucxb
         zWwWcbfwI7klmMIYuoZaJBXwXGG/iWVVNRnrIam923LD4T0pdzEdIuOdzrf2Dm2L76us
         olQuqHwWZgZAhTDK5g+RpgtizHOFd+zDxk4h6tO+mVX9DfvpjCs1t4GxMDJ4Na9etUhs
         dDGXi88kleOEZ1W6QOnG7maLseIxXxKuUIpOSpsns0MBW2JDHFIXGxPnJ+ikEcGJbL/i
         berw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756532071; x=1757136871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53oYVzVPYcV4OUV7zinEsToKunRqJxZFVC5fXAK1M5o=;
        b=k0Cn7ep9d1YbOvHvvIt+BLmIqexjLEeeuvs5kIxuFYZ+NIG2nG3EiLkdbVQ73Oaq43
         RD2dCAhZEoBWyaOZG9bOXsF5ynaKkMU67+K2+tphDjOXY8pl2IDBEZe45R/nTldaskYs
         nL2olL4AuXzGVdp3f2nkHl+tlCwY/jdqX3+K8xUcQW1r4/cihhIEZ3J7UVd2M1pmT0PF
         W1RzPY7hjukQMEaXPIwiqva4Zw/0vc6MXqkdxfs4NxJCgQ/cY4z35QhQEUFcsTexlg2w
         9Olj7Op8jMzC7k5hGQhCAp1FxSuurMLJmnW28eePW3bpZy5HG364tElu3HwPcB3Fn8Ng
         Uwag==
X-Forwarded-Encrypted: i=1; AJvYcCU5ziQ0CQr9/AZd2B7hoU3GjIArp2zDkI+WwvHuGu75YtoRXyZzzmej/7Eh11cQQB/LoBFjsg1olB+QMLVrNy2RCAwB@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmppUsf1A/g/3Z5YYW2imSPQ/8+m/RgT7tKSsFr07/mNntZzI
	hEqfzHQJuX4VPn+TOXeZ4nWe1YgctZxKsYs3phGCE/mqjtuij8WawbmMcvlyc1clI36FCCSN7ZL
	udkhm2g==
X-Google-Smtp-Source: AGHT+IGavoR2KkplakvccW6xah6LvadtZMg8uiE4krf/YWshpmzVW6Bl00F5Z1tTeaucke/5WP8sSANpwLI=
X-Received: from wmbiw15.prod.google.com ([2002:a05:600c:54cf:b0:45b:7bf4:a956])
 (user=srosek job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64ec:0:b0:3ce:c602:58b4
 with SMTP id ffacd0b85a97d-3d1e06b02camr483474f8f.54.1756532071368; Fri, 29
 Aug 2025 22:34:31 -0700 (PDT)
Date: Sat, 30 Aug 2025 05:34:01 +0000
In-Reply-To: <20250830053404.763995-1-srosek@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250830053404.763995-1-srosek@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250830053404.763995-10-srosek@google.com>
Subject: [PATCH v1 09/12] ACPI: DPTF: Move PCH FIVR device IDs to header
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

The ACPI PCH FIVR device IDs are shared between the DPTF core
and PCH FIVR driver, thus they are moved to the common header.

Signed-off-by: Slawomir Rosek <srosek@google.com>
---
 drivers/acpi/dptf/dptf_pch_fivr.c   | 8 ++------
 drivers/acpi/dptf/int340x_thermal.c | 7 +------
 drivers/acpi/int340x_thermal.h      | 8 ++++++++
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/acpi/dptf/dptf_pch_fivr.c b/drivers/acpi/dptf/dptf_pch_fivr.c
index 952216c67d58..cb81636a5d63 100644
--- a/drivers/acpi/dptf/dptf_pch_fivr.c
+++ b/drivers/acpi/dptf/dptf_pch_fivr.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include "../int340x_thermal.h"
 
 struct pch_fivr_resp {
 	u64 status;
@@ -147,12 +148,7 @@ static void pch_fivr_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id pch_fivr_device_ids[] = {
-	{"INTC1045", 0},
-	{"INTC1049", 0},
-	{"INTC1064", 0},
-	{"INTC106B", 0},
-	{"INTC10A3", 0},
-	{"INTC10D7", 0},
+	ACPI_PCH_FIVR_DEVICE_IDS,
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, pch_fivr_device_ids);
diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/int340x_thermal.c
index 43afb6141b98..26522ddfcbaa 100644
--- a/drivers/acpi/dptf/int340x_thermal.c
+++ b/drivers/acpi/dptf/int340x_thermal.c
@@ -20,16 +20,11 @@ static const struct acpi_device_id int340x_thermal_device_ids[] = {
 	ACPI_INT3404_DEVICE_IDS,
 	ACPI_INT3406_DEVICE_IDS,
 	ACPI_INT3407_DEVICE_IDS,
+	ACPI_PCH_FIVR_DEVICE_IDS,
 	{"INT3408"},
 	{"INT3409"},
 	{"INT340A"},
 	{"INT340B"},
-	{"INTC1045"},
-	{"INTC1049"},
-	{"INTC1064"},
-	{"INTC106B"},
-	{"INTC10A3"},
-	{"INTC10D7"},
 	{"INTC10FF"},
 	{"INTC1102"},
 	{""},
diff --git a/drivers/acpi/int340x_thermal.h b/drivers/acpi/int340x_thermal.h
index 8a3d2a9b218a..41e4ca2bc6e2 100644
--- a/drivers/acpi/int340x_thermal.h
+++ b/drivers/acpi/int340x_thermal.h
@@ -65,4 +65,12 @@
 	{"INTC1100"},	\
 	{"INTC1101"}
 
+#define ACPI_PCH_FIVR_DEVICE_IDS	\
+	{"INTC1045"},	\
+	{"INTC1049"},	\
+	{"INTC1064"},	\
+	{"INTC106B"},	\
+	{"INTC10A3"},	\
+	{"INTC10D7"}
+
 #endif
-- 
2.51.0.318.gd7df087d1a-goog

