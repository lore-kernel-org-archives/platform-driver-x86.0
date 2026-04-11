Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8256E3BADAD
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924626; cv=none; b=Stehwhu/LXoiTpvRYyaNa94caieH0x96oO74Mh8hmtrFuSIAcZvvh8foRRckKo36+jbbLAsZR3JWPFWD4qJMMUe1LTd1YWJOEF2cTUtBZiV3J+KochoW6RavKoIu3t+AFDhXTnAJ7SjoRZ9lAafZSC+KxtMK8VFlofo2QzgKxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924626; c=relaxed/simple;
	bh=+KXtC06mzNgF38OJ1B+8or6FVJD6/rvwb8q1tr9zf4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBtUNgYVjioy7SRHCutDxfBKCvuXiXqd01JMxV81T2cZc8CR7FmCFrdaSw/5s15V5VKwGVLNVcYgg6km6vShT0dNP8GDszVGsKm4hxIXV3g9jI7eG1R+ElkBvlQhhs1S3jE1PJEHsF+/5+ENJfFpl3pxEWOivOs21qnNC+04NjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s61RsE+S; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s61RsE+S"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b6b0500e06so5294481eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924624; x=1776529424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XP4KTURjqIFpmNlMgeAkPBqee0a4J2NWU1VmqP1JBM=;
        b=s61RsE+StFXNsTJ+li6JvUvHclvhCXC71cM6oGaoCvcMfufANQLGBra9ZaO5S15NhO
         qeU+HsUTvJrowsbu+GylyQKgnicIC5pr2LSxAWk7izdceTyMAMwIseXF0qiwvymzSTmj
         IYfVWEdHRDvzKpmZ9WHW3ja+7GerhX/d/sZghXaxSW413sFgsiSuk4qxrmLVAyjy9Jy4
         Z6KaJQQw+YAJeuFVEk47bIavFEvawdgZQEou3yVt5Mft4pEqo+wup6snEgXl7i1Baj6I
         1SiQObU46KK4CXYziStsDEs6s1zZKNBOuYacwkp2B+da9HdYJqAOdW1ClMTrH63TBY8H
         vKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924624; x=1776529424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XP4KTURjqIFpmNlMgeAkPBqee0a4J2NWU1VmqP1JBM=;
        b=F1gTKJQskMaJmUhye8F9vZY0O+CQ7CObkTi0usKgs7D6cFvLldUAGQNgtNyWYH0Vst
         5f35bo+I+TdhrUvv7071p1z/OCCx71sIhIuOObtPsPiJqXe7+PoZNec/co+Bxusp9aXw
         J7/mUYrme1AjxTi0UMr+mByjICznRY9fPkut0+GdvmjaJTO28E4Jsa0B0deyFiYQ3S6N
         mNSMsL7Hh9EKJIaayDgGwfHeAkJgWb6c0GtfCS2F3nODd36oUt2CJKC58rBQCHmybglc
         3jQnQx0sWaaRDFrGBXNlQjaXKwxV50h4FhdWwAaVmm59Xk6DmzyuwTQip9KKKuM1llNn
         Il4g==
X-Forwarded-Encrypted: i=1; AJvYcCXvvoR116xvScXHpZoJmwfHWYwbT7azahtDfogbrBOSvrCPC7mlFXICOpJYu6EylBztU1m7txufx1pktl9jHdFIH7AM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/N7vHF2U44SLUSoV1u6bHgXd8+69DdTIORbcQk1iHjLc+iUtj
	3rvvVze+HOPey/DFPMNi3b4KVI6sJFA/sp0pzRLtzWZkttU84K8UCFUi
X-Gm-Gg: AeBDiesMG5hBjQFlcks8IAi5Y7pCM/aSbG/bcnwuoHK8vaPvFq3tDhndSet+OzjmLUr
	fHFIxw+o39n1COQjXvjTaY2/MWRZSMsJTQig1plU4jxTpvH9DeBSGs296nguqH0mlW6E9soBmcG
	A+IOjsiZfcEZmmd1LCnlOR13IXE1v5y4nr8QEgoxJOAK7Q2YfLT/Ja+zCRZa05+PpWPCoy6ABHa
	lRQBXMQjOuXG2nxBIW1/YCHGMatIJVwLv1K48I6yoC/YV7pNjzj4d91H/xLI7u2Ro/YROq6LsRC
	mmno4NO7yIB4x9pEDWFhopYoHZTJt+ZfULw6yCsgDiTeEfhhH6khnLBYUfUhbIPSnAwVAquDONc
	J+ChNR9i3ByZcpWc792CBSfIfpPqWaeAkIdoxARzjOdGu18j5Hg7SpIs8WZeRB66g1EgztuvZpO
	6pI1lXXPVRnhMxqly6h75SLpFLumx4qwKWSjQCqgUDaCjmOzrmrukuqeSL/h8rsY1ZzSKv0RlYX
	dcdPn93TjeRS4E=
X-Received: by 2002:a05:7300:4627:b0:2d7:6cbb:90ec with SMTP id 5a478bee46e88-2d76cbb93a9mr723344eec.4.1775924623558;
        Sat, 11 Apr 2026 09:23:43 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:43 -0700 (PDT)
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
Subject: [PATCH v9 08/16] platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
Date: Sat, 11 Apr 2026 16:23:26 +0000
Message-ID: <20260411162334.25682-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411162334.25682-1-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
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

