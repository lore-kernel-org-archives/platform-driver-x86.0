Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C8F3FA5F0
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750728; cv=pass; b=aoeNGTfX9p+dNFStTMOu4yIZlQ8upsBG9KT4PzMAsQKRLQIGxejKP5JxN26Ib4q2XhINweagR52jr++9GEkE9wxrOIQo9GnER98vLg4dZCj0e3Yhg9375CdV0Ue3Os9d/YBUmVNZaTp6UhwDt+NHlYNY4HUrNd/yY1nqspUwa14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750728; c=relaxed/simple;
	bh=IppDC7HdKodWjTBoSVL4c7NytYkiU2pxiZ108IcjzNM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BMNSA8qpHibnFwODP8oPPlPjut5RmIpiMk9tDZxUxlzfMbA35W88mL2eeEgQ+Y0ltIqqnJ7eRX23Pw7OYnj4ic7zYinGVNVqPpU0MCr7emQyyMq8ewDYbNohCzTHDEc47GWhhGxfQGqDWaQUDs5VMpVV3IEGeUyQfXWJvGm5X5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=va+HyvSm; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="va+HyvSm"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-667b0ced2d3so13933186d50.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 13:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784750724; cv=none;
        d=google.com; s=arc-20260327;
        b=n+6xpjcZawkxcn/m3usM+hb0EeS4FbFPu+xVB2c4E1yi21M93ZoQNVS/voua+bNS1c
         WepCjNJOvk8QYzX+hsAwNhEqSFz7pe02BQDR7nUNLVTWiZbiPpdo59ukYH28A10rqPZl
         d4izUavdZQF9RjfG1CDONVV73zm60QtZz5I+1CiFTgbpDzxhl52+Nq4n9kOx2fI2af7p
         oECB8aW2+IS1dYliZ9ICxaVu2Ybcckx0RsxGvHogBCo54gamWDi6QZ56JZ2LWbEIU726
         YNr9k9+Wnb/V00zVrHSOzAAyq7EVr3+4RfPL+DgP2aVxydvJhSaocr4CRtfE0vhqS5T4
         alTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        fh=RHGG23zWtu7ChXEHzKapGg5112Hw5vS//XndBe2+ZUs=;
        b=tBFHj8F+QytcTQQsAnT7sNETZshllIEmsZ6bqxWrJ1OiBLBUrLMiANmF8JDVs0maZW
         H+CtRTaMFfzn89wvU7SWLiKt4QZ0x9isUi44b7Y7HZeQmeBPFOWkb6i3HmXqzerW04oq
         v/QH6vS5G4zpE0E346GWevhKdri7SzGNeDwuDZTpWFTUaUIvxohagZKxDLP3770FOo6/
         DPj7Y8fO7QIfeTHPaaKjbr8jiVCukEbIwZ7/6oFxT+90wLtbczklcQ4/Z9ndllVkLff0
         fYLRK/csLC0piEaxmvW2zXDLtUC+bxDDTtDiQ7kL0AzDyJxuQssiVFEg+HaNj/CDBMVj
         jGww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784750724; x=1785355524; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        b=va+HyvSmq+5bEUN34dxRUQew5HK7VRMAJlYZCgwV8r2M8Sk27k3IjC3Hc9Rx9ryvra
         RIwv9fWhAyBWAtDdP5SfhxCDJq3x1yENy4KPEB15gSHhZRwNKzPewA1XFyH8qLvVuTS9
         PiIPAHIrycYoWsRn+is1t978WnmwyxTJ08FbVTmERWS+xIQ7x2pTh0zPcAV65IB9sek8
         2I5zvAmkUhxNkqxb7ncS0Qek/GSxK3K4Ptn/52meGNIDY5vN6+NSv6TliHxQ69/ygefX
         g4fmrN5AVXnT6Bl1TjSCE82RB9re7qK3I80z9qFntLKE9CwVVdswz54KBDATKgVnoZVa
         021Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750724; x=1785355524;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        b=GHtYWA+zywvlIlZOcq+/qgVO750h/D9gfwBk/bJABPgm4Rbj2HoPBBMQl6PkJ9k2RX
         DMd9bgmLXw7mZpI/4UXsgHHNLAkVBYRi7dAQcgXtCDslYClXxQuW7xU+SDNMlmdFBHXc
         wtcnt2t93FDutKZAtVTF1xzfEQF6tLbf0FGqYgYj9JC/GEE7aR4i35ZCnpp7Hrm7p5ou
         DWgXWGqLz8WN+XTcTK3nsfwsK0s5p+SwD777LExVStpTsesQBlIZFUNw/1x8sT88jFjC
         07fcZ1tCcDUe12YvZL76aj9L+iYUTaDZuCEbMrRhVTalbecO37l+HSmaAmi36JWaKhG2
         PzGA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6oWIMZKHpaMEa9wvJRBzc2yrkyoAEZOvBRfaTBs0/8nwQ0jBdvy8BiliUSdzQhSush8P9aJaEH6duEk05zwViktb2@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFsFQ0cY7/+XbbxhS4MF0xcxOhiup1dWQv8pU5tDe68qsg+lq
	8Vzsr1BnIoecTlHTPb7Yrk+P781muTjQBQ+vrnBGKkm8LP0kZOYvki/NDUcIXLRqW4QaBEpErRP
	gPMF7eXN/MCGNPY1XeXYE7U01t3qolsyfe/TkGLJH2gipsserR1Tq+A==
X-Gm-Gg: AR+sD11n8kWZzUIm9Xar6O14OWtDp2BM+nWREPr1s5JLx+v3UW1Uk8EkvL6RNCrLTqM
	s/O3OB8LlvHwFzEmwv+5iuUwWfurDHuA9XPJTnT6HbyAuuGGntIEZ5VyjQRne46E4pbRsVDQ5Jx
	MZNC2JEyTfHwSpoW5LhrNUaoEeBcRn4TRIktlIFsHZGXzIhctltxPs7s7zOGAD9LeXKrZVQsry2
	+GEMOTP9vUWtDAYRU7PeztgOgzj5PicGJh5SiVSFyWyDWcAlvXNUr/AK5vVBhvs6jYf7/YFrFLU
	BfWBbigJZAZtIMENujHGBw5/Pw==
X-Received: by 2002:a05:690e:d50:b0:664:d494:f9eb with SMTP id
 956f58d0204a3-668a4d4ee1fmr22753d50.65.1784750724261; Wed, 22 Jul 2026
 13:05:24 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 16:05:23 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 16:05:23 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 22 Jul 2026 16:05:23 -0400
X-Gm-Features: AUfX_myvz1Vhc1ZZ4HyJnSBSVJ5I4BPsFXNEixqHfPBLlmaqy2W8EjZnGqGl6yg
Message-ID: <CABtds-3mgwnoV8P4nVFfro2v99_MfVomm4Uz5JyxuVAK=cfY-Q@mail.gmail.com>
Subject: [PATCH v8 1/4] platform/x86: Sort firmware attributes class includes
To: tzungbi@kernel.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com, 
	luke@ljones.dev, denis.benato@linux.dev, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, briannorris@chromium.org, jwerner@chromium.org, 
	tzimmermann@suse.de, javierm@redhat.com, kees@kernel.org, 
	u.kleine-koenig@baylibre.com, mst@redhat.com, chenhuacai@kernel.org, 
	wenst@chromium.org, florian.fainelli@broadcom.com, titouan.ameline@gmail.com, 
	oliver@liuxiaozhen.dev, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	chrome-platform@lists.linux.dev, sean@starlabs.systems
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
