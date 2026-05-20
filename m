Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1D630C61B
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 03:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246127; cv=none; b=EfwcGIjhMpMSj7LH9LXPPAwKUI49K8g9eQYWQ6K/UWpjjLp/YrU2Co5N0h6mcNsnjDLjHbT50ifmKECyPm/nC278cHPIv2nrkSmQMf0zYSM/11E9E5UdoC55qm8T8dMUh/2Wq/bo9ss2kLgIcCd6xjoTPOs51J1D8/78La90+io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246127; c=relaxed/simple;
	bh=SAeeSRhtbKjC1hw02O56ZeCzROiNr6pT2l1ISAfCb+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ojf4anRReiKG9mo8XcwT6OzmGSOkwgtqsHN4H3hF/w/vS5KtD2mQZC8jOyeE/AJGNkpSPI3TRAwt+jEk0mGHk76X4IHzlIqLxgKFtUzzxKn5zpU9gxBJ9Tsyiv1KdRYDbREwnfpRfhoYG5icpuuVSygQJ18qHZ66IF4+FPaxcQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMwMMIDO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMwMMIDO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3664df30f53so2526692a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 20:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246126; x=1779850926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLO4P9p1CILPmZ/b9nNPDzXSru8GbvBnIfAswv3DlRg=;
        b=BMwMMIDOBCwcrbYlHP63dHoPX+d7mUeFpu50VvEUfs/C2jqd0Cb2Gnl8I35ywZMWMc
         lU1Ogc2oLXUWvyfztErHds/oyU5IJWLJmNWtmk6nNbfclNZ/GILtfy14MBI9kZBHA0hn
         e04cwQJQghhY9wH0l1q1yX9tiL97Lit/dhFzd8+UyLFh1M6maJZl9Kr85Y03Hxb7tiLd
         dYFp108JL3hwPwdjLUNiZvYkKqwNBfPo8cg334pmJg60qUQj9jKQrPCImmX7P1kCtKbY
         hOzgU3BPWBQCfIYny2sfITBl+DWl52i94zGpCasXq9iM7J9OpbgcyNzcyI66OExc/TJC
         BMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246126; x=1779850926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLO4P9p1CILPmZ/b9nNPDzXSru8GbvBnIfAswv3DlRg=;
        b=f+8J7Bg66+e+ISsISR9naFcnKCiqvqXMxCKGbfzJ1fYoiiw/x/1i1hlVs3oxb+imWQ
         RUPWtgfBBMdAA2kT7N52smX/+ynieUfIoIlh0Rq8a6NUPcs3bqBTU/h5IF7+cS2hGPKC
         WkB5PSPfW6eCax51fCN5Z6asH/ewSLOMnygFBwJgaOrJmdYOmi6vNEf2B1tehk37ZkAl
         oGI8wQOKBKqX8JvjzbM44HH4tq4x59zNRQ5aE03bEThZZU5Fd+4S4MFezFPuzaLtRjEc
         tg/fkx/E3BdbOy39CH81XogALGrN0NK5VdiZeU0KYGBTKpchAcNzI19so2cflaa4Cw4A
         rCaw==
X-Gm-Message-State: AOJu0YzgHKozBfpKV1rcF+OmPM9wPluvU+ErY113UORDib3ohyR9ld9X
	rqNlUY4j5y1y/Jc4uHC6ga84+m7QdwxdGcVZyXI/V7aguGap+Vn90s19QwNEegPt5Qw=
X-Gm-Gg: Acq92OHRG5I9eV8N1FT1ihQ1+O7xc4FRFoTd99O75xyULrzxGIZp/Ti8me0uNp/M1SQ
	wh+sKandCjbXWM8k15hiembeK4bYfuvJrfloXr3qMbk/24OXMzv3W6aLoV6gQU+BHGmtwPA2Jxm
	Yvge2UD0+2xmqrtX7OL/NGPXK2GV5C3cKnM3ThiXEUknUlf2qbtcOMLu5ugga0/quBw+A+PQ4jV
	o/ggOjTg9I3/SUqFFMbr1M/W9EMQdDdxj6ECTEpUujuA6rTva16O9R634BleJSN6TWFMx40aIPu
	6SQy0jzYaJ12Bzfeyi9QKw4Ge2Rbtxb2JwIB3hz0SS1x7nYMh9nUYyWvEDNjKqtIEHCG5fx58CQ
	2/u19Do84H1p4Rb6vbY7LDCWdfjuqVpEa8/Evt+XfmOKrgp+wAn5I3SBmYZVdZIwRCP/q/QbqZd
	W6foGeIAlr3GIKIsFnUbamJ98aGltuKhhYbg==
X-Received: by 2002:a17:90b:1b05:b0:369:223a:cb5a with SMTP id 98e67ed59e1d1-369519af834mr20253332a91.5.1779246125800;
        Tue, 19 May 2026 20:02:05 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:1e5a:9abb:36af:543:3c14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm19869676a91.5.2026.05.19.20.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 20:02:05 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	hansg@kernel.org,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v4 3/4] platform/x86: hp-wmi: Skip zero GPU RPM rows for fan speed delta
Date: Wed, 20 May 2026 08:23:24 +0530
Message-ID: <20260520025325.103701-4-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520025325.103701-1-radheykalra901@gmail.com>
References: <20260520025325.103701-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Victus fan tables start with a CPU RPM value while the GPU RPM field
is zero. On board 8A3D the first row is cpu=23, gpu=0, noise=25, followed
by cpu=24, gpu=22, noise=26.

Derive gpu_delta from the first row that contains a non-zero GPU RPM
instead of unconditionally using row 0.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 465ad8e..9d2966e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2652,6 +2652,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	u8 min_rpm, max_rpm;
 	u8 cpu_rpm, gpu_rpm, noise_db;
 	int gpu_delta, i, num_entries, ret;
+	bool gpu_delta_found = false;
 	size_t header_size, entry_size;
 
 	/* Default behaviour on hwmon init is automatic mode */
@@ -2692,12 +2693,15 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 			min_rpm = cpu_rpm;
 		if (cpu_rpm > max_rpm)
 			max_rpm = cpu_rpm;
+		if (!gpu_delta_found && gpu_rpm > 0) {
+			gpu_delta = gpu_rpm - cpu_rpm;
+			gpu_delta_found = true;
+		}
 	}
 
-	if (min_rpm == U8_MAX || max_rpm == 0)
+	if (min_rpm == U8_MAX || max_rpm == 0 || !gpu_delta_found)
 		return -EINVAL;
 
-	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
 	priv->min_rpm = min_rpm;
 	priv->max_rpm = max_rpm;
 	priv->gpu_delta = gpu_delta;
-- 
2.54.0

