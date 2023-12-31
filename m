Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA014698
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Dec 2023 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHip5sGt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33674f60184so8121338f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 Dec 2023 02:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704019572; x=1704624372; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpKJQOjhOwlgmZ0rv3WnaTK/Gh2aO5JTw3PPmFTGoYU=;
        b=kHip5sGt20OEmCOa4VeOqJGwjiUedaiQKGEwNZ4DljeRL+5wLQLZRGxT9knNGreuld
         F7855r3nXikop/DRBvoCSkJHYWm1yNZabKO0qvaoRaQzLdTwRG+zb7A2SLr+LFQR2JE9
         oojl5Ej4FkcMHonH4bKDgoBN+HngjZnAIMX6s2XFXl12bJ41X6p+ik4AFseHbDSF68N2
         WaTKekY48yM9Lx8AMeab6lZrR5hvDe8Jh2lrn99WlXEkdGT18sayNQ0IXu+Kuatd2V/J
         wT90sjLGDOCBJszDscBibPWZPEDzo1KYOHgJZ5VxHSTTR0d3sfHTE6ukhb1NVgP6l9Nv
         s0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704019572; x=1704624372;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SpKJQOjhOwlgmZ0rv3WnaTK/Gh2aO5JTw3PPmFTGoYU=;
        b=lijrRbXpUJxN11DkUffW2Wm42O8x5MgOpAdQQl6bo5kI5ywX1B01PV5uX+hXvT+89L
         iJQ096wHyM8JH11MgZWT7ONOnkwaSFNERwyfJ709kXMtbzD79Qjf7NWpUNQFQbNQ6Jv8
         dVHhrtlEHwOOzuKHRoUGR36jFSoVwTFGtl2LsaLmrryLSLmCXlsApwJ+vXMpHCqhTQEb
         lXfDqrSNldO2FfIQQaJdIm5wsjy5xgNJEhfWCsyhcznOjviVNhNwsHZF109p36LMIR+x
         0plzau4XJFWv4uM3t9/rY1Vk7JQh0pDPDBGCkrRYGq6kN/c1WGaQqtLklm1Hxv7fRb1j
         Q11g==
X-Gm-Message-State: AOJu0YwAOZNplXKYGGuI8T0YLiNAwjLNLyyi8fgdCX91wlwn4HVW4UjK
	K0nxcI2V0NJZrSrbdo+MpPOS5wr8NpQ=
X-Google-Smtp-Source: AGHT+IEUF7VuijqILF/1You+ghqzmUJntSrN7faPj+cLAVSdJD9A7KPc8eobOVCp2F9+qq6LEht3WQ==
X-Received: by 2002:a05:600c:4f11:b0:40d:85a2:18b0 with SMTP id l17-20020a05600c4f1100b0040d85a218b0mr563154wmq.83.1704019571517;
        Sun, 31 Dec 2023 02:46:11 -0800 (PST)
Received: from alexis-pc ([2a01:e0a:d77:ff0:7cfd:5b8b:bcda:7fa9])
        by smtp.gmail.com with ESMTPSA id d17-20020adffbd1000000b0033719111458sm6603800wrs.36.2023.12.31.02.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 02:46:11 -0800 (PST)
Date: Sun, 31 Dec 2023 11:46:09 +0100
From: Alexis Belmonte <alexbelm48@gmail.com>
To: hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: hp-wmi: Tidy up module source code
Message-ID: <ZZFGcRfpdvrJCX7r@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This commit performs four things:

   - fix up the GUID string inconsistency (lower case 'e') from the second
     WMI module alias declaration

   - separate GUID macros from the embedded controller offset macros

   - rename the description of the module to better represent what it
     actually achieves as a whole

   - add a space right before the '*' pointer qualifier to match the
     other array declarations

This also prepares the terrain for integrating support work for boards
identified as '8BAD', which corresponds to HP's Omen 17 ck2xxx models.

Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ebb7be52ee7..95282c3a02ed 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -29,15 +29,17 @@
 #include <linux/dmi.h>
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
-MODULE_DESCRIPTION("HP laptop WMI hotkeys driver");
+MODULE_DESCRIPTION("HP laptop WMI driver");
 MODULE_LICENSE("GPL");
 
 MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
-MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
+MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
+
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
+
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
 
 /* DMI board names of devices that should use the omen specific path for
@@ -62,7 +64,7 @@ static const char * const omen_thermal_profile_boards[] = {
  * profile version 0 by the Omen Command Center app, regardless of what
  * the get system design information WMI call returns
  */
-static const char *const omen_thermal_profile_force_v0_boards[] = {
+static const char * const omen_thermal_profile_force_v0_boards[] = {
 	"8607", "8746", "8747", "8749", "874A", "8748"
 };
 
-- 
2.43.0

