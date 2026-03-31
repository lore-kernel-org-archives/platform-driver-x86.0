Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C5644CF5A
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980741; cv=none; b=YrSnSl9oWXUeDN97xek2RuoOnEqMMvjYkJ2LKI63SpzrOw67/SbW53OSiyfRJB3iXTuyklgoHlF2QF1ixiY2kLTqHEFwc7ScFfZ7gxbWDEMGINK/72uZ9Oa18BXISVsMHOs/fQ/qNzfjKXo1vvJt1QJIr70vOMWnXMvvLusCnFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980741; c=relaxed/simple;
	bh=RUF6t4ksH3+nFjNa/ECg1twJPUBbR5LkFCNJ/uLZ+GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiP/M3fMjMI54tTpkdSKZIWesdsS5T+pze1pjKOW2dcowL6S4xQt+6GPSgVPNNoHny1DyJC52J3fy5rjKqnBi5Nh8I0G3QY4NGiP2O99f9CpIKYa69ol0aHyUbcQIzdpPUTvo4hMhAniMcvhXLbQ5TsrZrnMYYm6ULz3BEiHJ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9BGbJQD; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9BGbJQD"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12a71ade78cso7162094c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980736; x=1775585536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYDZZUdXHQOIG413+yyAPDGJHZ3/DMXcsJz2jll+0Jc=;
        b=Y9BGbJQDpd/ZK1efkA4OoWugvOUTo4nPQ2jKCq+wp3D4hAlc46ytG7rSeCt11F5bnO
         HnDm4lYR1MX2CT0tNf0GasAYpQkZn6Fqd4RHI1Mvt+pD09D5dSY4/DnZs0C7JlQvbYAy
         7hqmXzeRfKL88MHdzaKkV+jcTw2bIXZEIJ1wEiBn42G3asC20yhCGlSQ9DQqsPE+v/cz
         zZSY0UXRQXbJodoeJyIGnWVe9XOF5xtEGlRtTIDoLRNlnKvbAiJQMjNCcTuaKd41RoGm
         /XtSBEwz8tje5U6FOrVqgEhGi2oeTfHoCR6CgXlZBrheJQEv4+d0V18Vhuxm6rjpZE+o
         Az+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980736; x=1775585536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FYDZZUdXHQOIG413+yyAPDGJHZ3/DMXcsJz2jll+0Jc=;
        b=V16M+oGXFGqBidLhJBAgjk1Eq2rc57NNXE+EAs8+h9Zkl6gDl1Ks5MB3Y+SsSsqDiP
         PTue9vy+F4yDptYG/6G/1+WBviuwpp/EgxIihRS/IX4YYx/Vcy9GrakOeI/276/NMOPN
         X6IoYHMeXb7gK5wUKp3B47O3ghpzVx77LIEOGRo8zsuPACB+Oy8yAKsPrsp5Sw2qO5h9
         yc1lvPAkEJKJ70tZOZRrWEr7mjGH7f7lsHkp2ODJrbdMwuiDGWf5IzCTXqpqhYErHBzh
         gg+3qPmbpmXi9Kp+xsyQnbjjAHZD98CkkEcZrFhIHIyGxc/GvU5mtpWz7w0qxInZ6Cem
         Htqg==
X-Forwarded-Encrypted: i=1; AJvYcCXofjGwj0UguI3jm8UXUwL6XtbZY2wZRA2BorYBEpeBwNCy5660PJDhKs7KFlvnc4JJi+faO+3BZznwXGcP+fN40wff@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv8SYtbhZuIKNY06DeRkT8WhGo+IYJS86iYnC7Jzss88BitR10
	eiEwA3Eblx5VfsNsTwZiWfl3bkfHRa5sC9Ckepx8f6UFug5e1oGAtusk
X-Gm-Gg: ATEYQzyB4yEM5LvE4czPmZ+vVdLU1ceU528JwEdjfLZP80PBFeRpi1WDnGQ9qLUcxlf
	SOWb4YcJKMr0C2uajmNJ70c8zKi6/AM5DD8WLqUOB16JPnWTIlS4URJw7CAidjfygDlW7tMeiqD
	ooSp9edFsMwrFJGqGmABARRLBNZC1oSOyJ4vVDMo9yXH0MwsDB24tXri1AsDSfJaMEAjBuBeDld
	iNzER8n0j+8kbha+KKXrZYYAezmRH7ZIHv/tUd3YUuRsXjL/cNr8C7VEcELuGLMxrYxIs0N8P3s
	PeHGSQSClWywqREUDiDNqmYVGBUcW3PAdCRcjWLQst5D90g3b2eWFw4BCOMUxwKWjCrIfiXjDKN
	TBNfC90EGQfggAAV/y5bTMRdsa1bMv9OAUgeRwfE6iFJwxDsijC0KK1FeWl9eYyiGbAwsqLg7YK
	uSIkXqh5iJ7DGPB5szA8HYCZQaYOmgyYQshIT4GVZXxUgHr2sdzL/nLEfqkn7fKuJtGSJyxzCwu
	2i8
X-Received: by 2002:a05:7022:e19:b0:128:d4db:447b with SMTP id a92af1059eb24-12be65952ecmr235849c88.38.1774980735729;
        Tue, 31 Mar 2026 11:12:15 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:15 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/13] platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
Date: Tue, 31 Mar 2026 18:11:59 +0000
Message-ID: <20260331181208.421552-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331181208.421552-1-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the next patch, the thermal mode enum will be accessed across three
separate drivers (wmi-capdata, wmi-gamezone and wmi-other). An
additional patch in the series will also add a function protoype that
needs to reference this enum in wmi-helpers.h. To avoid having all these
drivers import each others headers, and to avoid declaring an opaque enum
to hande the second case, move the thermal mode enum to helpers where it
can be safely accessed by everything that needs it from a single import.

While at it, since the gamezone_events_type enum is the only remaining
item in the header, move that as well to permit removing the gamezone
header entirely.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-events.c   |  2 +-
 drivers/platform/x86/lenovo/wmi-gamezone.c |  1 -
 drivers/platform/x86/lenovo/wmi-gamezone.h | 20 --------------------
 drivers/platform/x86/lenovo/wmi-helpers.h  | 13 +++++++++++++
 drivers/platform/x86/lenovo/wmi-other.c    |  1 -
 5 files changed, 14 insertions(+), 23 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h

diff --git a/drivers/platform/x86/lenovo/wmi-events.c b/drivers/platform/x86/lenovo/wmi-events.c
index 0994cd7dd504..9e9f2e82e04d 100644
--- a/drivers/platform/x86/lenovo/wmi-events.c
+++ b/drivers/platform/x86/lenovo/wmi-events.c
@@ -17,7 +17,7 @@
 #include <linux/wmi.h>
 
 #include "wmi-events.h"
-#include "wmi-gamezone.h"
+#include "wmi-helpers.h"
 
 #define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
 
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 381836d29a96..602a48de1b4e 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -21,7 +21,6 @@
 #include <linux/wmi.h>
 
 #include "wmi-events.h"
-#include "wmi-gamezone.h"
 #include "wmi-helpers.h"
 #include "wmi-other.h"
 
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h b/drivers/platform/x86/lenovo/wmi-gamezone.h
deleted file mode 100644
index 6b163a5eeb95..000000000000
--- a/drivers/platform/x86/lenovo/wmi-gamezone.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-
-/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
-
-#ifndef _LENOVO_WMI_GAMEZONE_H_
-#define _LENOVO_WMI_GAMEZONE_H_
-
-enum gamezone_events_type {
-	LWMI_GZ_GET_THERMAL_MODE = 1,
-};
-
-enum thermal_mode {
-	LWMI_GZ_THERMAL_MODE_QUIET =	   0x01,
-	LWMI_GZ_THERMAL_MODE_BALANCED =	   0x02,
-	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
-	LWMI_GZ_THERMAL_MODE_EXTREME =	   0xE0, /* Ver 6+ */
-	LWMI_GZ_THERMAL_MODE_CUSTOM =	   0xFF,
-};
-
-#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform/x86/lenovo/wmi-helpers.h
index 20fd21749803..3364d8e152ca 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.h
+++ b/drivers/platform/x86/lenovo/wmi-helpers.h
@@ -14,6 +14,19 @@ struct wmi_method_args_32 {
 	u32 arg1;
 };
 
+enum lwmi_event_type {
+	LWMI_GZ_GET_THERMAL_MODE = 0x01,
+};
+
+enum thermal_mode {
+	LWMI_GZ_THERMAL_MODE_NONE =	   0x00,
+	LWMI_GZ_THERMAL_MODE_QUIET =	   0x01,
+	LWMI_GZ_THERMAL_MODE_BALANCED =	   0x02,
+	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
+	LWMI_GZ_THERMAL_MODE_EXTREME =	   0xE0, /* Ver 6+ */
+	LWMI_GZ_THERMAL_MODE_CUSTOM =	   0xFF,
+};
+
 int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 			  unsigned char *buf, size_t size, u32 *retval);
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index c3614bc4f90c..b24bf98c19ad 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -47,7 +47,6 @@
 
 #include "wmi-capdata.h"
 #include "wmi-events.h"
-#include "wmi-gamezone.h"
 #include "wmi-helpers.h"
 #include "wmi-other.h"
 #include "../firmware_attributes_class.h"
-- 
2.53.0

