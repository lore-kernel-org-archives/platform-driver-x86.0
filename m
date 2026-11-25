Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583301;
	b=0mLmZ+WlkOrIw4YgnT30y6TbDs9j7dpu4GWaBn0nwUR1RHo1SvP9lSFfgsuzGxwlgVxp
	 tPUCJfNt4WGbGXYKFo5SKeUE0FBx6AbEPn4BRN/wN4+ApFPW0KdulculM6AXnZSLXLvPI
	 IjIG9blUASfk21KArYE8QagJxSjY3l4JEJbsinrOeQESFyF4dnQwJMsw2FYTl5YBTQ2n2
	 +28xGVOTl79IEQWI1kJVKEepiLQP7FoFKQGBVqQcc6dAkboMzJAHvT9BDO0cb3GnpwjRt
	 Q/RZNjT815mToi/EHiTaznaeMe9+gyFSyx7v4nOE+EvdlCNl53lfIIosKOknHcskh5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2/c3IKzzHAgU514/BNkhisNgWo9Ok/mWBzvy9lacaKc=;
	b=lHKjCK/h17YGZ4284YOXWIFILkhHq+IKp798QVSGhW+2OEgnJt+DY2bGRQA0qc02XJNx
	 okDfntZ7h1CRjDwG21xLaIeEgqVaS+6z1AXiEsnwO4HJoDUyxGXfmba/jer4NU/cboUky
	 7j1d9qNc333Q7iDworXybsQslexmRB+qvJGDDRO+b/mDsQbq3T52w2gUd6nLqYKq3/U2o
	 XbI8xBG9PNt2vpAlSpniILFy+7hYizBqWwDhdApXnhUuUZTHQBAiolH9MSVqz4jmhPGSx
	 YYv5N6bc9zMUIc3am2kS5XMkVkd+4zSisXsmmPOVCYIn+FdppGp483HXaJngrg60+vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erJW7+sV;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B36606A323
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 05:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B36606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erJW7+sV
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-3869c1f4d19so1332992eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 21:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795583300; x=1796188100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/c3IKzzHAgU514/BNkhisNgWo9Ok/mWBzvy9lacaKc=;
        b=erJW7+sV9OG2wjbQVW+nkxcdIGBMgV1gRJfoeQ8/E6dFzxt3qwqYHE4un0liH8GQaO
         z2X0LF4SqbJZ3qj6srQkAMqAPPAg0wHkIdGWttrLY7HFNLk7jWdl4hX/s7MkDOByY/QK
         dl4oEFGtGffWAV7u4+iFNXcI7o7Iv3bhqjpjFE16ZaYhDJPFSD2RK/iUvl0zrmR9R96n
         FLPqBEIbgNbci8Aco16FpzpDvs+slb/B3khYH7hoyZpMMrO+0Mkbg127TQFsNeVUAgIS
         FYMP9JKD1rVkqB3Cwr+kBH0PRA77P1hyEQw/XA/j2KSaoBRSbrH3bOPXNEUaHGTl+cAx
         IU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583300; x=1796188100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/c3IKzzHAgU514/BNkhisNgWo9Ok/mWBzvy9lacaKc=;
        b=F/hpW0PxiDrkVRZI4vHMtWqDNdzV5i3kBUZuqK5HG8z4iiYcTR03zDl6swaRCbnjBD
         Ao3T6jibjsovEElBdwyEDF9ImAK2GupSOxGKuasx8T77jQSgxHKVlwpcxDAekYTOk7Id
         75w/QZMRw/dopxAu6A7hJNvIC3wpTUanty9C896pg0j4w5ttVXcJURbISF6SVXLcIblD
         uOA2P9webaCVUkOTBaK+wluWFLcx6nRdba0H/+KkmKbHf6OsJWXOrr9raNCWzXJfmfyw
         DRKVc6SjNYatMmJLFiEA1GYy+lb46MHIb1ycT35FzSba7B0FzhUSOwv6nZLWFwSf8KJj
         2Pew==
X-Gm-Message-State: APuU4Z8fylRS/a055+/92N+qj+Qf9/Qk+UEQ+uke/1uG4327/f+kt7Pe
	8eHxqzhVfz01ZWOmum1ynsjGXrXYM+1KAWhG0gaIdqH9puhrJx7jNMV82H0BOdrGKItI1g==
X-Gm-Gg: AZFdTZfoF1juROgef1MQ9SeeO3cshQxVNZIV1rStFD0KIRTMBhNPykDkTc1maI5sqrh
	a/fGYg0UV5RYv6s9nhIND2nN71xTJWH6/kpkqI2VwKW/E3IzHtGq4p8JcyBfpmmxGIKxm4FRXTz
	mYqlXj3rLQZt+WJl89IWSyVPDhYuow4g6v35ZG87aNxB3+rnELA3gAsbfkhukUwyK6lqIJBmFmK
	4TWZ+Jc+xcTuKFd/JiXCsNaAXRs1bHOfPOSMKu2kcG6Nasy7yU1tbUcr2Vq0fSQNfWEVbM5Efok
	InGO/91WoSSoay7HKmr1SMyrqCzwqVD6WIjkIQkhwM1a9TgIF0GCBzI6NHOBRRb9KZ1P7DuqcSj
	SJP9O5SMe1vIp7dumP16aP/6yXk90n8QOznaVizbp3ky5e0lLasPOHx9hkxSg0agKRPHpfLJJL1
	moGtVYnpk/NXrVie+xLFdnRNuHdMdqWoPDMsZwixup1qqRTjuaA42DpgmdBpeNUGQJ9U3oLrXmM
	YqNP3zsu+w+yrPaKANCsKeW2BVp1RaDtBKxiJRXhfXyoB077PsWlhRK3PgQ0mmhIGrD+r3A9HCQ
	i/8uZV3PmOpl3JBKJ2upttO96yNz/gBhjVEG+MzZWWC3HxPp1iw=
X-Received: by 2002:a05:7301:d81b:b0:386:3e56:d039 with SMTP id 5a478bee46e88-386b844ed9fmr6001412eec.9.1795583299525;
        Tue, 24 Nov 2026 21:08:19 -0800 (PST)
Received: from fedora ([38.207.189.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm44303184eec.20.2026.11.24.21.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:08:18 -0800 (PST)
From: Astria Li <tianmutnt@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Astria Li <tianmutnt@gmail.com>
Subject: [PATCH] platform/x86: uniwill: Add MECHREVO Yilong15Pro Series GM5HG0A
Date: Wed, 25 Nov 2026 13:06:22 +0800
Message-ID: <20261125050622.19073-1-tianmutnt@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Add DMI match and device descriptor for the MECHREVO Yilong15Pro Series
GM5HG0A laptop.

Signed-off-by: Astria Li <tianmutnt@gmail.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7fb52b574..7a6e1450f 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2977,6 +2977,19 @@ static struct uniwill_device_descriptor gmxhgxx_descriptor __initdata = {
 	.kbd_led_max_brightness = 4,
 };
 
+static struct uniwill_device_descriptor gm5hg0a_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+};
+
 static struct uniwill_device_descriptor gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
@@ -3576,6 +3589,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
+	{
+		.ident = "MECHREVO Yilong15Pro Series GM5HG0A",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5HG0A"),
+		},
+		.driver_data = &gm5hg0a_descriptor,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
-- 
2.55.0

