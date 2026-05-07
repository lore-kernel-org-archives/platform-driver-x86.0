Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0444779A3
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177130; cv=none; b=BgI5+ZU/TIWBZnsTBbGzgD78bgMHH4kg0vbTOmL8EKvGZEhb8IaXkFgfprDSrKEEqQjLhq5gNSWGD3uuZSNUtfE/B2Yxdw35OJ76eXraFEjjoHtXIgAefZxaeyMVy37MmHhc8dyyYIaT3OSeWmEBniHKtYPZNZeolJydTwZIFrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177130; c=relaxed/simple;
	bh=Piaa7AgWZQklS9FETl7ZC9C5QDxdRu2MXtjVntyVsJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2rFViOZ94KvKoV0EmmMLl/A5KJd9fwJ9quSjvghHK7r27tFTUOf9bFv7ZtjarZy8FS0M0NSsFKdE8TdgC+PKB2s6SW6Lygl8Gl8P8M99htUFvD20znM00Xe1HkpRRewYnb+Roi0NBVfxuqAcpWl4VYm/AsfVx5OnH3vK0qlWVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruNj0tlZ; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruNj0tlZ"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so2975318eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177127; x=1778781927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CfDVFKSoZ/AeItTPx6z7QgTeQ9+ypXUzFJnVp37pF4=;
        b=ruNj0tlZ9ixQ8jTD8keFxHilDPQ1WMsX1era9ig8L/PKUzC7WtEPBx/bbxVsCYMfqZ
         2PtSdBuJaHXT8a81EFqJMtfruWKdGuq92zcF+fyPFI8mRPw7zlci5lznd6JWSRejnKNB
         ZBF8T1F5PqBl44vntEHvpsBR53H0gRuj3wWEnikyKy/Uwl8wKuqbkIVDGqgZCY00Nzan
         S/VixM5WUVpMNGAjc6VIMy+sIVDGgasa0uzkgb7xJLV3dAo/Ch5WYaYj6i0K1P2V6n+0
         VKElKZe3q8u3CWxiiCiJ2Z7SVfcPgs7EG6rOfbS6iIgiH2OwUTQXwVYrP57LEq4h9dcT
         iKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177127; x=1778781927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CfDVFKSoZ/AeItTPx6z7QgTeQ9+ypXUzFJnVp37pF4=;
        b=hBJfeQlrDGjfsCz3+6QH90kUV43cB938rNzPwTmFDUyrbJjrpAX0x9ajNdUKS1ozy0
         fqwW9rPDBZ+4E9YVqndSuqpulOROYSGM56T/pIMcQi0HqaznL7Q1Vria7l5FVThDGRuk
         4hdUkqB2JOwhGwGdmOhaHn4UHdsQMyFuAExoNW0LNKCeM9WUigH6rPIe0/IMrAxD+Wi1
         16DlLSlH/v1A4qHxwIVma0tjdQdP4S5huGxX0d0U2m1hJZ0eS/vcwWm+0lOf22rR8bfA
         /E3Q0OJbSuyF8mYtVZV6c3i4SKP0iDN1iubFJZS77hBkkyO6ff+zfa7+Ds3uXIiSYpDG
         r0FQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gi0wJyy6tg5hUYgX9CBNN7g1pey8r1LVqoGvVle93l6zPaOitEWQtrKV9IcYy6581KK6zp9ctvg0EqQb9hxBd1jYx@vger.kernel.org
X-Gm-Message-State: AOJu0YxF2r6aQmzTECqZxCuQLKpd2ZlWAa+V4mbmUNxBq+SSVxinjH4N
	IgrGo/nJooHvftVVpf3i4xxkHJh+PF6797NCXLXuwNKVPz8k887p/cj9
X-Gm-Gg: Acq92OHsOocvwmWnAkYNj/gCZdxsDt+tFfiVIZmkVl0R0zSHkYJaAy/7k8Lleuwqv8N
	E8Ro+80aGMbJg6sKAzUZheekq68+TTkhQG7Do2eKTv/HCkgMJI4Kr2m2veFCr3H3t2GsprEOs8+
	16PuCnM2AdykOmYzAi+9NVGBP4rkDFL0maOdsgk+HmfBuEK2GpuGy8kYI5dI8tFJisJpSoZrlxd
	ZouSqkLM6cfsu17+2PV8/hhwkqciR0eO1oX0E3DnScPJVDaYknMe1F/hjwr+oFGeNEp2e/sg9QF
	PGKSp2sn8uT3XocZ9Pl0lf59E7z0KV3gcPKd2JHqzqbPQR7seolfNpxu+HBIO1dsKSvNAwj6QXK
	lb/FJaYpiFBeJsb2OtsJnSDPkpVYqAN5j3MtwhhG1PQAItYd9hKjAh0bNq7mvGcv9fZbbUMmpga
	NLQ6eDLCps2sdxpoOPhsFeHukbZbn7JcrQo9OqX7IuS4fvAiPILoskFjf6PEZI0iLe1AATrrwRI
	+dO
X-Received: by 2002:a05:7300:570d:b0:2f1:fbbb:e321 with SMTP id 5a478bee46e88-2f548a99568mr5243996eec.6.1778177127092;
        Thu, 07 May 2026 11:05:27 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:26 -0700 (PDT)
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
Subject: [PATCH v11 07/15] platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
Date: Thu,  7 May 2026 18:04:59 +0000
Message-ID: <20260507180507.912966-8-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507180507.912966-1-derekjohn.clark@gmail.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com>
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
needs to reference this enum in wmi-helpers.h. To avoid having all these
drivers begin to import each others headers, and to avoid declaring an
opaque enum to hande the second case, move the thermal mode enum to
helpers where it can be safely accessed by everything that needs it from
a single import.

While at it, since the gamezone_events_type enum is the only remaining
item in the header, move that as well and remove the gamezone header
entirely.

Fixes: 22024ac5366f ("platform/x86: Add Lenovo Gamezone WMI Driver")
Cc: stable@vger.kernel.org
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
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

