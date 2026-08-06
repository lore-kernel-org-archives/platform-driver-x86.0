Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71FD3EC684
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 20:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048088; cv=pass; b=dkuARQXQVMe4x+3TsnUwKPYdj75DzAncBmVtx7Uy2XF+ntb5XBxYsGrPMHPeGpMlSyB4WZ0WD5FeBR4iKtHYUUwiloOJFPimwBaZzs9dwS+nXlXOOu98mW7Q4jrA+3xZCDft7fskuti80IDegMijrYdPTpo8oH10mOw3xbC5OoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048088; c=relaxed/simple;
	bh=ROaZ8CzEH4SWHZHxJd8Stpplpd2Wxac2/k/fgI1wXH8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tMOerDvCAHBQ+zHEZeqlAvqLjDhxcLMxRxcm4ZyFs41kwOZNFeRWfZwQQdc+AiMVpsfTMvCOLfS086KwuhcK2UDKFCAs/hoJmfVz9Jm57uGu6nJsENWAkrj1VFbr5Cl4lEnXQPAb48doUlOl1808uv/PZujHslph5VgFoj3j96M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=QWWmowEv; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="QWWmowEv"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-669944f5ef1so3048137d50.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Aug 2026 13:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786048084; cv=none;
        d=google.com; s=arc-20260327;
        b=nvEOQEV0IFE2847JZ0EKNpssyomE34x60PXpAJwy94MfE3a0xKwRObzOfGnpaalQy/
         umQZn024lvw0d5bBnBYF+BBsWJCl6x7uAFYFXHm/o7CZKQxM4ROpArbUxRJ5XQn3e9Hl
         6Ay3vum2cBRSD5hfD2JnE9y/sVpotfMLeyQDgn2qCSF4XCpxfIo124JwsgK90RYyaqg2
         RS/T4WD73ivtrMJHT2+IwJ+/VIAjqJB5Ews4T5EtOrND4COs6qRAG7DGKRSctjuNP5rN
         eS8GTmCBUTbqz/UzcvQiWAjAq1jSNvPlrmhGObXKbMst9+j9O7toqtRAXDUk65uFHuiA
         0Pdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7U9/0YDtB0EZm+GYjdQn8v+EZny+DXzdIE7UlRBbf24=;
        fh=/IoVuzX+UTajJnXeM0gbMKfqHHIbhmAvmczPecos9gM=;
        b=YY78IUodXbEmgWUvtGkC6quzN5URy13AiNFC/lrfYE6vqJ2zEEFpWqG+cmF0pljy+f
         CS0wlLlxNXpQ8TZI3l8jPYfDYX2EFr1wf/gKHDHYXg153bAP9YRsA558YhKRG7b1Wels
         C66RtqRg3X0AmGLb3lYFeoy4YRJWMsi6KlYR1Wmaw3q1FmIq36+YZVFteQAxcbukM9CU
         bXNp3NiY9+jjynX4irVYj9dUJ0L7UPi/MPL7/colZMzK7jNML4FWC5P2q9WXGSdgDuoH
         xBOj3ohZcRHfPDB6XT5VO6Knb+8pgDGVS4TG0f1l89FbbWm1NwttQySziJvyMWO64Bue
         TOOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1786048084; x=1786652884; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7U9/0YDtB0EZm+GYjdQn8v+EZny+DXzdIE7UlRBbf24=;
        b=QWWmowEvpIpIaw1SA7m/T7rRnkFa0wCYLljxs7580/JcWQ+CxNJnh9+fd6D3TfQdE8
         dR901xwz4kKEvQXVIRvhd+b5IYmSJvoCy3RQr8R+lioTnlADLneYvWvyINQiMI0HhGsN
         PhpRk7kzyGK1pkuDPDEBXjXcqh791JrvUzwIJ9SXytsmH4voEHI4b4bdPycHakN/Af2M
         L/RO8ILTZKJjH0JjJMdI+jXkHB1f5sqJ03KxqOR1brkSz9TULWZUsIJ48qgr6khaY/VE
         nmqwRfFQYAmiM+FVLCZGd9vxmnLbw2jUJh9eqCTaf8AsQFYE8/SCXSmnYnRbluKtKgUQ
         LBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786048084; x=1786652884;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7U9/0YDtB0EZm+GYjdQn8v+EZny+DXzdIE7UlRBbf24=;
        b=rwg8uNUFbpbi32PkdvOOO71e7SoG6FtzyYrXlm7gIBIwrDhQc11Se3rDnqdxDNLU3l
         1Tkx9AvIwio0Gh2IYa61vQrHpH+kZxOLsEICpThSZzdEv/fKQvWPyGn/lJSFGurP6I3s
         kdb4xCNcBNdazhLKAGjMhRLWcSPNb9VBMoxddNyX/VRjz+pEIIIQCR0akxNWd1E89iTm
         fWqJgGNssquA8Fm8spZfR0LmmR7zqLj2MX34aH1xN2NVwNbAWrtQ6+Ij8e63c6LbuVGK
         43UOI58cxbFTuxKfFyjQ1CsbGlZxt1/Nr1UPlV3INzbG1fMqcYYsaFBJrAGHZhzeyAM+
         Tzjg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3WN6dXLbzWcIsjcfURuejMlBMjyBMTvKIsAqNFUIj8VCwfqKT99sHPbcm+ukdlBydOCCLPk8p/up3w1G3plYGZfbc@vger.kernel.org
X-Gm-Message-State: AOJu0YzS0LPl8AS7BAUEsk7IGnaKwXo1ebdG669oWT1Bj/ZL+xZE7jcv
	LrXa1/X8nygthmlX7Xh+vuyOZRsfHhgy0Ugkutvbytel8DucoPDac13zGHYOGsz13MU5kVIHiz8
	AXKMFWyUFOINRILmq2PUo+v1l6ClZSrrfqsAbcGHo
X-Gm-Gg: AR+sD10KjL2PHMpEhVggqq8UipVho9FcWwE0bER7LzuhyCraZqnu9+T9yIIlh3VZyPb
	hww9SPCgx+XHXiBhHajjMqIdOQ+wvQppqwni0Fk9OlgOiaOLs6DP7IQk1cqQm3K3TxHtV2inMzr
	2cA10jMKwpZyQN/XyHTtsqC3twCTsXuX3VF1YjHUNpXxZ8vPA1KMgPuuHzIbeaCz6HQOJjIguhw
	GMZTaYYThww4MVq+RFpH2FUG6aGYlHAwiXNLMeCRxIP7nM2l4oR+hBVHSIApP99ZYaKdHQCl5/9
	MTttzrHj25MIIjK7iLXfc3vtFY+S9kCcmxYYeWJTiTU3Oka3dgFr3GkvTU30P4+yFhuZslRj9rO
	wRH8gQC8h0SqBt6ZwnT/A
X-Received: by 2002:a05:690e:1757:b0:668:973d:5ba0 with SMTP id
 956f58d0204a3-6699aaec1famr7717035d50.26.1786048083788; Thu, 06 Aug 2026
 13:28:03 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 13:28:02 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 13:28:02 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 6 Aug 2026 13:28:02 -0700
X-Gm-Features: AUfX_mxR1eLhUqYeWuAis8rIKkWeNZ942rZgSIBzeg-q9vYC4RMlefqMyPaKtVg
Message-ID: <CABtds-3qYvwy5Z435vR-21djf2dvoVYSuYgLSXH=hc0e97j2vQ@mail.gmail.com>
Subject: [PATCH v12 1/4] platform/x86: Sort firmware attributes class includes
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
