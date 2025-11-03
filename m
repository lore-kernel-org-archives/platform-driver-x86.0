Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCB5316909
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762187123; cv=none; b=fHmNwZWPV41Bc3ogtngQhHOrfxFsA+xgbhFmO9YlRs4L/aPv80eYpKa+4U3lR7TSnord7rWSLadaYsx+9jrRVHGCDzaIqHI09MiIDh4JVM0hfMf5qy848cybNkK1OJskym45G0o9rpbiCsP9A5IxxAKzlQR2O6sKNCyo9zyF4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762187123; c=relaxed/simple;
	bh=iledZpCWHowPsGGVgE7Q0VXSBdLvfArqJvITh4riefI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BhDorOjQe6qn7zA5XT9cxOl3f9jtHeF30spTy3plYvgsfyKAavTr7neuUpZi53VQi8FdK78MmD0FcCUpw+Hgm5AQBs1w7vQdxJcSOML3uejUJ6kihjIhZwhL8Bf0jEwpxmO7Yme93WLY9DECqmQqx4aWdnH2pqhZ2c9tXjptuA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b7yf7tkJ; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b7yf7tkJ"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b6d7405e6a8so615871766b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Nov 2025 08:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762187120; x=1762791920; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3aNYZfnkxna/4RIx3b9013iC2qfLXU8VIi3YGpltHmo=;
        b=b7yf7tkJsUy0dcKnTUNALAQWRLJnCAauUm0Y6QquwKfgianvo2FEFRlbCJMim2WAy0
         wKJbilIhWDHg4tF7j8pTXZfJFyheg4EI0ybLyC2eDAiqt1ffciet2E4hbZpeCP5q7S3J
         zrUBKmEgW1fo9lgE25fAWr5bsGmBdsFMSBtEukYz41GtGyKsYAGorcfTGbdxksgjCE3F
         BD1ayhP9ekZ1Oe3uR9AFQZ2OPWh1a8WwarDVZFk9IrHfS6o3+Sj0DkZtoMLRG9X5C6Bz
         t/nvxsu5lKkA2RpX5eAgIue3d9LF9bPlNcnXNhT8LrDx5OiQ9sewCC3jBfoQTKrpGZ6R
         DAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762187120; x=1762791920;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3aNYZfnkxna/4RIx3b9013iC2qfLXU8VIi3YGpltHmo=;
        b=DzRK1mtTMKi8oFLrIpEbBBh2CVdYe78jwhEgPpOkqXJ9ICHwBRmcMt0FktruIA9nIS
         HW7IE7tooW6w/TqgKU18PYjBs7mMUknXyxlZ5n7Yyhe2hYAbOWvWaxRCHJouO1dXzRmm
         kGlxoH/nygkXzFA7uNThOrviEd9ievIs9LqsQNqE8MPfsjbPsg7N4F9EHV/gR1qcxt7z
         +9QfWA2IBbArYqL3d73ireyNpD0rT1VduWAuqy1x7S7FE5B7EHKFIcdtOHB1fat+DWDh
         V4TSQ7HeAeKgq/m++6QdY0/dkTmlbbsC5j2PjRZvV31yNY1Y00IqNXzeWPoCfPW5ctsC
         bgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMT1dy7TzF4jQgbc5OTCBp4mx0XUhmLGwFQkMLDbnbNxgfQszfO7xXg3uJVXnXcLkJoTgSuT1NBtEhi3Nym6Rnld5n@vger.kernel.org
X-Gm-Message-State: AOJu0Yxag07oznv33lTIwQUUSJEtJp+i7sPmo74Pa5b8nlC7hNlsQPaP
	8fgIbrJZ3BQPrpZXZsDwonFJtL9yXG49oaVvfwPnrXVoL18XQa3e6y3p0TrlbY+mhAY3zf2XflD
	BS2EIlw==
X-Google-Smtp-Source: AGHT+IFpoWkR5uRGXsDARlaXbdfWBh5H3ZlTN7xe/chicxODMEiCCA4KCLz9GdBge0T6QXFDddELCpldi98=
X-Received: from edt4.prod.google.com ([2002:a05:6402:4544:b0:640:68b4:68ff])
 (user=srosek job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7f9f:b0:b6d:3456:14b3
 with SMTP id a640c23a62f3a-b705211c6b2mr1815535566b.20.1762187120128; Mon, 03
 Nov 2025 08:25:20 -0800 (PST)
Date: Mon,  3 Nov 2025 16:25:14 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103162516.2606158-1-srosek@google.com>
Subject: [PATCH v4 0/2] ACPI: DPTF: Move INT340X enumeration from DPTF scan
 handler to ACPI core
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

The Intel Dynamic Platform and Thermal Framework (DPTF) relies on
the INT340X ACPI device objects. The temperature information and
cooling ability are exposed to the userspace via those objects.

Since kernel v3.17 the ACPI bus scan handler is introduced to prevent
enumeration of INT340X ACPI device objects on the platform bus unless
related thermal drivers are enabled. However, using the IS_ENABLED()
macro in the ACPI scan handler forces the kernel to be recompiled
when thermal drivers are enabled or disabled, which is a significant
limitation of its modularity. The IS_ENABLED() macro is particularly
problematic for the Android Generic Kernel Image (GKI) project which
uses unified core kernel while SoC/board support is moved to loadable
vendor modules.

The DPTF requires thermal drivers to be loaded at runtime, thus
ACPI bus scan handler is not needed and acpi_default_enumeration()
may create all platform devices, regardless of the actual setting
of CONFIG_INT340X_THERMAL.

Link to v1: https://lore.kernel.org/all/20250830053404.763995-1-srosek@google.com/
Link to v2: https://lore.kernel.org/all/20250917120719.2390847-1-srosek@google.com/
Link to v3: https://lore.kernel.org/all/20251002113404.3117429-1-srosek@google.com/

In v4 the SoC DTS thermal explicitly depends on the X86_64 and NET,
so the INT340X driver may safely be selected by the SoC DTS thermal
driver. In addition most of previously submitted patches are dropped
as they are not necessary, instead the ACPI bus scan handler is simply
removed from the kernel, thus all platform devices are enumerated by
the acpi_default_enumeration().

Slawomir Rosek (2):
  ACPI: DPTF: Ignore SoC DTS thermal while scanning
  ACPI: DPTF: Remove int340x thermal scan handler

 drivers/acpi/dptf/Makefile          |  1 -
 drivers/acpi/dptf/int340x_thermal.c | 94 -----------------------------
 drivers/acpi/internal.h             |  1 -
 drivers/acpi/scan.c                 |  1 -
 drivers/thermal/intel/Kconfig       |  3 +-
 5 files changed, 2 insertions(+), 98 deletions(-)
 delete mode 100644 drivers/acpi/dptf/int340x_thermal.c

-- 
2.51.1.930.gacf6e81ea2-goog

