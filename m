Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AAA39C651
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506454; cv=none; b=FZsLu/p9AbfjSOUXXLgDIfRgDh/pRCoKXrj71bKjbIKeIANQOihkumq/MNet+FsO8VXcqCaWLvT853amLnrNMQ7hIVo73RB5BfNppwy4tXxSn+Mv4bk33Ry+BbAe4vL9QcJMUB+xlh53fhG8gS/J0GL7xnrGy/oj6DbfgFm/r48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506454; c=relaxed/simple;
	bh=xrnxjixb3S3l8mpznGesR4yLaVTk0m9X+cefg/WMFwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViNd1gKunithnUZ1ahrrOZ6Ni9oTm6L8THZSqApJVwkIVWuJVaSU5/dqGcPEct8svLmF9vjtL1xDqDtpHwoupttlQ+EF7C5Wlz3BMasD9phIfy3f+4d4wHx55kZvyau0rMJ18UMk4zZxi12rC1zYDdWNj2YYXfL9Z3RLba61M5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hl5ekIRr; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hl5ekIRr"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-128e4d0cc48so4442305c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506449; x=1776111249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtwIEh4sPKHPhc/22oqRwsWU2M6QFjOoMGMDxlUemrM=;
        b=hl5ekIRr4UR0GJdtRIreiWlvENtT6YlllBgG8wpfEnaXjPHsPDDIJRRFH2L6Xj0kYc
         Hef+5M37JxzxMtJU3zVrYS5WffxK2CziYuPp6ICn8PhIpCkaq2TTJmulwI9IKyWMw5QT
         YM/XQP+ebZCIDc0rv7hNfA7LX8M8dw2SVTwEUcbVvBK0ySL5wwoS+epZXFc9eEsVJLDb
         cAxLpR03jy8N97neYa3LA3X6eAKBu2zLAoHIuV+ZDujGCzMxIEgy+OS+Sr8myDbXOBmf
         JHXoj3yX0cqzn4F39YRMApTcVMpdZ1CTUQoDTut89rwFSACiD6wHeY2+JxlxmO9h5JNL
         mXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506449; x=1776111249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XtwIEh4sPKHPhc/22oqRwsWU2M6QFjOoMGMDxlUemrM=;
        b=tESZs4gaUQzObwUZRKIfRQ5gJzs63og4rNyNHrv+EjcI/qbDq7BEwKqVyLBdx/MABO
         slEgvLeGc+ypMGvIYxA/5ttCkd9rwteW3YqpXAAx3200FwhZSJqRnu9dlqq9d3HIkb4w
         oy7NAzdrh8uFY2l5b/ty7wcECnucl4m3CPCcNeGk9MeGRac+OM9H1lMKfUqgbDe32GAG
         KvkCvnwTVOBrzysShAweUHQbLd7qKFNLNpngx8m+2wj5guktZ2RZWxpGIoMW7frgEPw3
         VXuCOFS++1ysvOVy6sQOfvicjnn7n+Mwz3H+tYouRR5wKj+vBtqLcDNzlgSUu4ouPqyS
         Vp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/foyAnGvlMh9SYwLw0rjXi8h55ufbNBcLJIrkH0ofFoGHLjX6eKVXRyjyEB2KFPDKesH/GFCWUl6IklEXq0nshPxj@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ9OCNIoNXsy6oxrCf2+3pbzSLVxR9pv/RDG32ib3Fe3Cv6sJd
	9sMnqCjjaMCMdldcupzatP4ZN1+aQe0KXiEZsQPgmrmKKKMmlrsE5VXA
X-Gm-Gg: AeBDiev4QEr1VnsRmPhrUOhEJlPddoUruTsV/1xF5U1TdhYPOuDOZhdDpI1sylatfP4
	64PvqunVgRq4gA1iC5ShpXZCLrU8N9S9tPODQiT6rwhyg8UfYhH6SRKP0A47cRLzIh8qeZ/TAoC
	h0Fzs4jjQqWuKe02zvK1w2osubQO8RGNZ4QqKlwlzdGm1BhyX6vwC5hpXp0Jvjgdf/uIJV6IV2D
	Ha31Ma6zuLK0kRCkndDuYeJWlflYWlTS9tShnTC43+rk3YUJPazl5W/gNIZVdZ058OrJYCl3h2U
	n55kZv9Vcc5ZXFQ35zzwQyU6UIoKEyrDMKaAGSg9DRtU8MdpvSNWfUTREgaO+H6JrGUh1Zunsuc
	GjNKfgBmKMEg+5QagP6mcDTVtxFM2GYLzR8/2dcFXjYv0E4Q1wTZ9IBRk0hhMhztTWC7nwPjlPB
	VogO23NUEbbDbulBE2d64urXQT/ferAeG8mGqDl8ph5V/AV2BoJ3oxQRYknI93AeiI60WmAQk2i
	N1l
X-Received: by 2002:a05:7022:68aa:b0:128:bec5:1b37 with SMTP id a92af1059eb24-12bfb709448mr6882013c88.16.1775506448549;
        Mon, 06 Apr 2026 13:14:08 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:08 -0700 (PDT)
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
Subject: [PATCH v8 08/16] platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
Date: Mon,  6 Apr 2026 20:13:52 +0000
Message-ID: <20260406201400.438221-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
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
index 6d0ed13a398f..e475d1d8a5a7 100644
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

