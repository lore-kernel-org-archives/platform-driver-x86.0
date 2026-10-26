Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984074;
	b=bczJxIJ3SdF5mN35lJGiZGOJbpV1jmueyE7SCVvKnb6QsjWjPs5c89AhqIiVtSux6GSH
	 TLMkZSfOxujrh2L3lYDOM9z5UpQmflf/RaNSHppj65SDgQ6abNy4WLcJoAI2OYZc3d+Ub
	 sGapFrMAbROOmapjQ5UCN3y+NTXFunNdLoDAOlqZ9qhp0jdN3w6T49BNG5or4igoI/PGw
	 xyylUVEY6UTuyXviZ2iQoinrHdn7DEH1O/964rSCnFAJhH4UjHHTIYGISAMrMG8s8fgJw
	 sEnAo+0umvJ2zLvctFs27P11BcTU96Gr+aIY9lzibgj9IHYeyXPSbBhATMZW4YwhSvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bDsRW0hZwgFCAJKIXhtjDM35UWFd/bPklgIyU9R6/7g=;
	b=qxRPXK3rhAsUX/MBIil5eh5miKUN/Haddg995Hjo/m05gl2GJdxqku37hhYD11zamz2K
	 CHWbMgtm/njoRIILS6cWyE24qRfIUlAY4UYB2xS9arw1SzvsDbsaZ8A2/CQ1kdccCPXNp
	 AFLVISJ67CzuRutylgG+lI3f9nqM00ME1oT9KNdiGGa8DDCjMy53hvdVt/pC3A9IB9N7o
	 H6yl2T5VlRngo0KV/GirMI3cTMuLMtoYHJt6yspd/M/zYAwm+/MvaXxw0PfRoS4X8t+FL
	 FsN9Exzg7JASviW1d+MteWbA2lWp+ZBsmo+msVj0XDbZ0l//rjLuxGbft1iaT3Z/YCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UVDqhua1;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F188A606A31B
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F188A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UVDqhua1
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-704597ef1d8so1103056eaf.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 20:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792984073; x=1793588873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDsRW0hZwgFCAJKIXhtjDM35UWFd/bPklgIyU9R6/7g=;
        b=UVDqhua1NDkYEcmAK1m6++8H4grEOIF2P27IXvv6Fff+cSsaPl+Lgv0KlzS7s/EaHZ
         jSn4RnpdMjDFbNwDRX8EZKpuAjNG7/mTRgPzEpmESwpe5HTRhZ1h30hfIiGTTpCJcj3Q
         DW0p2JiZTqoB5he2K3hOGAVd66Z0Oi1fDbiu1q4IjKHbDiffxWjTGIQ0grfse/kPUf2h
         VMBPHEkxey3b2HtBE+6jH4OcFSnaWwQxzswxkdPASyKUcuJbxCBP2/8sWKxb/IGwIYLn
         PVBgcy14jUjINI9zStF8iqiLxjSRdwOBzwsVMPg4HZDpMOYyWq3H3lXEW/6ILUhRTraB
         W9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984073; x=1793588873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDsRW0hZwgFCAJKIXhtjDM35UWFd/bPklgIyU9R6/7g=;
        b=E6AY9TJxq6xrfV3taNPxPSEMI5W6GH/CKwJqJnOxOFkGWGMBWO5nj3JRu/DPMd6r9V
         by7pZiRw4Ume2B1ZarKwkzA60wH11l5yXaFuMGcV+UdkiqKWXmu05ianeFKlGxDa3ZZU
         Dbe6UoOGzeRAFA7gfcWHzpm9uedj5TRuOD09kj6FSbq35Ipfv1BDu5MQv0SbA6sf6r/Z
         r+bpVibCjtdCb+Q5aHKNZV0Pp+1aEqez+8odBiLfIzAEu2WHtY/W+jW9taOJ0ShZl9OR
         HKkbLsuDd0bBgw3chPIsCj+MZaBI1qvxg5TkGOOp5CqhujgLTPJ0HGmrkhUQdDvgJyZc
         MJ5A==
X-Gm-Message-State: AFq9FYKbneBpOzhDttA8rGuSsBTo+XfOrbP2LaxRwYUCVS98mYm4Mt5/
	ayyd8K9eECcYOmjKhhh5O3Ou3+duvsxf4767DOJ14Kib8wlPKfBZ7p/G4eTZLyEX
X-Gm-Gg: AYBFou1qjfJkvRd35MaLDWvOcLvIIJ/ZRnraeSVh4HSrtnMR6fxm6Vld7eF4umYdCzj
	Iwq0PyLlNe2TiwSjPqP7iuGPuqQ62jcKnmxUgUOTxtBvO6QyOr3r+gURrHF2SY/po9GP7VDLvtL
	0LJQtnA/0QzaV+++NMtXvmp38QIOdYPp+eikF0UOSAKM2CnmrJCMv+mKuc8fSUOSjuPdfz3xsYw
	xhryF47vVC6n0QRZDzBuzLV84v2YZAIKiHvwqq/ufRJUFRJH9o/eOq7heAaggfjQSVob5x9xR9/
	0iTeZrqWH8gXkhWdveIgUwstimaLoSbjfyZw9aKr3CHTbWC+4uyyDVw97vT2ci7zfS/ZOynaqU0
	SerO3b9dSODr2f8DghSiY2fe40/Ma51E7IQSTgDwJ/Icvw3r9wCjYjCW/rjq9ca34D/JxFlhy2p
	UMh+6X60+R07vVENY4I80Odbkx9ykNXk43SGP9jCLhuRhfU27uKLWd8oR22Hn8/L0daQOFsUMW1
	GbF4nsj/UxEMzsP2Y1vo/1HskLxH/0Kj52kNDwbQ8F8QRSVD3KOMHu0QMsnJQ/LbswXSxnZoDat
	GQWU2CXbwCsJlRr/Z+S7CSrUtoc=
X-Received: by 2002:a05:6820:1614:b0:709:529a:4775 with SMTP id 006d021491bc7-70ba0eaebdamr2956945eaf.50.1792984072858;
        Sun, 25 Oct 2026 20:07:52 -0700 (PDT)
Received: from AkhilLaptop (mobile-130-126-255-35.near.illinois.edu. [130.126.255.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0749cfsm6811729a34.9.2026.10.25.20.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:07:51 -0700 (PDT)
From: Akhil Boyapati <boyakhil978@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Akhil Boyapati <boyakhil978@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Use only the low byte of the thermal profile
Date: Sun, 25 Oct 2026 22:06:58 -0500
Message-ID: <20261026030658.119596-1-boyakhil978@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the HP Spectre x360 14 (board 8C15) the firmware answers the
thermal profile query (0x4C, read) with more than the profile: the
DSDT's GTPS method returns the profile in byte 0, OEM flags in byte 1
and the device posture in byte 2. In Quiet mode in laptop posture the
value is 0x00041103.

thermal_profile_get() returns the whole value, so
hp_wmi_platform_profile_get() matches no profile and reading
/sys/firmware/acpi/platform_profile fails with -EINVAL. This also
breaks power-profiles-daemon and tuned-ppd. Probe writes the
unmasked value back, which only works because the firmware's write
method (STPS) uses byte 0.

Mask the value to its low byte. Boards that return only the profile
are unaffected.

Tested on board 8C15 (kernel 7.2.11, module built from this tree's
driver with the change applied): platform_profile reads back correctly
after setting each of cool, quiet, balanced and performance, and the
firmware's ODVP0 follows (3, 4, 2, 1). Not tested on other boards.

Fixes: 4296f679ca50 ("platform/x86: hp-wmi: add platform profile support")
Assisted-by: LLM
Signed-off-by: Akhil Boyapati <boyakhil978@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833a..6180f1d21 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2117,7 +2117,13 @@ static int platform_profile_omen_set(struct device *dev,
 
 static int thermal_profile_get(void)
 {
-	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+	int tp = hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+
+	/*
+	 * Only the low byte is the thermal profile. Some firmware (e.g. board
+	 * 8C15) packs OEM flags and the device posture into the upper bytes.
+	 */
+	return tp < 0 ? tp : tp & 0xff;
 }
 
 static int thermal_profile_set(int thermal_profile)
-- 
2.56.0

