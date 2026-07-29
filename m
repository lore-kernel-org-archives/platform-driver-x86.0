Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B861A35F60F
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 23:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785369180; cv=none; b=Haj+45t6IybSLPjmd+SqDGyak17I/WS7yBfDX1IXclfijt7JHsv+pZu7yDovRAYIQkOFDCMwbfxpDN8o75/S2TeT8XfSTb5aIwENoL0BlvgQ8oOQ6X46g3F59NEm1GH3+zhLQN3rfPpkvBAYFB2e0H1Nw8xQ6l9SJk/Rdg3BcHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785369180; c=relaxed/simple;
	bh=79W9oBMk/ds6NNokcHqp0t+a+topi7vU7hzhVRyXnFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KP9+B9HEtgGh33XqpG+qYDtcE09+++HHzqYf6pw/PNtB1pL23y/4whdJJP80XAPk50KOfPoladkbY8VSukilCQIS1CcxX4PzJRUi4mp5TbYcBpZKz9rryAOejMoKQLfRFTYdT1s7FTf3O8RdelhPw29NPbYXN4y9pXoP+F9KjWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pE+RMP2x; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pE+RMP2x"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e5cb052edso125500985a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 16:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785369178; x=1785973978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pS1M2hlP5/T4v0QABfckm+Bb6KcvE3YFOHjytnFxlJQ=;
        b=pE+RMP2xY2jTdDQ4/4p9qyzZO+vkxrl69lXg/VbmOFtcxt5ceWNrbjKcEjQlU38Ds4
         XjFfpAsghFkS71UwhPgPTkURDyTKqQXiScaNWgOVU+ByxHRj5E28KW+PL6aLlGi9Duvt
         zc2CQL8ISsfoIy/YzO+9RKqHLedPEJ5x3KawOMtykg0baCAzG88I8Y+Z5SvRZuDsfMTk
         PqyZpEjpecotIZExXbANObgemWUbX9dK2wuGNAusF+vKi7r496Tyvdo/KD6l3Xru1dOc
         mxW5eytqobqteUibOkrcdfovbCKEfkgVZbQJh0okrzUbxKNr+vIDXQHWyY4unVQuRcEW
         H0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785369178; x=1785973978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pS1M2hlP5/T4v0QABfckm+Bb6KcvE3YFOHjytnFxlJQ=;
        b=SP0Q9YBEou3YvBxpW7HAQPi3rACW3O72P7hyous72rPguhSwgK3nOq0XQ2Be4NYPK4
         Pfs70jb81sK4AcKUUPpZk11Af/S8QITjDy3NnSENtQVKehAK+xj9xWwsioOwhoYcOFrb
         KCqZgtIHUmL563AtG4TAbwK3PXPqduPmxzhAx7Pzo73iMZyV/R+kzJpJQmvhIV0tycV3
         XmmbScs4yArtJZDn9kLX7y2d2KwVc3W6u3bTTLQ03t3Ua+Vsrv3NOvwfwZtz0h9ig1BW
         Rt5ptDaB3dBupKRVimVRt+CYfZ/wKF1bLLEoOJS75S1nMIm/tPDSJboFHQ4Gg+BHi1fo
         45kg==
X-Forwarded-Encrypted: i=1; AHgh+RodWWXQeDhuj3AU03CsM22vrehYAvc1+2+kpF4zSVJVKDzL5GrzDOXKfq7/mTMmJi75ixrILpyPfYp2fnRyeo8V/nFM@vger.kernel.org
X-Gm-Message-State: AOJu0YxmjUfR9UGBdW8xSKcUdlNdsTpKNCyF4Ksi2GZ/64Qw4LYKZJbo
	s5V/Tsl2oeIjQ6uBddWQBSLz1KeUrgGZRDth+mch2D29o3mOPsEzHJM3F7ZIryqXn8wA
X-Gm-Gg: AR+sD11s8xxkOlOObx+S63CB9wPEx1NzWiJG/KPqA5P8n5OdcajjY46/wHKHLI6eNig
	LZm1JGtKXECrQDu89yxs4QsNTFfy5VAXY9tHgxu4deElH212PSHLOlHOvHCHPU6M+HxZTLnaIek
	hoW+vfpcVs5XL7mxPWetyAaIOlqMcOjzhnK8GPqWjqc5Q1HAdKFD4glHPXnQvVHgC+D6oq/BsBo
	SwEaxX3fGKOjs+UL4czpu0FYX5PBhnBIY7wn+4rP8KFDeKg46jdUPIfyzDr5zLiZnie+BF1PxJ3
	WQ4oFj6njPmyct7bcEPJKobizpcfz7TJqF8UNAdffs/wF3MhPejaCjMMPm0L69+/jBvhqeMPms1
	OL/wHCXyT61GuD/I3MzX0UluGqVthg2lyk45KMxycWVyoZQ5KjTB3xZ2E6v2nyF9hR+AjVMwCBs
	BGDeHVpeDhNjYC5f/yliUurkWwUDUvjjRIqxfPqmeULRNPjby7MSrNcnpGAI/ey3NtGr0I0Uu/h
	MdHkr72eIKhTcf2yuUcGUB1BZXeYYnUXSGB/tU1NG4T9fWeBm2iigcSOg==
X-Received: by 2002:a05:620a:4446:b0:930:f889:3092 with SMTP id af79cd13be357-9348614e732mr40465885a.54.1785369177627;
        Wed, 29 Jul 2026 16:52:57 -0700 (PDT)
Received: from localhost.localdomain (ool-4577f7ba.dyn.optonline.net. [69.119.247.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908323e8bc0sm2844296d6.26.2026.07.29.16.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:52:57 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: jlee@suse.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v2] platform/x86: acer-wmi: Add support for Acer Nitro ANV15-51
Date: Wed, 29 Jul 2026 19:51:25 -0400
Message-ID: <20260729235125.1698-1-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729222920.6490-1-justinyvar@gmail.com>
References: <20260729222920.6490-1-justinyvar@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Nitro ANV15-51 uses the Predator V4 WMI interface for thermal
profile handling and hardware monitoring, but has no quirk entry, so
these features are only available when the predator_v4 module parameter
is passed manually.

Add a quirk entry for this model.

Note that this machine does not support the turbo thermal profile: its
supported profiles bitmap (misc setting 0x0A) reads 0x53, and writing
PLATFORM_PROFILE_PERFORMANCE is rejected by the firmware. The four
remaining profiles work as expected.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Justin Vargas <justinyvar@gmail.com>
Tested-by: Justin Vargas <justinyvar@gmail.com>
---
v2: Add Assisted-by trailer per
    Documentation/process/coding-assistants.rst. No change to the code.

Tested on an Acer Nitro ANV15-51, BIOS V1.60 (04/08/2026),
kernel 7.0.11-1-cachyos:

  $ sudo dmidecode -s system-product-name
  Nitro ANV15-51

  $ sudo modprobe acer_wmi predator_v4=1
  $ cat /sys/firmware/acpi/platform_profile_choices
  low-power quiet balanced balanced-performance performance

Writing low-power, quiet, balanced and balanced-performance all succeed
and audibly change fan behaviour. Writing performance is rejected by the
firmware, consistent with the supported profiles bitmap (0x0A) reading
0x53, i.e. bit 5 (turbo) clear.

hwmon works: sensors reports acer-isa-0ace with fan1 3024 RPM,
fan2 2685 RPM, temp1 +48.0 C.

The WMI mechanism was cross-checked on Windows, where NitroSense switches
profiles via SetGamingMiscSetting with index 0x0B and the same profile
values used by this driver.

The analysis and patch were produced with AI assistance (see the
Assisted-by trailer); all testing was performed by me on the physical
machine, and I take responsibility for the patch as signed off above.

 drivers/platform/x86/acer-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0eaaefb13d..a7290f85166 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -662,6 +662,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_nitro_an515_58,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Nitro ANV15-51",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51"),
+		},
+		.driver_data = &quirk_acer_predator_v4,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PH315-53",
-- 
2.47.3

