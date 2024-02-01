Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D95337D
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Feb 2024 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706794161; cv=none; b=kgjuzK0Diq1pSTyF7yY9ciJlHe5Q1Fou5ac1HlzixfYOxTSIwlDH5/zzUpiKM4P/39gVKwhunFcSuN36J/MYFTlITVi0Xgcjo2h0A0bR0qeurpHoqQWbVkErFhfNp5udyRYrk+PTgIGJnnw3d6wcVz+7cccIHTAZgluP3lSkxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706794161; c=relaxed/simple;
	bh=rjtEnxHTC6cJGW1OquXbH59om/0jef5L0X/b0iDTvIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFKMcjQY97MIUf7YD8jWY6p76l8kix9N9yjWUir9qhaZLpDqgI7iOzRtEUBCpcb6v4gJ2yfAm7f2AD6WVnNH5/QwYXxwreMRoZlL+xbUrFZ2aeAtjo9gq35WGecuGcCdAUTx5sZ8E6TlD+5fn/mV+d/0xgwOMd/KiyjYIr+CLnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfX+otdJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfX+otdJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33b0e5d1e89so633704f8f.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Feb 2024 05:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706794158; x=1707398958; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNcQwvNHCIU+DQiZOrjiXd+38eLr4prCzny69vZnYiQ=;
        b=WfX+otdJAUjIaT4edqbmcFULM8cMANKWBeWEXbH/Z/hDOdk5NgkjP3l8OZZ5G2kA0R
         XQVN38lSlQflCk97T6UMEwV6rpMw/CPtuUtGxX5UHmmXBEvEBBjdKJb7ucBQW9FQdLQ0
         mICdfSQ3OgeWbxo240KxtVp1TW4S/2pMH10j7apqZJukh7D3bArSTcHtA+zQQ1M72LSc
         /D7ythjOG8c4MbliXfCx00qP81qKJRH+LlKeXf9iRizGEKbQPxE7ti8abGkd1bh4+VZQ
         S3G1SoaEZqKm01jorcE3eqaTQgU3MiDxgWZ3EQi1lgf61Voda+eLPKMZsnofAGY0oOaP
         iFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706794158; x=1707398958;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cNcQwvNHCIU+DQiZOrjiXd+38eLr4prCzny69vZnYiQ=;
        b=sQzvo1S8xU/910Y2i07UeIxM1Br0+9NUB5226nrBN2o2gD6CzfqUdDqTmfk1YnZ7wq
         bYLuEBOV99lHVmon2QoSBZUo5RkeorXSPaPJwGlMCmMrnZI2Hf/H3IdJ+96UXXqddGhK
         9UMaaVkGMDYNSa/eF97b34vsv45TOdujhpyM+LO5wJ9c1KOyDxy+1womBK3hFGM/lmph
         QLRMkqTtC+5JVQP51+D8HzNjYY/HiXwL1eMy0Da4VABb7YrrcC0HnLU94C9Y9fs9K96D
         HTPBXFERRmVdZjNBRBmNayLxfKwyDMjrEped7yeoTqJf5JfYQu1p5ZJpURL5J1GHdN7G
         YBQQ==
X-Gm-Message-State: AOJu0YzacbZx83BqfhmalqD0GjVyyu8wNsgSGaEbVIG7OFnZelf9HxlW
	LLTISyKNhN3AFu7nb9jqiKTkjVm7oiAVoXu7WSNqrgPy4+/O3RH1
X-Google-Smtp-Source: AGHT+IExQAcYl2rZO0awzL7gcvhmrUEqbQO/Y4+Xfxv7aQH8oqODrCWh4HXXVglqMaTfDtGb4j0u7A==
X-Received: by 2002:adf:e512:0:b0:33a:f523:8267 with SMTP id j18-20020adfe512000000b0033af5238267mr1618572wrm.47.1706794157872;
        Thu, 01 Feb 2024 05:29:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXBUsdl7rZxaykQBc8B1a1Wrss6hs5SRVdWTi4idRshcmfbloeFDW8oAc8WBj+qGfI8tK4AROwN+WYN2Zizphj566BgmNj6kACuMy6rksnEJv5q8WWiRw==
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c00cd00b0040f02114906sm4390402wmm.16.2024.02.01.05.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 05:29:17 -0800 (PST)
Date: Thu, 1 Feb 2024 14:29:16 +0100
From: Alexis Belmonte <alexbelm48@gmail.com>
To: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org, putr4.s@gmail.com
Subject: [PATCH v2 1/2] platform/x86: hp-wmi: Tidy up module source code
Message-ID: <ZbucrKh36sNxeyfX@alexis-pc>
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

