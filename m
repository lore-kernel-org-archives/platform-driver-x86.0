Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8DE2FFF90
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234833; cv=none; b=UsAaFu+KgV5MFduvzkWvPXVJwUG3a4sOrcFnT9i5ZCOWSLBVGOQ1O2/iLxbYDiPP3lX4u35kqm+ybBdLbW61UMZVU8Wcg9Z0tVCHuXL/7bOZQwlu4qi/F1LbN8P+DdqJjpS++Z3CA3DtbBmzLmyWSb6MQTFCS9q6pygL3kTlK74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234833; c=relaxed/simple;
	bh=4pKHOLYSr2CmWSkFe34PNT2qnOpdIGQzmRnjKvMM3I0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FpfnAaV5SjKdpYc37nF0DvRGh2sJybgkpR5eLNTspMjdV12p85q1Ero99+Izgw+N4bOjolKz7YQRXz+/5Nkwdga48i8Lxun5oLaUIvDGyT9atfGTe1U4I1EcIwgqRSLmCV4WQOEyooTpc169fRaKRSNzeo8F+RUNYD/vvzZQ4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grtUh1pG; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grtUh1pG"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c73c990a9cdso566045a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773234832; x=1773839632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xoo+myGq78Y0L6FdfU9pb8DVGTgcd/ucvRvKLUCNIWA=;
        b=grtUh1pGv1rA4ShRGUUh/aP9YbLI7mnHYBaF2fjfcoh3hgMlbQgzK3mZ8kFnzPfFQj
         WjhXuyeb4bPkErnHkRGe1W/xsFV4zYJMKsbZFtcX/xug4tLJuHRgwHJp2vRNaTO6ubDV
         fsNVX8nD8nUciqTxCH+j5dT5SYs4GXsavUrrthe4YtUjNcHX3pkPsczrOA131iXijccN
         0YSog1M9KQoqWwzm8vrqMxpli7YPBm+7HGLv5/Eh9HLj4iz0ywb6LTT7qDN+Hv9J88G4
         NZG+QRu3i4DR2pU7AIN52PbGqeNj/Jc17k+zzXHcBL+UKuzA5iqtWm5MhZnP9C6LZlCY
         P57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234832; x=1773839632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xoo+myGq78Y0L6FdfU9pb8DVGTgcd/ucvRvKLUCNIWA=;
        b=v2Q8ko8T2AIlX+KdNl40ABmCaZQk1ihlx+4gkN+ruj0GtsL5vw6ssF+y5aWqmz46oZ
         udjeZdwJClX2zcC1AvcK/gumW0JPUK0eV8ct/f3BFuL12eO8AuRgQsARlnBVuHpGB4XW
         x3mszTMmbtoBwajFeWvlMELpDAeKrFcezKCZNFW9Jwhq00smxhg6sUTWTF58zHaECQNA
         weL4/gsgap3LDgKfXEeLRxN0mDxcZTCqJcCPYzft6vrxASSROah1+WMBoJlHqsfcJ10N
         klqvhpnC45Y34qELOUpsPidNRMZg7/pyMQ3SvhShZa90xl6f5O8Fc4SD1u2NvpAfijkD
         B8lw==
X-Gm-Message-State: AOJu0Yya84ZHLfJ1HWjiSXr/dbBq+ISH7K0RZCTf+gbgrCB6TWm9BOvT
	ES93wvmSQy23fk2fZQrIKYUHEVzfPFlwCcuAoj1exw86OvYkFQTnZzj6AKDCBUzF
X-Gm-Gg: ATEYQzxDHVbtYJs6BBvfLWWMo8xRqzYqFISzOld3XrypR3Hn53CiQ2+0ZeCIw0AfPNo
	nMh+22jG5gxo49HBBNdkwZELjwBvCVNnQHmTKj3/OXT5sNR6S4syfUOOPEDG48bmdtzE0bIkRyM
	/Zfiogt8JiXXtiA7TIe13Ka8ftEoHH6LxiVXwMpq53FKNXTMdtN43DQMUwWffrMEFzzO8Paopx9
	Ju6snkF6uxSk4Fmtzb1vmBvoDZkKqHUj2fG+43tbYyKpZttEcJ73ujdsfMgOsxWRHARjflNE+6I
	MfqehlbX08ehk1f7oUucpXDT1cAaiLjFFRuRoAZS2TWM1AmmlpQvtzkWlwBBuLd2CpBLCyp7QWC
	IH7934TmPskIGoUmDa5J5RuJ1NPH1i85bzw1FxMwJL+l0M+L2TbLWIU1iMe4TFaCMsnxOcuCfoO
	k0Bza8pmzPB/1/rfiyyAvV4lWIkHCokLlaSubbCkpq0Co=
X-Received: by 2002:a17:903:2a8f:b0:2ae:7ed6:7d15 with SMTP id d9443c01a7336-2aeae88b2abmr28200755ad.28.1773234831590;
        Wed, 11 Mar 2026 06:13:51 -0700 (PDT)
Received: from omen16 ([49.207.204.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cde37ffesm2221712a12.0.2026.03.11.06.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:13:51 -0700 (PDT)
From: Raed <youaretalkingtoraed@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	Raed <thisisraed@outlook.com>
Subject: [PATCH] platform/x86: hp-wmi: Add Omen 16-xf0xxx (8BCA) support
Date: Wed, 11 Mar 2026 18:43:38 +0530
Message-ID: <20260311131338.965249-1-youaretalkingtoraed@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Raed <thisisraed@outlook.com>

The HP Omen 16-xf0xxx board 8BCA uses the same Victus-S fan and
thermal WMI path as other recently supported Omen/Victus boards,
but it requires Omen v1 thermal profile parameters for correct
platform profile behavior.

Add board 8BCA to victus_s_thermal_profile_boards[] and map it
to omen_v1_thermal_params.

Validated on HP Omen 16-xf0xxx (board 8BCA):
- /sys/firmware/acpi/platform_profile exposes
	low-power/balanced/performance
- fan RPM reporting works (fan1_input/fan2_input)
- manual fan control works through hp-wmi hwmon (pwm1/pwm1_enable)

Signed-off-by: Raed <thisisraed@outlook.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 68ede7e57..6de701762 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -187,6 +187,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
 		.driver_data = (void *)&omen_v1_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
 		.driver_data = (void *)&victus_s_thermal_params,

base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
-- 
2.52.0

