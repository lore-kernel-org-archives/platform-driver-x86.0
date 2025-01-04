Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7E51BEF7C;
	Sat,  4 Jan 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736004668; cv=none; b=g0lvAlebpD6rTstuPLOk76YJPyMKk+nVE7y0ml0ycnlrPRuqCCdgXJSqQk3Wu4svDZIhsQ1dt/Toqq1EZvDrf6salvHeoN/yX3Omk7X9CyXHsVUhx/v6ixtePUFliKuATvzy9IDfVak4kUaDnGA9UBRzMi/yRPY3FxhmGV9mioU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736004668; c=relaxed/simple;
	bh=mCXy1uJgyqnmmInbiiIS+FP9bIVqBoKc27WQ/yYkNFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+zWwMvkCPWnX+xOiK8xGM9lPAWsfPsEFNBGtSQb12tLme7FuMavim3Oip+Xx9pQy/7BcYyIHAZRk0LGhG7tyHZ4P342QWExDx7HxpeGqLW7kg6HW1o5itgI0Pc4WFdNvtuRC1Vixl8Je+gzM3JniDqsz5LnXtSyq8VGzZdPujE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSUnKIuJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSUnKIuJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so14902411a91.2;
        Sat, 04 Jan 2025 07:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736004664; x=1736609464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIX3N8dFiE43DOEk6pDwhXB7Ih17CUSWDmrTq7CElGc=;
        b=SSUnKIuJgp2As5Yqh9Y7JgEeVZKswhM+J9Eanoe2CoXWmN2jUFN4taqwOI9t0ILXQD
         EdmjXGAf/6jVDLW1ct+173PMIkGWcgOefMQH+88Lodifbt03nSHe17Pn3Zfb0xeA8lrq
         e8ETxXwOvb7i4fghGRO+G+TkUWvv5e9yKqKmXivmCbyvQbsolafivp1vLgItfyp9TpRq
         yOVSCQEFfb+S259xa82LoR3Y6DMu6X9Jgyu0iqwu3CNPghefJIs49YpW1k4KED+bXhFW
         p0wF2LF72QhGK/0X4ZOPWsPiCT82LpIZ+GUPlihyxGzfhJGoGB65elsPl9Yr1gs9CrWn
         xyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736004664; x=1736609464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIX3N8dFiE43DOEk6pDwhXB7Ih17CUSWDmrTq7CElGc=;
        b=QqOJmPT6Tsx4l2VREjKVZJ7iPsjIQXsmETl9LwSoJvDi3trZ5EcmQYUcmRZOieToa0
         dpHUjt148A78dCp5O86276/uvqdbDDaANm8tieW2lQrmmDuRzihRyFJR9nPoNJskm8UK
         h1KQQzOpiuO1NdxNdX9SIMn1YqMIYTP1SBPEynY5PjCCkIH+fGwVjJyzFoeE8e58LySj
         Yqg7M1t0Ed5oWuNe1MRsO9nn/vbNxTYoYlaOCm0KsoCqFnTe0I2KGWmtoSp/JasoTRhN
         6smL43mzsrOr1VM9lQTgAN4/kvQisz1O3lyZrYQG+s1Q5aYklX7B1lOsbpSFB7Y0sKXv
         QUjg==
X-Forwarded-Encrypted: i=1; AJvYcCUkIB5I27En9OcP1Bs0xRthQj7hKabRKa0S07vYrQsc/gSkBTDuUsSUB9myltzY6B5wrFCapFgtqHqB4N0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ34nubZ1VqVwZPZG58YzwU/s9pAbZT0lBmnwPUQYbduhOFxG0
	RKreMC4ys5beCB/ZOKnGfFPezp+o+Km4VjV0vkQY07vfrowVfqJMuDG6q1xGHv8=
X-Gm-Gg: ASbGncvp8Y7KO2NBzjoDeT/D8Xq9uSesljlmBfwADkl8nYP388X+ZoPFsm+p5qt3TES
	e8JprKEdrxOa3eBI3ZfXNYmiwKWQn2E7rdIVKSBgVVEicc/BYsleW8dioZz8Cun0DWeMsoMXt9N
	TfmlSMPIYwwTr9nz2O3Qu3xuu9sNmprKBBcewzERm0s41jXaCLz3LQTqZGV7zQ1mzQ1FgdP7jFI
	ljiPrf/w0mrOpIXTrA9WkKD9g77XJ56XNEFkw4XqVMzcKOXExehqAGJmG9lzHm9
X-Google-Smtp-Source: AGHT+IGO5er6q2NQvNZLo4aDAqnNAiVE9Ug9sRW5d+JGDc799FOq5dUnHNMTTjuh1yGy5N8e7V9DLg==
X-Received: by 2002:a17:90b:3d45:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-2f452dfcd01mr76120277a91.1.1736004664203;
        Sat, 04 Jan 2025 07:31:04 -0800 (PST)
Received: from [172.19.0.1] ([2401:4900:315c:e91e:a8f1:4734:ec05:235a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97182dsm262417815ad.82.2025.01.04.07.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 07:31:03 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Sat, 04 Jan 2025 20:59:21 +0530
Subject: [PATCH v2 2/3] platform/x86: acer-wmi: use an ACPI bitmap to set
 the platform profile choices
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-platform_profile-v2-2-b58164718903@gmail.com>
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
In-Reply-To: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736004654; l=2962;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=mCXy1uJgyqnmmInbiiIS+FP9bIVqBoKc27WQ/yYkNFY=;
 b=kjPy632rMvEd3fFJ4av2xGL+BpOqq98nSSGTumVzgnGb16IBYxcLzJx5IOVuJ2b+TVNUqiqIZ
 qpdqS+ljn4nBEyXV9AWZ/FBaZKIZCE0UVEZqFG0i+PhmXckkaOu1QfA
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Currently the choices for the platform profile are hardcoded. There is
an ACPI bitmap accessible via WMI that specifies the supported profiles,
use this bitmap to dynamically set the choices for the platform profile.

Link: https://lore.kernel.org/platform-driver-x86/ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de/
Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 5370056fb2d03a768162f2f1643ef27dc6deafa8..f6c47deb4c452fc193f22c479c730aecb1e69e44 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -33,6 +33,7 @@
 #include <linux/units.h>
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -1983,6 +1984,7 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
 static int acer_platform_profile_setup(struct platform_device *device)
 {
 	if (quirks->predator_v4) {
+		unsigned long supported_profiles;
 		int err;
 
 		platform_profile_handler.name = "acer-wmi";
@@ -1992,16 +1994,30 @@ static int acer_platform_profile_setup(struct platform_device *device)
 		platform_profile_handler.profile_set =
 			acer_predator_v4_platform_profile_set;
 
-		set_bit(PLATFORM_PROFILE_PERFORMANCE,
-			platform_profile_handler.choices);
-		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
-			platform_profile_handler.choices);
-		set_bit(PLATFORM_PROFILE_BALANCED,
-			platform_profile_handler.choices);
-		set_bit(PLATFORM_PROFILE_QUIET,
-			platform_profile_handler.choices);
-		set_bit(PLATFORM_PROFILE_LOW_POWER,
-			platform_profile_handler.choices);
+		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES,
+						   (u8 *)&supported_profiles);
+		if (err)
+			return err;
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_QUIET,
+				platform_profile_handler.choices);
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_BALANCED,
+				platform_profile_handler.choices);
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+				platform_profile_handler.choices);
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_PERFORMANCE,
+				platform_profile_handler.choices);
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_LOW_POWER,
+				platform_profile_handler.choices);
 
 
 		err = platform_profile_register(&platform_profile_handler);

-- 
2.47.1

