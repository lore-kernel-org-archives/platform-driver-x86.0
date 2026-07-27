Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2781C3D7D9B
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 19:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181886; cv=none; b=dYzR7PxnitsTL5qHlGd9OF45MGLuR7bGJ5FKzmehT9gf4Zuwap2x4XnE4zyw9GY4JB1E6vt4aZegnCSZWdl6cfBu57SzUnhEvcmYkmE3REddE5ssT8RKu9W7CH1BjxlkFXf1Uku66lUSf8bBzq0q7jPR9eu0DsZQruxsHwtzJtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181886; c=relaxed/simple;
	bh=5F+9d6zSwaI23ajpCCP4JCHQTIKUiBdtuz68jRALsbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUWg2A3X/iutWc49Q+IB8CRnzuRian8iMv4Mff44KWq+65k8ZOiUnHzx6cW9NdeclpDVewUYDZWYH88/v0uFki9yuz8+F5OFRdSgM1JA//ACGrO3mQ1/DvEQ8q3DBz8DGRMGurSMAzn9lS/6K2TAGZyVe2sLG2BumUOAqmNljV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=kYL/zoNP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="kYL/zoNP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so16671995e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 12:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785181882; x=1785786682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyYlZFVCc06FCgom6L11YucB1au+iuvrVnF7FufZeZ4=;
        b=kYL/zoNPwKudFvyEAxAdrZHs57dWhXzkkkMQYcydtBsTSoq+HIwkRs3g6+DAthrS5+
         C5QIyqpCVK31NxQ4dpG9iJ721xDjZPL4pgjNJ8Uf237Qi6rj2Kw7ov03KNoP/X+CYCDA
         dGlR8T5PfCNTWgPPvZZPNcwInLNtGhIdTGgz04Xc131IiNqLw4OK34B7GmVmW9XM0hZL
         dzc1LdznHbHLrLHkrpIBmbz7i0H4dFvFpGqUNHeQ4SB3WoMKvbOAyL5wj0WZqcPuemEs
         1sDXLz+n7FvLNohhWVdMIoU1m1FYk+y8geJZqdnjgTK6dJGj2GsWCO2hwfO9ggm8IQ9o
         g+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181882; x=1785786682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyYlZFVCc06FCgom6L11YucB1au+iuvrVnF7FufZeZ4=;
        b=bPPR9vZ609Hl/+XBGSkwTOGG7Y06n+kOOGVToHX6zK2AbuCDhFQL1pVNJz1wMyRYN+
         KdIiwaGRLi+VX3Rq0rhPhpm4N5LD+JT3QGuIJc5+9IbJBk3mqsNG5zHMXXFh9zBy5Ph9
         dBv6bgYidXnAqXaJSkOdAd88Cl34eR1T5U8xVqmWTrgJIeDtm7CCnGAwJtGKljWSp4e9
         AbjaabhvJCi9PoVMNeQ/CRAhdtSFE4ARmyBulAJh4gg0Ipb2tXsKrQmuTakeIzj7QSU0
         U129a4QvNQpE6MnNdrBab1M6OwdLQ7GuL6ideM3DCBbQWh0NAO+U6lMYlT0lyvlzQ3f0
         t5TA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0fgud4bY7pDE7ztDtJ2iH6PJSss6TJE0q1sYZH6QuP1kOYFo8/KEYwz/G52O3r0fRHYEk8OODbF7ozlbgUMAPXqtZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yykv0FdL5hAQoNCCohGyWebcCWYMV/N+enxYPaGhgutBq2xc9fB
	ybpHl6ZDDkotBO8HjKrVEdOOkxukokrWZv4m2XTkV+3KGLRwWel/GGeMLgAEyz8UQg==
X-Gm-Gg: AR+sD12Tvs9fR3lVFvRWonsT1a0KRs3pmBew7IDapVOdXKpWTYBvUvxdAYJBhMtIljI
	MwDGYUADikhCGmTkSuTvG3Um9ZOFCjIujfjnbkxqemk/6sTCHsj05K0aEhr9GqzGJ/jSgUOz7eH
	Ee+iZUib55xH2dwMIRm0u9d9HT7ehHeXkqXv8x07y9xUuRT0s7xNj+AYSIEbwDqOYnM1M6eDkZU
	Rx+O/uRK35/FhHWux1Ez7GhgfL25wZf0i7K+T4je3NcfeMlbPiX4geuiae5jK86LN+vpCu9b0Yf
	Xjra+0M00IrJfTXFpM3KDL6ao/bYkMJjrBjfIpArVk1Ko+UkMKJWB5fCW3LG6g3LUiapp42XhqU
	JljiJtKcYkLZgPbiIh8qahsZtrJtquwy/+Wo9eDj8p/gkt1L3rry4+/P/h4RKVldzV1ymTLj7tN
	M+w4SDvhzo/KJTACR1d+phQp0JBnB2
X-Received: by 2002:a05:600c:1f8c:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-496c4f8e8f2mr5480875e9.11.1785181882273;
        Mon, 27 Jul 2026 12:51:22 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bd9e980sm253362445e9.0.2026.07.27.12.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:51:21 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: tzungbi@kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Sean Rhodes <sean@starlabs.systems>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v9 1/4] platform/x86: Sort firmware attributes class includes
Date: Mon, 27 Jul 2026 20:51:11 +0100
Message-ID: <0e394ba36a3cef9117a2a32930254175c8c64a3e.1785181823.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785181823.git.sean@starlabs.systems>
References: <cover.1785181823.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
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
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
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
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
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
diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
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
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
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
 
diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
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
 
