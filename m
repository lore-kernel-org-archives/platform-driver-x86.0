Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC92BE7BA
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387158; cv=none; b=twCA/5yghoM55yJ02sFynoWFuhlxarPSJQnNPggZqf1g847jz/S128itSdySEFnp/ecCm+ThM/ez8EYnYNhGij4BixKuOWaYjwlBC4hwjmO2XY5R4ovL5VqZexTXCKGKeEoH8JUcrWDZdHEaTV7L5MT6slE9yj2OR2v7TrBp0So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387158; c=relaxed/simple;
	bh=34+fkHSR6l4jKj4YWixRZYYin5/PZ48FReD1pd7ivFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCE3EeQxpAiMaAPbffMvBV7VbUpYbHi3zR3dHTMPxKRCS3r0z7Kc/CziQX+NqsK07bFHagyk3lbVMC8BthcZkfYeKtFwOEqiRr9GciaiPLaYomi238bEaftzBf2gS6ey1PdN3pRTDG1gt29Ud5B8V+J1dEamMSFmGVcmJkYIIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgwLiZiO; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgwLiZiO"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso2349667eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387155; x=1778991955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byCcm4UvUyAudsPVFuUMkipae/+5ZMC4ds8FS7jEx3I=;
        b=GgwLiZiO8kHYyhZ3YtGu3mlrNhgRyZqsKzi6oy+FvFeIYMboqd2Ld9wEYbOs7oUgQl
         TfDSJYwLurm9pTFfJXu166pzCzlLXDiPbafcQHKuYPCdzGb0jfsGOUu+U0DUlnsX5sX4
         LWBwX2XxFX7+0PxWzJyZ672s0Gevhjh/HozplsDsDeNVZMHwITm6G1TqVbXXZ+zkZ/X1
         UKq7Mgs8OoY9vEYoIR+5aEA6l60rg7vtUey9wOuvVaU2bGDauEKftmKV1xAwBsp1XbMk
         NDTyJGX2TAT+gXv4zTebSv9Q7QMap/C/8pUcneyyz5ZZ1z9r47oBA0YnkeXwh8XprJ+U
         NGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387155; x=1778991955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byCcm4UvUyAudsPVFuUMkipae/+5ZMC4ds8FS7jEx3I=;
        b=fzLJ+admu0jE6jWJspxQ4eeN2Wy0/DLa/Q8Nmtx0zVeORaz5bcAN8+YW+PaFfJCP3C
         Qpa86uk3iu8H6WrotfyLWqvbs0pB301zAIjsx0q9IR7c1uWevLTKQPrtoRRIJBwilm1m
         RwKmo447ay7SzW8EAcGAlk9Z68y3UfT3w5kYz31IoEiZLDSvaD1yE3RbGE0Vb+3BB2I4
         /paR6cMSemtMm6ePuGA4ZqmUCcCGWa4kcQIJdG6/GdFhlCg6QS0FXRE6EmQmBDA/7eee
         1/jHeJWrb7/alfY23NkKKe/rDoNtatdISZD5tpMmsVpadblAR5YRQoQABmImvccLn3yt
         0JHw==
X-Forwarded-Encrypted: i=1; AFNElJ8sPRONzNOt9T+LXnp6JfXgJB7efhqkByeF0cil+9D2p6wemKTFnyccvNouVRZaDuV3kVqc8ozsJHin5Y8uiAtgzO4K@vger.kernel.org
X-Gm-Message-State: AOJu0YxCGOlmkxVC95Xp9DTqp5sPsdVED40Dv7dpo0OCXqKiVZcwVbmG
	hHUDo39ScRcChYckecrTCDTOOiQ0jratGS+iu+HgVAQaLHyqeR737RKu
X-Gm-Gg: Acq92OG/hQDOhpttpgdcXFm+Y7dlEIeaiI5k4PBrHI6ZTrHTg00acDzPnR+Tqxp0cXP
	vNhVOr461w3HPGL4ZO0AhAJICa22bP8aW5leeZx175yhQ/8qEjUv35WZjXi1Vu6Ka59/6MB7jij
	/ajAn17g32rPgyeIJR2d97mfRk4OgLTMs3uSZEjvyyp8bIQeec3abj6z7JsrKojHLm7TkQAcFeP
	DoI0tQa9HCHUS6il3Ymg6BhprdpjLLFx09PuSGtr/7TJAhjAybXWbPesSJiLqUN1TUi7xIvpN17
	QIwmfRrtIDv7hatQVha/GLPWYBjQaQEL37L2fcWqFjb/M0JMsR8DW3PpDad1PyB5M9OUyDVVjOf
	PhRfP3T55xEmLQkSlvSY5mAP6e7cywtlKCiXzaAjrul5rqNYsDL7GcxlOYiE4+LTqZlyVJ6h/Pv
	x4rpHkwMwi4gZP8gj6o16B9fpd0qlIhpx0a1AVufx48l8jetPgP6uZKR/r/0N5q/Q4bkgEc7kY9
	0xy
X-Received: by 2002:a05:7301:19a4:b0:2ed:a58c:942 with SMTP id 5a478bee46e88-2f6e28f9a48mr5723905eec.8.1778387155325;
        Sat, 09 May 2026 21:25:55 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:55 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v12 07/16] platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
Date: Sun, 10 May 2026 04:25:37 +0000
Message-ID: <20260510042546.436874-8-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a later patch in the series the thermal mode enum will be accessed
across three separate drivers (wmi-capdata, wmi-gamezonem and wmi-other).
An additional patch in the series will also add a function prototype that
needs to reference this enum in wmi-helpers.h. To avoid having all these
drivers begin to import each others headers, and to avoid declaring an
opaque enum to hande the second case, move the thermal mode enum to
helpers where it can be safely accessed by everything that needs it from
a single import.

While at it, since the gamezone_events_type enum is the only remaining
item in the header, move that as well and remove the gamezone header
entirely.

Cc: stable@vger.kernel.org
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
  - Drop fixes tag in formatting only patch.
  - Fix typo in commit message.
v11:
  - Move to earlier in the series as later patches depend on it.
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
index f63e568a4e12..b4ed7af50a24 100644
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

