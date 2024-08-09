Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B985E14D6EB
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Aug 2024 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723209232; cv=none; b=fqqnZ8zEQbi2IpTiGENiSsU17nYeU/7NB9SohF8/zfmpGSo02w2d1FmPGutd573K8MhmFqXAmcPzAAFEUKfUoydn8FTmcpa4mpxAD57/6/cYRhzVfBO4NXdjUNJgzlrRgt2ref6dchxO4WqlYsZuOkstXBBLItUa98g9m//J6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723209232; c=relaxed/simple;
	bh=98Z/diLKNDBsST+GyskNA46yYAnNS1EgmuzelcgBkGU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mJV2/YHjTjleVVc5TLaPNsV9u5O3BS+hT4hvGDiOw+/XORLJjAgKVTKsR0g7Sd0J3ydGc9iNjUd57Jzi56ON/SgSwRDKGnIE1q0OY1Otv/QpTlhfr8JdbgQ6k0qCJ9JOIsN3oapnWT55wh1HsqbYhSEyDLzHmw/x2AxynhH5n+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3U2gxwvz; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3U2gxwvz"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6698f11853aso40853437b3.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Aug 2024 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723209230; x=1723814030; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qfk55jXbMJ+9XW8lw7BFbqVnIJpApyghmdPVYouiRvE=;
        b=3U2gxwvzxhp+p7WyFOS7vl6kVG5g4BRxj2cYPKMnIpBXD/LQQpa0cSp7phIHciDUoB
         UxohIqI9llqldjkQ2yj9wpLVY6oUdNi2v5MUrNQMrC5EfLkTqCknGJwHLn5aUOLHsG2H
         Rv30gBFILfWQ76TFu16ZV0qOlHKFwHS5hU59LmaRj74L3AXGceHanyh0qB76prJ++TIE
         9D2C8tLn6Zn5e3TPO+OL8S/gzvqPMI3YA5nt+8AYYb1AQz/2FrsnHCosI6I/eH0t1pjk
         0tSEETmvOSliVL1J9R83pT3qiOx1a3hBIq34L6z2Tas9l3HwPScBe5tDPj2s27rhpEKV
         J/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723209230; x=1723814030;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfk55jXbMJ+9XW8lw7BFbqVnIJpApyghmdPVYouiRvE=;
        b=ds9eGXDSz1UvJECIkSq3U2Ns8RBz25Yer9b1E2ucHQ52MTX2lPQ/0Pzczim9Kyk/Pk
         et+Rda+rl+k3K9pYC79mDEyd7no1NYEtX4DHFJfVtT19Iy7CwdnMNYnY7CukzCvq5MW5
         Yr9TpL8D+gGMGZe+mxIV+XlP4urak+9ekOK4Sr0K634x/j358DMFszEadxNs+7fo1fMo
         w0FoyoPOEiQdIKUY3696N67mTHfkReEfJsEb+pLAIdFiWBOT5tztE0VdPif/6AOG32ME
         Nxi2LMwPYVFtXci7AM8zyHhkWkwDAH+RSuoS1SJ4yHVEbKW0oBy79LLEpsvISqYOApNw
         0ljg==
X-Forwarded-Encrypted: i=1; AJvYcCV96fokG7toLhRVYtE0qHIlMqJ6GE8/hY3DjepCFlfERY8lZBYjb0IByyaLt2ahI6ZR9t7kXHKYTEca3OmZP/0CEXSev8FzZusre13gqqJL1LXnGA==
X-Gm-Message-State: AOJu0YycTxPW7Irz9G+3mS98AN8ZywCmcOMUpRP4OQG1dxg6dEvyOSQ/
	LIpQaVjN6iwY5h2RF3XBNkKorY/V0X9zLaef23QkvBaJWjTzrWPWK5cJtlqVvh66ENfzsyt/Tk9
	A8Tw+UOKX1EedKg==
X-Google-Smtp-Source: AGHT+IH4kJBCxiOiei21ZZPcfcqwWZSWG5cinBXlbnJTFOwf/ORgOJMo9yMLleQC22aHWj0qjIMdzl6ROAG0znA=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a05:690c:711:b0:691:2f66:4b1c with SMTP
 id 00721157ae682-69ec8c8e4camr110527b3.6.1723209229629; Fri, 09 Aug 2024
 06:13:49 -0700 (PDT)
Date: Fri,  9 Aug 2024 13:13:32 +0000
In-Reply-To: <28567169-4588-002d-85b8-906d22f12f05@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <28567169-4588-002d-85b8-906d22f12f05@linux.intel.com>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240809131343.1173369-1-mmaslanka@google.com>
Subject: [PATCH v4 1/2] clocksource: acpi_pm: Add external callback for suspend/resume
From: Marek Maslanka <mmaslanka@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marek Maslanka <mmaslanka@google.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Provides the capability to register an external callback for the ACPI PM
timer, which is called during the suspend and resume processes.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>

---
Changes in v4:
- No changes as this was introduced as a separated patch after the v3
  review.
- Link to v3: https://lore.kernel.org/lkml/20240730120546.1042515-1-mmaslanka@google.com/
---
---
 drivers/clocksource/acpi_pm.c | 27 +++++++++++++++++++++++++++
 drivers/clocksource/acpi_pm.h | 16 ++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 drivers/clocksource/acpi_pm.h

diff --git a/drivers/clocksource/acpi_pm.c b/drivers/clocksource/acpi_pm.c
index 82338773602ca..c629f5462bc0f 100644
--- a/drivers/clocksource/acpi_pm.c
+++ b/drivers/clocksource/acpi_pm.c
@@ -25,6 +25,12 @@
 #include <asm/io.h>
 #include <asm/time.h>
 
+#include "acpi_pm.h"
+
+static void *suspend_resume_cb_data;
+
+static void (*suspend_resume_callback)(void *data, bool suspend);
+
 /*
  * The I/O port the PMTMR resides at.
  * The location is detected during setup_arch(),
@@ -58,6 +64,25 @@ u32 acpi_pm_read_verified(void)
 	return v2;
 }
 
+void acpi_pm_register_suspend_resume_callback(void (*cb)(void *data, bool suspend),
+					      void *data)
+{
+	suspend_resume_callback = cb;
+	suspend_resume_cb_data = data;
+}
+
+static void acpi_pm_suspend(struct clocksource *cs)
+{
+	if (suspend_resume_callback)
+		suspend_resume_callback(suspend_resume_cb_data, true);
+}
+
+static void acpi_pm_resume(struct clocksource *cs)
+{
+	if (suspend_resume_callback)
+		suspend_resume_callback(suspend_resume_cb_data, false);
+}
+
 static u64 acpi_pm_read(struct clocksource *cs)
 {
 	return (u64)read_pmtmr();
@@ -69,6 +94,8 @@ static struct clocksource clocksource_acpi_pm = {
 	.read		= acpi_pm_read,
 	.mask		= (u64)ACPI_PM_MASK,
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.suspend	= acpi_pm_suspend,
+	.resume		= acpi_pm_resume,
 };
 
 
diff --git a/drivers/clocksource/acpi_pm.h b/drivers/clocksource/acpi_pm.h
new file mode 100644
index 0000000000000..c932899f04282
--- /dev/null
+++ b/drivers/clocksource/acpi_pm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ACPI_PM_H__
+#define __ACPI_PM_H__
+
+#include <linux/types.h>
+
+/**
+ * Register callback for suspend and resume event
+ *
+ * @cb Callback triggered on suspend and resume
+ * @data Data passed with the callback
+ */
+void acpi_pm_register_suspend_resume_callback(void (*cb)(void *data, bool suspend),
+					      void *data);
+
+#endif
-- 
2.46.0.76.ge559c4bf1a-goog

