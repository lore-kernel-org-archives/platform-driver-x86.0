Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3703C383C86
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028292; cv=none; b=gud80gHwdS9lHRLEn3QtP9Iv+XQx0m8PVGygUtJ8S9EQfQw8CmUs/WHQnvp733HQvVNBfviIa8Fb+6b7/1kto5t5mfg9tPtujyN28r9V6Tic6guDcK9e2Q3TD5oJx+NZlzYsGJcl6wsDt+lTXyQJVnCiJyHqZQoEJ7B4udQD5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028292; c=relaxed/simple;
	bh=+KXtC06mzNgF38OJ1B+8or6FVJD6/rvwb8q1tr9zf4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=or1sPMZwvOrGp59ld/ii3xDIaO5ld92JGCZYh1+kNZ2xys+ojnqkydwAYegWbZ2gpVmpJ/KrlKnBgkebivfOUT8+d1dXBR7AcYxka3+AyHpkoyQaYym6HRad6YT9mEFX5yWzO3pv9aaBU4/iPjud64dsTgT4f3nEPi4u788nZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1GxU21X; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1GxU21X"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c287eb77fso3223346c88.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028289; x=1776633089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XP4KTURjqIFpmNlMgeAkPBqee0a4J2NWU1VmqP1JBM=;
        b=b1GxU21XRluAQSPdgpjLYppS1htVTiGwxVJWNIKOBkfz0Ez/qDmZH65ZgzC3rPzQoF
         KHjl1WH28/6NaLnMy8UKFWkc7AUllYQZtNQRczIW8m2AD7QSscFyjles3OhCUB2Rn2hK
         AChj33+PLR/YwaMMiPhgal/4o6tq514l/bZ8yDe3Xz7HFzVN2j42eirlUdf5smFRp8Ia
         CI1osYHi0KkkTO1Z8irmE67raW5zxE0Shc2Xll2l5UbMkeeHoc+4fZom7jOrAeZ2rWMl
         MNmLpNqDlrVhiq45I+7Ouz98C55gdD6XtkhoZepeCDoo7bMvEx7GE0z8jbZsVKuXdDvJ
         4aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028289; x=1776633089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XP4KTURjqIFpmNlMgeAkPBqee0a4J2NWU1VmqP1JBM=;
        b=fkakxsOvtUI26Tp4tq7yiNue+La+GaGrLKHZJo1dxAUaf5BAweqVoHmeNrSpAI5FQE
         34Kg8nK9IBMDH2FpZFvazeDceb+ZE4ibT/FFAFXekbsM/iaPYJ+sOaxMIZmSDYIdZ6c8
         NRUwSjVW4kycpueGI6QELsCr4i05m1gBazWjn0LiSmdJUT/y4ph6fRYFab8ZUv+jGAt3
         EkwAqInkqEtscdG+herjo01XX7Tp/xfP64KZqKDj7Syt7OUVpGRO6qfzuw70sXa+hvdS
         qFNT3Rm0YjrrImUoZDBqwflG7AYDaUFs7TZpONBLgYM7cffmO4utwopH6JGiMUJl9Imi
         nBng==
X-Forwarded-Encrypted: i=1; AJvYcCVEUWIbyLWPDqC9tmBRe3sfkMlIEZSvTa7zcf2KIHNdM6l1UOrlGTsQHn9c7p4bFAG93L3KnVrvAyzIL/3qmsI6OOzS@vger.kernel.org
X-Gm-Message-State: AOJu0YwB2tIif2y3ymwlDDfh2FeXl2MXZ24f9o/bdqj91VUW/3FU6qKS
	FfjOX6PYyR5ifYjhOtypMUjmAUmos6RSx4DCv0X+ea4ItysYRoLmPgYi
X-Gm-Gg: AeBDiev64l77rLf9yNXrdpkdCUdpijiAkm+Pz0VgZC17H9fx5ZBAf1GCY/ZvRPE2ABM
	gZ+GRzroS8O1G64HFOIsbEYG1aRRJSKiwiBJqe822KkWTobFepZ5JCLC3d0v4ardgk7o2J2MdLu
	5cQfO3Elgr3t3caqtooS2hc61bvqVbqt/NGsBna6T0WucXUtXUkn0cyOlouMGvjNdoMkHaVlaZ6
	qjwygPtYR5sCPh1QM0hhHbpLJW7JuKZjLXXHJkIrtFJiQt95xB5FTZCF7U13TPBC/ZSw5MNECfY
	VXH/gFaLZlF1nTcsv8YwzazcSWEBG/TcCRT1IkTG146+ExPuWNKhYQTS/b1z+DkKhsPvsYmimPK
	JbxVnTObuv6fUACd/ED79mobRvqW4LRtjNA3S4Lqi/+b7uTcKt7nwovPBztIfSBZouN4NqGgWv6
	akyY4tvouZTMtpXkwxdfOkzGk/m76DdLcu1mYq3S/+OkRCXWnNQzsiNj6v3f1XHx54pOtePOBz0
	PCO
X-Received: by 2002:a05:7022:6a9:b0:128:cf86:d1cb with SMTP id a92af1059eb24-12c34f16faamr6935911c88.31.1776028289245;
        Sun, 12 Apr 2026 14:11:29 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:28 -0700 (PDT)
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
Subject: [PATCH v10 08/16] platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
Date: Sun, 12 Apr 2026 14:11:13 -0700
Message-ID: <20260412211121.2220556-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
References: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a later patch in the series the thermal mode enum will be accessed
across three separate drivers (wmi-capdata, wmi-gamezonem and wmi-other).
An additional patch in the series will also add a function protoype that
needs to reference this enum in wmi-helpers.h To avoid having all these
drivers begin to import each others headers, and to avoid declaring an
opaque enum to hande the second case, move the thermal mode enum to
helpers where it can be safely accessed by everything that needs it from
a single import.

While at it, since the gamezone_events_type enum is the only remaining
item in the header, move that as well and remove the gamezone header
entirely.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-events.c   |  2 +-
 drivers/platform/x86/lenovo/wmi-gamezone.c |  1 -
 drivers/platform/x86/lenovo/wmi-gamezone.h | 21 ---------------------
 drivers/platform/x86/lenovo/wmi-helpers.h  | 13 +++++++++++++
 drivers/platform/x86/lenovo/wmi-other.c    |  1 -
 5 files changed, 14 insertions(+), 24 deletions(-)
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
index a91089694727..5a8f4aee02cf 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -21,7 +21,6 @@
 #include <linux/wmi.h>
 
 #include "wmi-events.h"
-#include "wmi-gamezone.h"
 #include "wmi-helpers.h"
 
 #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h b/drivers/platform/x86/lenovo/wmi-gamezone.h
deleted file mode 100644
index ddb919cf6c36..000000000000
--- a/drivers/platform/x86/lenovo/wmi-gamezone.h
+++ /dev/null
@@ -1,21 +0,0 @@
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
-	LWMI_GZ_THERMAL_MODE_NONE =	   0x00,
-	LWMI_GZ_THERMAL_MODE_QUIET =	   0x01,
-	LWMI_GZ_THERMAL_MODE_BALANCED =	   0x02,
-	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
-	LWMI_GZ_THERMAL_MODE_EXTREME =	   0xE0, /* Ver 6+ */
-	LWMI_GZ_THERMAL_MODE_CUSTOM =	   0xFF,
-};
-
-#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform/x86/lenovo/wmi-helpers.h
index 651a039228ed..ed7db3ebba6c 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.h
+++ b/drivers/platform/x86/lenovo/wmi-helpers.h
@@ -16,6 +16,19 @@ struct wmi_method_args_32 {
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
index 4e88d6bee00c..960d2e0f0227 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -46,7 +46,6 @@
 
 #include "wmi-capdata.h"
 #include "wmi-events.h"
-#include "wmi-gamezone.h"
 #include "wmi-helpers.h"
 #include "../firmware_attributes_class.h"
 
-- 
2.53.0

