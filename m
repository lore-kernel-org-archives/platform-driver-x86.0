Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94743612D8
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100277; cv=none; b=tGMknnQUHr8pFuejwNzFn2bLgQ4/38K4Nfrlc1NrGkebReeIPBoGuRQrMf1j83b6afmwOShKEy5oIrBtfakObW7fXNsaJmEF8PMKy5D6LYlpti7HuMpWDx3bPf07/bC9MTGiblRfqU6rfY4lyQ+J+qFoBfc4rWjq2g6Bj/9uzvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100277; c=relaxed/simple;
	bh=p2FW/7Co4gTuIHeXkZjiYHRP3A6bMG+GAgvWuoH8jxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHcn7LYLZSmFY4gu4CejcTFP4nChcgTBqh9+G3jyPPqH8yy+42Sh04BZgPIoc8q6ro7qkU+E1lnuKA7ZjbrsAOjXNDekXQgU4S1Ew+Znua/o0Nna3WHKCQkwvho/u+bS8H8jHLd91WES6WQuIuV2/OOqNuhx5hD5jZN9qAaVS+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmsSY2+c; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmsSY2+c"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c54c68db4dso825346eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100273; x=1775705073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z92RBuaPY9HUNloJ1nuQ1a3FjYPlCzVXIVhYHp9tSk=;
        b=fmsSY2+cnrZCab5MiEqSx/pmaSvf8AiLC40PGKoToGmL9pWa1RLkqQoTKBsE8bbse1
         JY0OohhFYQ/f8sTRJloibtD+m0inMFBCovbj++uyt90JD3ujIbZpWXWQo2+BQPHg6dCI
         Cn4dZEGijAMreggLfk3dndul8dCCfh3e7mLSPMNfXyYqO7+f8YCpPW62POl7CvAk2zKe
         dKCF5ptZOZpvEdHsc3ZngaeeUjIp91PY5Tbo55Y0gPXD8dwGrUUzKgD6lrq8KLHeroDX
         viHv+EB6EbNEre6regjfNYSDz+nPOjqKSp+yV43fGA0CcjkdxHhbilOQtr/CfHepOHQJ
         i7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100273; x=1775705073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7z92RBuaPY9HUNloJ1nuQ1a3FjYPlCzVXIVhYHp9tSk=;
        b=abACO8ucV2VZ8wRkL6Qq9bCGuBOPp5TMq3BazFF4A+UlsxR/mUqlR0/wV3ejjcvTj9
         dL/LnbKU2m+KO/ZdplLjZHdjbV9M4sO7tN08oQ9NdfbotDCu1Akco86/dCwv3uIcWkPa
         djAbmiyEBDvJkP38cvehHpXnvrirpEe4hhjrb1YIXWuCzzOQsSskAUXpvB5AjM92m/+c
         qzbi0xA0j5+qga8XojLWymTZGmnkKRYFO+mTjLOwQ2WRuDJHh/8ZdtTewruZqwlLN6T6
         3hP2uVidyIbrcrMiSfocRD2+aoSuNcGJFVBAchRKJ8kzKoWEM6ABKmMbs4H6V0ZLr0Q+
         V/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp0IJxsi+0bgrpZyWCoPxW43do03xYUdWqfAAFMSdpIdVw2YykZff6JJYPC4qmaKAU/FYLciAtJlCuw9YV9hA5tXS/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8rmyqKYyXoPm1PAKlD1qZAam8sRowJhdJLAeEIFoGaizKXrM2
	PLTYvwUn+JHIbI+9DmB/0yJ+YM4VToPxD1Mw7bcLHAArJ4gUGUweYOp3
X-Gm-Gg: ATEYQzzpEKoSSj56uTszMI3EriiaB+Oq+eoPJj3yku0zn7E7laCTZJDZ3JbqQDjWnG0
	+9XqUxPBcgMVtpbVu/skMis4rPfudxJpecxQBK9tjwQzod2LpwqonQbuKLcnYoPkCSLC8iw0hUZ
	yY3Sa/sFbuXHgMD3KvKPXoRr/NvISH3rl/Q28JEOc7Za8YOgriQe7hl9QDa5YUkEjHZiKIUOk+j
	CQCj+YQss0kPWRg1aY1GycWruBE8X+E22zuSe58DgLyT9iZQv5FEUgTJCMqRbEHXv4w+mXL2KuO
	n4IudBQsKr2S1fBTShee999q16xGoQKyU7IiJSFCjg0kl8BmE47vE6F7eAWTOjz09UokRP7dj0O
	J39syRSGb6nNEYuSWxjyrauITiKq9ksv7AkG2B+ItM+Ly8bg4zcNk77gcq2xUPYYVILljo0Svvv
	0wF4hdS2R+gCbkrUsZWy20iGzCNOoR3llMRBJOE97cmwP8HXceXk/aTnehUYF6/ouplc7kcYm5Z
	06L
X-Received: by 2002:a05:7300:2211:b0:2c1:5b23:1752 with SMTP id 5a478bee46e88-2c932bb1657mr3343404eec.23.1775100272848;
        Wed, 01 Apr 2026 20:24:32 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:32 -0700 (PDT)
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
Subject: [PATCH v7 08/16] platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
Date: Thu,  2 Apr 2026 03:24:16 +0000
Message-ID: <20260402032424.678528-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
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

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-events.c   |  2 +-
 drivers/platform/x86/lenovo/wmi-gamezone.c |  1 -
 drivers/platform/x86/lenovo/wmi-gamezone.h | 21 ---------------------
 drivers/platform/x86/lenovo/wmi-helpers.h  | 13 +++++++++++++
 drivers/platform/x86/lenovo/wmi-other.c    |  3 +--
 5 files changed, 15 insertions(+), 25 deletions(-)
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
index 1d1bab98298b..e475d1d8a5a7 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -46,7 +46,6 @@
 
 #include "wmi-capdata.h"
 #include "wmi-events.h"
-#include "wmi-gamezone.h"
 #include "wmi-helpers.h"
 #include "../firmware_attributes_class.h"
 
@@ -787,7 +786,7 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 {
 	u8 modes[2] = { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_NONE };
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args = { 0x0, 0x0 };
+	struct wmi_method_args_32 args = {};
 	bool cd_mode_found = false;
 	bool cv_mode_found = false;
 	struct capdata01 capdata;
-- 
2.53.0

