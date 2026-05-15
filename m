Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FD33EEACD
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883018; cv=none; b=qxzcmUmDvdejnw9alEDbZwC10SQGgYg65rfTv0plds8OEYzCgQIeNPyzwvKLZeP8zQ1MIimQ9MkzmR0e9KJLgJSdf2OpvGcOJIkZ08Bgnaf3VHnnxBy5UJ1hXAEFz8SEzxRkS5CbNQp3Myt82L8YEwAW0IEGurrqvNBNeq8cr5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883018; c=relaxed/simple;
	bh=Itc8uxXzGHNnPPOmw/8i+V4Qh7IQ8GtQY58bYSW8Ues=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MFPg7VL0WuMMKzErVQL7/mGvtWctqOeHfSfMc58GNQeFFIHoRPmaskgYPt0sOMnUpK1ZlbrlooT95bHerl3VEjdHnBoKdOotyY0n+HkZ9FlVMQRJD6vRS2vcZCXWI1M3X+u23LJQ4TifJMXXe3y3NO4aF1QHZFJp4wYvDDS7skc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBr+GEAs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBr+GEAs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so1296155e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778883015; x=1779487815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LGnK2aFy4Lqlj6xRYxiLNhFBfDLm1RbTz9MpLN65FUI=;
        b=cBr+GEAspICyDNvuVbfkTzarn9BkG9KsjSKoFVKbIIjNj/94737jvNRlK1wIJvSocl
         ee3TM6vW4X/dSGJJLLptdbdwPn7O4Qq1wZeWdxcncq8wJC+2hm6FZBXTzRxHrrN9HJ1f
         FV0aM58bok5Fo/k9shnl8NZb7Orxz4RnTZ9iobigcNj2aCTgZOiWSFGu8A9J7RfF2w/m
         BUGbBzYVOXx3qJlNzXVhZ9vcXe7hscD60eXWlSXQ8prjsPRLW2GR12g3o1CEtYSeNlHX
         MeGzfYxNL9nZQCjhvyYLzAF3uw4b7OSBLDYKzyuNAni/jLPDQSwv8wwb6MZha49r0uAH
         fh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883015; x=1779487815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGnK2aFy4Lqlj6xRYxiLNhFBfDLm1RbTz9MpLN65FUI=;
        b=F633YPyNhjzHGyboHIOZLZjDDiBRWzRVOpBGEF4P8eAOKiKyyPH8MUB/s3KgJ0Ai4B
         zHZ9eb/knCGMarxhrq/znctNMSUOiqesLu/rBPhiKczVwqLxIRWJ5MTfMlDjykaJHHWX
         yupOn2usPId9Pyb+I5khwr6HR4f0y7BsgClxoEzrIdlhoK+qb2FCTmJbgbE/7ByT1qAY
         xX1xZGrAEygHiz4uC3jHHwQCGISOxyhfS+Qrrx9zKnFcLnqhlyRl7uRNk7TUCtWIg8OZ
         AqmNLVVuVyHHL0+7JF8XjdiwoLa1iz8xczj2PQaw30NlkCxa1pztAOVmoMIarXk9ar0c
         DMAw==
X-Gm-Message-State: AOJu0YzKJQCGBE4TQtQkKsPU1YGBGG9SiQ90PCjpKqREbclYUpeVD6Wt
	ul6tYLbSRXg3Tq75qBisFrZlZGMV/spDdwR3E1gA+mTLghLyqijMbbGugc+02bJ+ebdLKQ==
X-Gm-Gg: Acq92OE4Gc/quNkBpu+AjI+/uwMqVtFKGaDSEI9HVjdBhpFVcia3m0nMCM0P50grp40
	SvNbNnwk1teRo+gTEvmyJ/jZIJ+N9l7iakMk31EX4IqFpQZLfdAwRZyGUA2f8v4KCISF5DyrLa6
	BvAfGPX3rufBq3EYusIsbVIbirqiNHUP8zVeTXUfcK12+MgLHtcFKu53Pb/KO+iX+zgsgiw+pSS
	KDNuGUweJtyKuZDT7W6ulJdsX2lA9+n1o6HlfCJYcRg6A7sTzWbpxJ9+JGCLXDLf/lBZno66Q6e
	cl8xN4mCtdMXK1mLv0vxVBXdbry38/H9VHF8rrrfd3Md7MhQZ6ngGQorNpoKTU8/pqpmvqge1o+
	m4roMdVGoYqyWoBr7MzjBN1jN6hnpYXT29o58ZMuXhIeHlHsfVK4NZKZ9m/NLfqJ2RRALO5G47s
	Z8zW4cz6iom48RNoRhvYebAg==
X-Received: by 2002:a05:600c:c087:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48fe61f2911mr60726135e9.15.1778883015173;
        Fri, 15 May 2026 15:10:15 -0700 (PDT)
Received: from user ([104.28.161.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88e5asm90857875e9.6.2026.05.15.15.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:10:14 -0700 (PDT)
From: yoy95104 <yahia.a.abdrabou@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH 1/1] platform/x86: hp-wmi: support profiles for HP Laptop 15
Date: Sat, 16 May 2026 01:09:24 +0300
Message-ID: <20260515220924.827294-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Added board 8B2F to the victus_s_thermal_profile_boards table,
although it is marketed as a notebook, as said in the hp app,
my testing confirms it utilizes the same underlying
structure as other Victus models. In addition i added prt sc
key and mapped it to event 0xb7 and assigned it to KEY_PRINT.

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 6950bec2a9d8..693031aa1f11 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2005 Dmitry Torokhov <dtor@mail.ru>
  */
 
+#include <linux/input-event-codes.h>
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
@@ -36,6 +37,13 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
+#include <acpi/acpi_bus.h>
+#include <acpi/acpi_drivers.h>
+
+#ifndef ACPI_AC_CLASS
+#define ACPI_AC_CLASS "ac_adapter"
+#endif
+
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
 MODULE_LICENSE("GPL");
@@ -205,10 +213,6 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
-	{
-		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
-		.driver_data = (void *)&omen_v1_thermal_params,
-	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
 		.driver_data = (void *)&omen_v1_thermal_params,
@@ -253,6 +257,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
 		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8B2F") },
+		.driver_data = (void *)&victus_s_thermal_params,
+	},
 	{},
 };
 
@@ -407,6 +415,7 @@ struct bios_rfkill2_state {
 static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_KEY, 0x02,    { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0x03,    { KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY, 0xb7,		{ KEY_PRINT } },
 	{ KE_KEY, 0x270,   { KEY_MICMUTE } },
 	{ KE_KEY, 0x20e6,  { KEY_PROG1 } },
 	{ KE_KEY, 0x20e8,  { KEY_MEDIA } },
@@ -1086,6 +1095,7 @@ static int camera_shutter_input_setup(void)
 	int err;
 
 	camera_shutter_input_dev = input_allocate_device();
+
 	if (!camera_shutter_input_dev)
 		return -ENOMEM;
 
-- 
2.54.0

