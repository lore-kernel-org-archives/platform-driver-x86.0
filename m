Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151BB37B3FD
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 04:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787113115; cv=none; b=TVTqcyT16axBtG1jsZyd2S4Avvcgv9iVwOQKehtRwam52t4pyQMS4Bdf5X6EKYKxKdPv9ujSWWTMICXjg+tgVbemJxFgYbl0+yixrHDzA7BvEXk9Ngdl4lkvf1Nyam75qGpFyJVPeUih8Lzi/7V2BRRqab23sf9G1OiNPZ169Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787113115; c=relaxed/simple;
	bh=twl+Uy0y2/fAxdUU6z1/qMBiydXMkJib8gHA07kXbRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFz1ewbPSVdCfk1OUhDNVzXQrhx44OPGH11ztrmUq4W3hOmaZwxzAdnHQwsabbellaVzH6m/6elMqhdcGkNbJMDUljP7KH7DIo6ptAtpChP5/BTFVtIxL1gJ4pmnP95RjqrQW/jEFPXusgE32lAPp81uCuRHJJvpIIjH9Jq6tb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iR3yZjVk; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iR3yZjVk"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e6a434cabso38577685a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 21:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787113113; x=1787717913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ue4mlQRNH0auXc1LYUFJMHPBAnoA99PxBpDAzjIJ1LQ=;
        b=iR3yZjVkG/qrzYFMV3MVbwDa58K6QKYDBaJRvCyCa2HdF2SA16aMdvyZJN9vEtWJHh
         64LqSMWSDro92o0oji+btP2vRNKwAnXYv9+HDPW0D7/eZZGUL4xVqBL3BnHDFZuAS8od
         teezztsVYs1VT1cF+o5n8cMbArk2H+fukKKvEC7nVKGWjLR3OV03C9k+DtkAoN8tQ8Ck
         e453CiLBJwl2gdhYR8vbtbXi5nICd9GnahNeLI5CQCPJHndCiST2SyOIhiLQPwEyVokL
         +i/LUkTx2jiAgQGqvAUM+/P/JKZzyxO1aTo5T74JgKvR8Vk+OBWJO3u4PYV4dje5yaen
         Pgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787113113; x=1787717913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ue4mlQRNH0auXc1LYUFJMHPBAnoA99PxBpDAzjIJ1LQ=;
        b=qcqt/sJJOlSou/8ZTv0OggotqElN48Uko8ljvUA2ikOzrXc9xv94JEF+IeCRC3uIjs
         zmKSwLLiq5SHDYamJfz/vqCvcTmC2ePCYb68wVe+Sn9UIiSRA7fvRSuNGipqgqXvERpO
         cB+TSLeBihxmjlF3zCwq92PiMuhERXCR5KoJ1HOtUeFviBuzZYzFIEIFrULdB/NvEbfx
         JwKXpHzk9gvVdk8j5wh4uWYk41j7Wx91CK5EELG5B+q9JrWdyuah2sKPFhPX/YfPUxvZ
         h/B3IWBAzmWmEJSOXoiTMtEBzWNy9mV4SHwueyLuLSavEGBGtr2dEo1AeRTw5QuySfgG
         RvWg==
X-Forwarded-Encrypted: i=1; AHgh+Rohs9T/b8Q1os4D8J9rHA3dmzLWVJCKKM5rfL7uTQVoo/IDPR69njR04gXBDYxkRN03fZG75+hS+YnkOg+Qr0dgRCla@vger.kernel.org
X-Gm-Message-State: AOJu0YzdOX1auWm1jBXIalBokhsx4u0pkqZqFE2fRvTNlvhEFjGDYYDQ
	7b1b1ovzo8zIHzC0h6uqEYzjh3HAq216NQiy/SH93FkGQ/YrOC2rmDY=
X-Gm-Gg: AR+sD12iCWpIzRm+ZbFvIUKeIgEXuybAvknARdJwljlHECQRafvUma3kSCUDEJxdyxh
	2SXyRhfap2RR7PNYENyRFNm1Y17Yx6Ef7/0UV40MGf5QfmraUI2UyKZuL0an2cOODR4VM0aV6kk
	kQbsEmGpMwDhL/+paCKBhAx87z2gf8E+l7VpgRmM6mIZz1qNqU3b787lFBQZdWU2szQGTUoIH3+
	PHqocRvbw+LWKU3t5lKKYpEz2d2TnuSaTnaenrZ67qmQUfVZTZdB5hMsccr7zliOtpejLLqz8nM
	Lq5P5x7pdB0KRwqtUa051jIEVAjxL4uJp8FWaQYT6lAUCajb6fJ1jCGqHpL7Ks0GDkiGOl5LXsw
	bNh8dBZ8lWHdO37a2orHoZ3JyzMMj2KQDHb9kQULh+DwDsEB3riw31lLYl23mdYDigjSuoQNmND
	m6b+z+/HSzJUn8DbQUmSEOuVG/4cfIob9MAa9RIKDfZXUaXLApf0nKvFAPXaQuXAuFMWIKVJyAL
	+8pAyCCJFXgnicjRLFmHZJ1Pv+v7GrC6fU3AuefZQRnmdYI3g9wdK5k6873eqt/IJZqgSiLKOhf
	D4TisR0HZOb0wFXleDyNpFAM3OJApvKntcKrw4g=
X-Received: by 2002:a05:620a:284a:b0:937:11c9:37f1 with SMTP id af79cd13be357-9371e29f5bcmr202570285a.16.1787113109685;
        Tue, 18 Aug 2026 21:18:29 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9372056b728sm49696085a.29.2026.08.18.21.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 21:18:29 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: jlee@suse.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v3] platform/x86: acer-wmi: Add support for Acer Nitro ANV15-51
Date: Wed, 19 Aug 2026 00:17:40 -0400
Message-ID: <20260819041740.9645-1-justinyvar@gmail.com>
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
profile handling, hardware monitoring and fan control, but has no quirk
entry, so none of these features are available.

Add a quirk entry for this model.

Note that this machine does not support the turbo thermal profile: its
supported profiles bitmap (misc setting 0x0A) reads 0x53, and writing
PLATFORM_PROFILE_PERFORMANCE is rejected by the firmware. The four
remaining profiles work as expected.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Justin Vargas <justinyvar@gmail.com>
Tested-by: Justin Vargas <justinyvar@gmail.com>
---
v3: Use a model-specific quirk_entry with cpu_fans, gpu_fans and pwm
    set, as suggested by Armin Wolf, instead of reusing
    quirk_acer_predator_v4. Fan control is now tested (see below).
v2: Add Assisted-by trailer per
    Documentation/process/coding-assistants.rst.

Tested on an Acer Nitro ANV15-51, BIOS V1.60 (04/08/2026), by building
this patch as an out-of-tree acer-wmi module against kernel
7.1.8-1-cachyos and loading it on the machine.

Thermal profiles:

  $ cat /sys/firmware/acpi/platform_profile_choices
  low-power quiet balanced balanced-performance performance

  low-power, quiet, balanced and balanced-performance all apply
  successfully and audibly change fan behaviour. Writing performance
  fails with -EIO, consistent with the supported profiles bitmap
  (misc setting 0x0A) reading 0x53, i.e. bit 5 (turbo) clear.

hwmon and fan control, via the acer hwmon device:

  pwm_enable  pwm    fan1 (CPU)  fan2 (GPU)
  2 (auto)    229    2311 RPM    2057 RPM
  1 (manual)  255    8167 RPM    2077 RPM
  1 (manual)  128    4482 RPM    2065 RPM

  Setting pwm2 to 255 raised fan2 to 7284 RPM while fan1 was unaffected,
  so the two fans are independently controllable. Restoring
  pwm1_enable/pwm2_enable to 2 returned both fans to automatic control
  (2267 / 2000 RPM at idle).

  temp1_input, temp2_input and temp3_input are also exposed.

The WMI mechanism was cross-checked on Windows, where NitroSense switches
profiles via SetGamingMiscSetting with index 0x0B and the same profile
values used by this driver.

The analysis and patch were produced with AI assistance (see the
Assisted-by trailer); all testing was performed by me on the physical
machine, and I take responsibility for the patch as signed off above.

 drivers/platform/x86/acer-wmi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0eaaefb13d..86c212df49f 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -466,6 +466,13 @@ static struct quirk_entry quirk_acer_predator_ph315_53 = {
 	.gpu_fans = 1,
 };
 
+static struct quirk_entry quirk_acer_nitro_anv15_51 = {
+	.cpu_fans = 1,
+	.gpu_fans = 1,
+	.predator_v4 = 1,
+	.pwm = 1,
+};
+
 static struct quirk_entry quirk_acer_predator_ph16_72 = {
 	.turbo = 1,
 	.cpu_fans = 1,
@@ -662,6 +669,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
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
+		.driver_data = &quirk_acer_nitro_anv15_51,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PH315-53",
-- 
2.47.3

