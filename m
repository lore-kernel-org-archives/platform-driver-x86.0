Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4322A7E9
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756532068; cv=none; b=uS0vwArabc68ub/pIOShBD+18qUSd/Z3pTDDuuqTiObYutXhEPB3DpUUapM0kRTZzMfJiTiu16wbDhJV74QKpN4frFUISCY7pkydiMRQ9m5u4MjFUlocd/QUFFOeUdrNfR8BsFuXxY38yjj+MJVUe43Pz41wA/EtECeQPmGTqo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756532068; c=relaxed/simple;
	bh=0MiGYP2Mz5LWty6AFyG9t1omzpzeezzzMPzyLnU2UEg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q6D8fx/i/beo/I+fQkDBxOoDzSg+jdgQl1OnpvjndapwSSSLLsE22YiXNjt4bSEo09c0qP5iOqctNxEASx635fruPqN6IIfFy8nW2iRNS1OdEVirGX6lsM8M9X2M4G9qTBI903hpgLwG6xHdww3OrN2XTjkWoGdBIYOC8CbUq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f3ma+cL3; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f3ma+cL3"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-61c6d735f15so5303280a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Aug 2025 22:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756532065; x=1757136865; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M9L1nkxABQJUEtCVPrNX6Jr6k7pIhnucDCQr+9k/IqI=;
        b=f3ma+cL3B8vULgulqF20NwYR6PIqcShI+0KDuQLYj2ZawI29iezpNN33ClkXRaEmRE
         BFRnqu2CHBHkWn69YANdXhijDl0mdaxJaYdX1HoBYmBGOMdTe7ChbxCXBs31F4z02bUg
         KF7QbAZ95TtmqhtUJdkY5jSQjJRaCv6j53Ur+exB9Tw/O6Gqf2Sy6b951AZOT1tjLzjK
         L6I7TduPZ4yIXFGs5Gmd7OXphmmmGRcFlbHMkqANgVFtbRYyjmYGKUIB6tlEO9gkXRxG
         J/+AXTPXZAL2B/k806e3Zs/CDyMUbEea7+VqCsmTzmRuTT5TuuUdqIJtbXB/m3/iM6Ng
         jadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756532065; x=1757136865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9L1nkxABQJUEtCVPrNX6Jr6k7pIhnucDCQr+9k/IqI=;
        b=ojIlyaVlJTAy0mwcA6+sAQ4fCJG9scDMXgmE4HijfLNhPIPgOsAvWQkeg/I4g8zvfg
         ICDcJE9Dv+jEhqw5sRpon00AcGSQGRPU01PsFFS9gU+s+C4JUaEgnqLbDb9vWrh2K5rm
         k3Mv9Oo+zbq2PpZ0flXM+hd4VLqnpGW/zhk42WtYz30qt9R3TyQuVasEiwbrduXfu0/p
         8WsvfBswNRQnfGTtOOTRbvxt6RQf0gO7e+hQaco/issFh/DdmlG1UqBiHF7KQGE5MF1B
         LqQU6SZpvawig86pH8yGuDL2I3hjsT+vtyqq8zMJN32/MgWIPzZiSRkvOlQtFx7thtCX
         xzzA==
X-Forwarded-Encrypted: i=1; AJvYcCVpLfpq4icQ+I+tyxPN2d1W/heyCQrdPwmXIQCWz+DRM+9sH9Cl4HHHQPTNTE4gFQcgbWwFSpvkvcooa4JGPokxr1th@vger.kernel.org
X-Gm-Message-State: AOJu0YxPAbWq/d1uXojV7FLQGhFiA40GsMFwsbcariRxjDogAfBiBx31
	x1Eiexuc8Ate3MjFbbrOjrxpGVoqy1V0+qq08rA9iHVv9HES8tIH7tVtqEhCqdPzhxmag+XwhJx
	dd95u2A==
X-Google-Smtp-Source: AGHT+IHQuR2VbVue00JTSESIg55Oze2Ld/CVh02VVLZuWezXy385eDUiq9erf15ezLaNCooMkIo9E71MadY=
X-Received: from eddp19.prod.google.com ([2002:a05:6402:46d3:b0:61c:9691:c1d4])
 (user=srosek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5216:b0:61d:e4a:89d1
 with SMTP id 4fb4d7f45d1cf-61d26eb5d41mr764225a12.37.1756532065107; Fri, 29
 Aug 2025 22:34:25 -0700 (PDT)
Date: Sat, 30 Aug 2025 05:33:55 +0000
In-Reply-To: <20250830053404.763995-1-srosek@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250830053404.763995-1-srosek@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250830053404.763995-4-srosek@google.com>
Subject: [PATCH v1 03/12] ACPI: DPTF: Move INT3401 device IDs to header
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

The ACPI INT3401 device IDs are shared between the DPTF core
and thermal drivers, thus they are moved to the common header.

Signed-off-by: Slawomir Rosek <srosek@google.com>
---
 drivers/acpi/dptf/int340x_thermal.c                     | 2 +-
 drivers/acpi/int340x_thermal.h                          | 3 +++
 drivers/thermal/intel/int340x_thermal/int3401_thermal.c | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/int340x_thermal.c
index 04df20ef1a2e..8fa85c866675 100644
--- a/drivers/acpi/dptf/int340x_thermal.c
+++ b/drivers/acpi/dptf/int340x_thermal.c
@@ -14,7 +14,7 @@
 
 static const struct acpi_device_id int340x_thermal_device_ids[] = {
 	ACPI_INT3400_DEVICE_IDS,
-	{"INT3401"},
+	ACPI_INT3401_DEVICE_IDS,
 	{"INT3402"},
 	{"INT3403"},
 	{"INT3404"},
diff --git a/drivers/acpi/int340x_thermal.h b/drivers/acpi/int340x_thermal.h
index a0d379492a79..3ecd6c4bf2ca 100644
--- a/drivers/acpi/int340x_thermal.h
+++ b/drivers/acpi/int340x_thermal.h
@@ -18,4 +18,7 @@
 	{"INTC10D4"},	\
 	{"INTC10FC"}
 
+#define ACPI_INT3401_DEVICE_IDS	\
+	{"INT3401"}
+
 #endif
diff --git a/drivers/thermal/intel/int340x_thermal/int3401_thermal.c b/drivers/thermal/intel/int340x_thermal/int3401_thermal.c
index 96d6277a5a8c..e0603f218d2e 100644
--- a/drivers/thermal/intel/int340x_thermal/int3401_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3401_thermal.c
@@ -11,9 +11,10 @@
 
 #include "int340x_thermal_zone.h"
 #include "processor_thermal_device.h"
+#include "../../../../drivers/acpi/int340x_thermal.h"
 
 static const struct acpi_device_id int3401_device_ids[] = {
-	{"INT3401", 0},
+	ACPI_INT3401_DEVICE_IDS,
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, int3401_device_ids);
-- 
2.51.0.318.gd7df087d1a-goog

