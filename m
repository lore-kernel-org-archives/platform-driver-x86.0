Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08663E1701
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785364566; cv=none; b=LC5QBcMCWGEXxV7t3dbRZYUkmvsE6ZvN8qnFEDaScnLekPxl1YB7L1s3y9tKvRC+lLH7THBmOd5u2fs9Bm1MG/+YN2UNCe6F+1xlRXRZlvFknlRV1A1iratfonb85psmnCaDPB4TdZ9JfVB3anI5DNoPHwqyT28qP0O4Zbjs/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785364566; c=relaxed/simple;
	bh=xlsmi3u3/n3PwIaZaNdxIG53UDgFKHZO7Fzobi2NxOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SnsKEpDeNi5ITF7IQqgx7xR/AdnaHmP/+Pp5c9TvRDwDv/8z/T9ro6oBnOTgQ4h+nOZ8LHbzfTib3V1qZeIYDO3eZYoYqCeTJOcKbf5IobqgL/YI2tvHL3lGC62zxQU8oSADgR/bc7W5gXkyvqcFL7Su47V196KlX0dxmGuw+n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNbjsIvq; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNbjsIvq"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c16ac21acso9748401cf.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 15:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785364564; x=1785969364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5fCX6hAU/42AizwI+7/BCppJtMsQ0i9yaIaJ+tm93M=;
        b=aNbjsIvq44twss8lT3UUy3XwNDnWfN8s/rqxIhDfsBjPK6EZbUyVp880fMHOKMD0A7
         XX4OkLGZ1634jLVbnPRu4FNNh2ENRT5X08K5RxxAmbIvLeItxcWadk21NsRyuQC4KCji
         XxJrSPrM8oOd52yoIvxTAjvdkSzcEPag9qEVQdvt3sUEJiLMnpPY99pE0duNUfIdKyfu
         VxB8taq4btFIwc+gFD/RXZJ7SVZ6CreGCcow7HghhM+Gd5bRfdaJPt50eUGFH1t/Fld1
         jlxWcY6P8qrA8n55s0JxPO+m69jTNrcNGFnpGACfYnx8vJo9c1ldYAylFG61VA+Nh3Fl
         9JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785364564; x=1785969364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5fCX6hAU/42AizwI+7/BCppJtMsQ0i9yaIaJ+tm93M=;
        b=tD4i+7fHR7l79Wx6/LgxKgOBKX+yabqPPN3TvmqIcy0FMDiNu8r06WXfOKZynrxcdY
         8t0blRXn9m29jyAMngBuHZI96+Q5ss4RwZPN9CeB39E2NyldIouDrXSF8gRQ+NFIykEk
         tb5A9Jq0BVh6yInM4pNpfUqHhHGz8OJG5zu0/LOgEOFZ2TawzkLisRwA/XrGT5F7pbbJ
         qRV233bsgGHJKkToLxYT9PkOVkm3lHdFV9nSr5EyzxJ6VQnFzxnVvNaQeuxDz/vKJTAr
         VqQ1Var+pL8jucMONTYYCbD5Pcm5/JnVmI/bVVNgm0FHOVUkTaqk//A152pH+gUpXKGw
         ftrw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1GjgUPcg4pLFeek+xoBlIEw6SdVaHjmK9yEP/AL0Q7muDOMrCmaDzY/BRqJTO296hnFtrDwlQq2jY0VKOLS005FNG@vger.kernel.org
X-Gm-Message-State: AOJu0YyRtA6pryDXlWs0UTcJkCUmgKHW7TnUt3f5jcUiMpWuo6NR20Vq
	6fdVVzF0YZ7RXuBzTbm4LyOz4NmaIFGkTxbVOdAn1T8G54+jN3ECHdc=
X-Gm-Gg: AR+sD12jbQiOl+iI8ibXy/gJp7oBbep/QGSACs90/Ki4MnoPTS6oqGdGu4t06HqfjXt
	WcnHylrC8fHWgjOrDTDhRsVBat9Nx8Gt3D5KFDB/vdPZpujh5W9fHzsQU3l+0C8I4ekSMk01+OV
	tzWClNJl3IYQ7jcUwnDWr1k+8Pt//4+wuPTMhg46O0C/mw4W59qkSq+hDPyZlr8HSiRAv1/5/bR
	PgLLr90nBi2Er/1jLL+EGfbBxLMv3Afi9l2vZgOa+qeki5yLj5PU0hJ8DbQ6DPXbt1nGExshuKd
	ICIQSGi5SQTWdJUuAnQe0W4qBS1/XVzTCwsIPUYICqQO58HQ0sTM41xy/w5hc14eVspF5CC0qsT
	2whLRpECeaO/e1o2YiLJZLKUni4+DL/64F+JKN17wPyLp55ttYJONJGCYIuJELbnVvyhyYNKKg3
	3XBsh27a8AvQUD9ZemySJTm34RQK3OvlUU7uNaJOKN/xsLzxji3doSmcDUdtWrXeWgeKwo33YSZ
	wiH4sjToWBOS0eifacV2hqCt/ZFrisPZtSQOnlVW2qMvpdoQhsf2qaPTg==
X-Received: by 2002:a05:622a:110:b0:51c:1117:c6a with SMTP id d75a77b69052e-52b38369e63mr4179241cf.4.1785364563584;
        Wed, 29 Jul 2026 15:36:03 -0700 (PDT)
Received: from localhost.localdomain (ool-4577f7ba.dyn.optonline.net. [69.119.247.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e30fc51fsm28415081cf.30.2026.07.29.15.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 15:36:03 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: jlee@suse.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH] platform/x86: acer-wmi: Add support for Acer Nitro ANV15-51
Date: Wed, 29 Jul 2026 18:29:20 -0400
Message-ID: <20260729222920.6490-1-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Signed-off-by: Justin Vargas <justinyvar@gmail.com>
Tested-by: Justin Vargas <justinyvar@gmail.com>
---
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

Disclosure: this patch and the analysis behind it were produced with the
assistance of an AI model (Anthropic Claude). All testing was performed
by me on the physical machine, and I take responsibility for the patch
as signed off above.

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

