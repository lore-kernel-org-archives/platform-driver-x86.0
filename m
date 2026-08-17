Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9383A782D
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 21:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001906; cv=pass; b=BTWFx9yDqo92f26td0aEZiv+UQUga5m176CJxP23vrUScvldCidB6fl3SUfHvcUhz184Pk76PaF90BCMEEwAYna9jEQeBt0v6v8q3ZITlcQQJ2CyYkfHpP4IN5gCdFNlnCRNZtsOV+980UzTEn8Ib+W1mlGCwvDxqwMzW07AnpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001906; c=relaxed/simple;
	bh=IppDC7HdKodWjTBoSVL4c7NytYkiU2pxiZ108IcjzNM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioIbCY4WEMKHknEINSVZTHeMyRvckL+aS/IfYfx2AJ/wyKqH3z7gJH0VWT9OgWupaPIRqBkzp2Qq17hAnbZ1QBuaCFV17uDpJHxEUE5ZM/F5+0CMhJFihtcD7RWo5BQ2se0YSWwUcndYF7MpyKpy8Rn8cSMqg5Hvk+FkSPDpNxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=0Xn7TRy5; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="0Xn7TRy5"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-836c4474028so38966857b3.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 14:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787001903; cv=none;
        d=google.com; s=arc-20260327;
        b=UpPkfzBou9jpW0K4pXSl3Sy8zYrCTGamqihLNxU7wAYZIdR59MN0PvF4eF+zDP9r5b
         tmO2G15h/goO3TGCxP4uaQZsiA21AMdd1/QGst9L9Gsj9NRMQvYZgU9qRQFRcGAomPUS
         iGeFnx1XtMnKcUpNOU5fNcWyNHbXI25+g+P2y3howLta4e+w5C7yyUzdr0aOWklirZmQ
         yiqiJPKPEHjGMfV+lKe33llj16fMaJZJ/4evLnS3wNpqYCi2gzi74AtxduU38LB0CEB9
         8zsN41bs0/QHjj8Sgfi8SGJ+a+QC3nAZDdPuN8NyU9hbbqKZSZS0us2+0G0aUnBb9Si/
         0G8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        fh=C7sBqEBPn8Qal1BfBtdP1SXlEx0gk9A7g1X40tjYh4U=;
        b=o8n7z0jPq1JTZLiPNTa/RAg/Msi4MDm+lHpgzo2mX/DF1mNsLHu382bBLSEa9a9C+l
         dovrkqWdVKC+aVjqRKGqkH4lQHybTj6mjR8mB1JmIql2Yn8mPm227a79mBlJr1R80Zng
         sAuQwpM3to0Jqe3iBLFj+YZVRWQ1Kf6aA2ir/XN5dm3wUprs7Ixi4sMgnZ2P4mDE6E25
         xvHAhaAmt5a2v/rD2Eqq6It5g411DMKIXk9QfidnG2vHDMpQZRqhXDld92rB+45uc7vv
         zaCjkmRTRVwWcQYRaY0JZ827FbaIYCXMxBSgYvDz1MM6zWkg4cuvnXGxAV3lrd9cXYzT
         K/DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787001903; x=1787606703; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        b=0Xn7TRy5yvA7Em6nMiiIzxDYGkxgiUpzuygDiGm1mAnl0bMBc6DDk0m3J/NkUQFaEg
         PMHR9h0e9B/COUt1VvaRPlxlNy4sA//BR+MUoY4ofop2qPl0QGzVzd/A5nyRSCsRswTD
         +cBO3VdHV4+MFedhq174/vzk8pgntKI3PjoKmcOFGOYZVKLLZll+jnklaEC4vRYtMTOz
         EFIVWaYIL375tcGCldq1+0OKJX1HGzCmhOAztKfpSr0+vYJNh/jZzxbhhpWmAUNU4UcY
         mIn+vX89FP4V2Eaah4SA5Mw42MqEIivVyT64pyn3RVSfkkLRBPlCPdhk6YWXfRSZx2H1
         73aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001903; x=1787606703;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        b=PpEyU/UDBSG0kzINmRa5e7fd8AYACgRy+mXWlQCt2euSr9eNahhVxE35AFe90r/Bzu
         nI8hQssTC0xaXyBcc1HJ3PxEt/1/MmqygNLc/g7O7MIrbKUVMfkRKakD/qgYYTEwhFLi
         bfvgytpbWlqi6TsF58BWunFOCn5S9MuOERicYu/M2h7sawT1+Bau33AgNayt9kGFItl9
         9OxbLJ2iNgt9XsxC8SxtqH6VB6tz87jIE9tECwqbMuJXPI4i74rVUsL025/IPp4HwqKF
         tvSIErnrHpOz7BARzUG7xy5lv75drpGiNdjOlkNu16OHLvSQ2OVADXgGzUn1J28Sgyfz
         IBhg==
X-Forwarded-Encrypted: i=1; AHgh+RrG+owEp2G9qScPAmHNdnuynBySfNBl9n1OSNeOlsqrUsXwSg9MNy8ZDiezwdix9S5qk70qtIoScbCBwRotikRK+iAO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6wAUu6aPy5g5HI33iyJlvGV54joKSlpnhnKMrjSyipL63OKA
	48vnl7WbtA07KSnon3c+9PRPzqPUdPRlo81Imn92Uiupr2vwTMmFi3l3VZC3y0mwp/RgcFpHY95
	zBRu5x0clGUSiR0PvfzHLsFyBc44DH5QVIqrGDIkE
X-Gm-Gg: AR+sD132VUVHZrE9NL2q+CN6eYRXw4lmtW9peAvWfMS/Z8+TAFheJAuqUxeO8cUmMgz
	DsDjRBRHvbeDVUcR42LqZI1s3sBaj8ThbEK5CqnMIqrO3AN/D6OpahqGTBSRZUCEwXyKBSqniMT
	tXHKa2QJwX5paijvwiMzNsbTFjv6I21ydW0483O7VFfv1h6sG2iSes35e8cR3964kCy+1LmOmOV
	Mxg7HnK0iF1kCXdV9niX9TruSCjiUK3U4ZM5CW7/MjfqtzlkIjlKU6v0OCGhALpE3zj8zq5ECYB
	4iocyMwVQIUceotmi0aKqe/L/mg7Tf0ze6O1O2ePw+24rAi/CAuANW4nbMpvMYOsV0o1ofWf
X-Received: by 2002:a05:690e:1306:b0:664:eb8c:9e3c with SMTP id
 956f58d0204a3-66c72d0980bmr8736238d50.46.1787001902711; Mon, 17 Aug 2026
 14:25:02 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:25:02 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:25:01 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
References: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Mon, 17 Aug 2026 14:25:01 -0700
X-Gm-Features: AcwNN1W2nrfwJkcKJDJypHH8fsf07_HO4F3bBtgGI5y9ucOVgcOJe38ZwikfogY
Message-ID: <CABtds-3HuofWaoDbMHPBc34eivjtaYeBLb4qk+bDXmz59d=1Qg@mail.gmail.com>
Subject: [PATCH v13 1/5] platform/x86: Sort firmware attributes class includes
To: chrome-platform@lists.linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	florian.fainelli@broadcom.com, chenhuacai@kernel.org, mst@redhat.com, 
	wenst@chromium.org, tzungbi@kernel.org, briannorris@chromium.org, 
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, krzysztof.kozlowski@oss.qualcomm.com, andersson@kernel.org, 
	geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de, 
	ebiggers@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com, 
	sven@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com, 
	dakr@kernel.org, o-takashi@sakamocchi.jp, titouan.ameline@gmail.com, 
	kees@kernel.org, dri-devel@lists.freedesktop.org, oliver@liuxiaozhen.dev
Content-Type: text/plain; charset="UTF-8"

Move firmware_attributes_class.h into the main include block and sort the
affected includes. This lets the header move replace each include in place.

Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/platform/x86/asus-armoury.c                | 2 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 9 +++++----
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       | 9 +++++----
 drivers/platform/x86/lenovo/think-lmi.c            | 5 +++--
 drivers/platform/x86/lenovo/wmi-other.c            | 2 +-
 drivers/platform/x86/samsung-galaxybook.c          | 3 ++-
 6 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c
b/drivers/platform/x86/asus-armoury.c
index 495dc1e31d40..f3d8c5a85762 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -20,6 +20,7 @@
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include "firmware_attributes_class.h"
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
@@ -34,7 +35,6 @@
 #include <linux/sysfs.h>

 #include "asus-armoury.h"
-#include "firmware_attributes_class.h"

 #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index ab46a023cc34..4ff9003c6589 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -8,18 +8,19 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

 #include <linux/align.h>
-#include <linux/fs.h>
 #include <linux/dmi.h>
-#include <linux/module.h>
+#include "../../firmware_attributes_class.h"
+#include <linux/fs.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nls.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/wmi.h>
+
 #include "dell-wmi-sysman.h"
-#include "../../firmware_attributes_class.h"

 #define MAX_TYPES  4
-#include <linux/nls.h>

 struct wmi_sysman_priv wmi_priv = {
 	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 27fd6cd21529..1965a329be48 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -7,16 +7,17 @@

 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

+#include <linux/errno.h>
+#include "../../firmware_attributes_class.h"
 #include <linux/fs.h>
-#include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nls.h>
 #include <linux/printk.h>
 #include <linux/string.h>
 #include <linux/wmi.h>
+
 #include "bioscfg.h"
-#include "../../firmware_attributes_class.h"
-#include <linux/nls.h>
-#include <linux/errno.h>

 MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
 MODULE_DESCRIPTION("HP BIOS Configuration Driver");
diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
index e215e86e3db7..9e4b3e973de9 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -13,14 +13,15 @@

 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/dmi.h>
 #include <linux/errno.h>
+#include "../firmware_attributes_class.h"
 #include <linux/fs.h>
 #include <linux/mutex.h>
 #include <linux/string_helpers.h>
 #include <linux/types.h>
-#include <linux/dmi.h>
 #include <linux/wmi.h>
-#include "../firmware_attributes_class.h"
+
 #include "think-lmi.h"

 static bool debug_support;
diff --git a/drivers/platform/x86/lenovo/wmi-other.c
b/drivers/platform/x86/lenovo/wmi-other.c
index fbb32bf404f2..fdebaa0a9992 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -33,6 +33,7 @@
 #include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/export.h>
+#include "../firmware_attributes_class.h"
 #include <linux/gfp_types.h>
 #include <linux/hwmon.h>
 #include <linux/idr.h>
@@ -50,7 +51,6 @@
 #include "wmi-capdata.h"
 #include "wmi-events.h"
 #include "wmi-helpers.h"
-#include "../firmware_attributes_class.h"

 #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"

diff --git a/drivers/platform/x86/samsung-galaxybook.c
b/drivers/platform/x86/samsung-galaxybook.c
index 6382af0b106c..74103c00b0c8 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/err.h>
+#include "firmware_attributes_class.h"
 #include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -27,8 +28,8 @@
 #include <linux/sysfs.h>
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
+
 #include <acpi/battery.h>
-#include "firmware_attributes_class.h"

 #define DRIVER_NAME "samsung-galaxybook"

-- 
2.53.0
