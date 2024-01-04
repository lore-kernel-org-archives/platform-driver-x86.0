Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DE32C68F
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coRdibvM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33694bf8835so734040f8f.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jan 2024 13:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704403300; x=1705008100; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNcQwvNHCIU+DQiZOrjiXd+38eLr4prCzny69vZnYiQ=;
        b=coRdibvMwFvXIZmauN3nEEEXH49vtB1HRt7fJ2LCKaG8tNqu+540OcDIRhTragoeZ9
         mK/VTavsG4CLg2G89aSS5yBIbqaOxfgPz718czb8pHjix1UaBjeDDfESSgX9anZDY4nr
         jGB0io+9UGrmxfyVlDvooErGNsGhmVwlR6eVz4gaUlW7b7Lhra9z1rVJy7iOSbaOysUA
         f+YYpUPkWUfxlt/GhiT/oDfSDmIZOjZ5btYQVnwKkv7lEDF6QwI+wan4kGO0Nh7sjOjb
         vtCf2EG4TTYFXqwXOBBeFZEHpXhEQk9uo47NPIbLeG85AzxNWjRnj5LnmxOx5N39Nhse
         1TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704403300; x=1705008100;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cNcQwvNHCIU+DQiZOrjiXd+38eLr4prCzny69vZnYiQ=;
        b=rgPWdvqNKBpKIBCX3mM7G7L7tEuTFNgqHRYkp2wQnDoB7B20cBuuSBtdvv4vgUs1mc
         sVNvucW7wcqIT/ah5Mx0CduanG7+BMEpMOOJvhXf7UcadwVK/pHNZykuWMndsDAxEgTp
         g/V3sdpznTO9tIhaRN1EpufbW973YYZ3jAq2zM2M/H1nR4rycsY3QlI1UmZzjskAt7Tq
         9rTl4rSUjyTPJ0gXHyFDv54LKwD6e1oHAu9t6H5sNyhiWp/dVVvzFTwUZVtR3r+cB63F
         zqt1nDyrDyaVhBQRHwupglk+WVL1/QBFAje3W+kH9MrhFGan5frmhDI1f5QntoVdyNCf
         wccQ==
X-Gm-Message-State: AOJu0Yy8IuwnHlZzoyrVae+5YXhDKwA0qtKIsflivpMtTdlH+ik6ffyQ
	OaYzSoqrQWrTq0jF+KoY/oMuebEr3B233Q==
X-Google-Smtp-Source: AGHT+IH8g9KBKhyfYxkE6h3cVrdsGT9Q+eyX+rKE1nwpHWeeMJ0OPWGO/BvoEcH5y3v3AjV70WinfQ==
X-Received: by 2002:adf:fc8d:0:b0:336:9b91:6953 with SMTP id g13-20020adffc8d000000b003369b916953mr561232wrr.100.1704403299585;
        Thu, 04 Jan 2024 13:21:39 -0800 (PST)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id s1-20020adfdb01000000b0033667867a66sm111577wri.101.2024.01.04.13.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 13:21:39 -0800 (PST)
Date: Thu, 4 Jan 2024 22:21:37 +0100
From: Alexis Belmonte <alexbelm48@gmail.com>
To: hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org, putr4.s@gmail.com
Subject: Re: [PATCH 1/2] platform/x86: hp-wmi: Tidy up module source code
Message-ID: <ZZchYfQcg0fPBJZy@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This commit performs four things:

   - fix up the GUID string inconsistency (lower case 'e') from the
     WMI module alias declaration/macro definition

   - separate GUID macros from the embedded controller offset macros

   - rename the description of the module to better represent what it
     actually achieves as a whole

   - add a space right before the '*' pointer qualifier to match the
     other array declarations

This also prepares the terrain for integrating support work for boards
identified as '8BAD', which corresponds to HP's Omen 17 ck2xxx models.

Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ebb7be52ee7..b19039cf1966 100644
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
-#define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
+#define HPWMI_BIOS_GUID "5FB7F034-2C63-45E9-BE91-3D44E2C707E4"
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

