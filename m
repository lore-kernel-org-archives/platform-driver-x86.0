Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3121C173
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665356; cv=none; b=kx1RTauxJcU8r2oMKqnwSmnN39eLMPuNL/3CiT5Lf6gBXnvHLyiwpFA7I+xodZeHwLbgfMvO5ptLOhIOmkJOU2eKJZgyY44Ye5MHhXXXR5xdWwBjxLPsS5eH7HiVIes0kmTtNzb8xfNAHoMV6Hfm9d+AuxuQh/AIBSBxd8WySsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665356; c=relaxed/simple;
	bh=F0hzPyMvoECyr1SsVEWFDrBIgxd2jB4oUIeTPtCaLbY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SjplKoMSqEgMNYxja47FuAbGA10x1eGz2whDvuCPuNAHiKlQXxQvxFeQBAs5T21ya8d4Xt9p1ZQw2ZvTkiuNwgLZYczmNiorncAJAO99N9nml6hkXHyov28ldWz/HMMaO59ze7ldtQcW0JnrrQadoS3Z0wEY7sJk38bE5oTbwLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jguk.org; spf=pass smtp.mailfrom=jguk.org; dkim=pass (2048-bit key) header.d=jguk.org header.i=@jguk.org header.b=GRFtEhbk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jguk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jguk.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jguk.org header.i=@jguk.org header.b="GRFtEhbk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso39815635e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jguk.org; s=google; t=1773665354; x=1774270154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xa/X8Gy2kUN3J8KAHUGZl7A7xfxW7cVAp+Xyj0h2ayo=;
        b=GRFtEhbkn9YiKgyxv5GneEUDPMp3hp+eovDV64KLapYnbot8DEvwxT9BWAxFis5abA
         hlGOAfDPLPF4gmopVUwh4s/lISZ2bj/aHgSTwv9E7eyxjgxzBoQMhsGzL8lWBze1N0dG
         Cshd6rg94wnWTZ5OZcztoE85QTA2hu9+DnPo5uYmwm2hwvXmaBcITdRshLaeMaxOk/N2
         SQgH+oNM9FrBfZlwGnY+48F6a2+eHshUav+ReK8X9u+2Z/9hHnQppJf7bnuXiXSoZigB
         IrcTpAm7I30vz517GfFwgqfz+8181MDsA4YEYob4x/uMm+BbOc2PG0ICN9ygP6tb7cP/
         PGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773665354; x=1774270154;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xa/X8Gy2kUN3J8KAHUGZl7A7xfxW7cVAp+Xyj0h2ayo=;
        b=rRQTWHcu52KvRooR3zkmqMcMpyAbM2tWmPCtgd9EcetCLeSMk5NcSfWJxXgbHEbWoT
         ydQS8LJGPISJ+GIJnuQpeXgso52Zg1FwZMvlc050Gt//EW8VaBQ2IGL/nrw097WlUHAN
         N7xqIzhQ2L3xLZdmYtkp4usNyl5OvrEb7v2RI8RhSWEVOgOk7m3NYIIuecgfdJdQo7xS
         LJS3HVFKxfodbBfGp9yW8kffZED+lZHsN4dhe98m87HsApxOoc1j17/CEW/h5FmEBdju
         gBQCCrDiHSW5rsmCe3aT6kzvyb5WLNMtrCuZ1FSGl8Fu5EimapyCYtp5PLBEnS+pLHnS
         +w8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU66iMV1i0Dto5uV1I+PlRLtl57P3ZahAYOpcSYe2YXFfP8CYK8Mb7PJPBtiSoTfeyPQR/ImlqeI/IEWNwQ5NBsspF7@vger.kernel.org
X-Gm-Message-State: AOJu0YyAmGD6t3RummfqfueDUYwKi//NVy3cDkB4Kp/PbUm5IHy/HXIN
	qzy+Dh5wEAXhywnn47O4RcbTb5VL0UdFjSkfuhhUARD3Z2En1kQEXHxHQYxnn3rvfxI=
X-Gm-Gg: ATEYQzx2m7wJvCg+8YWSWUwnjaM5iwb7/bOpxkvW48erq66PzBcDE/SiqxwCIKvgahf
	iVFb9eyWDdroq8f4vU3I6P0J5Ua60KQViRqu/yFwFLmIQp7B5JPb7jiDeXy+H6Mtou+QhMXT6fd
	8Rv+MS0rZ4iUrEXeqVv/G3+GDnRXjKvkrTfe0gpLct9hs9DwV3L0PPrG9u+133Top3GPVQs5Guh
	0NjUiJeNYC4/LmkgqOtTcebd3q98OVkXZXrn5OxMJcCtJDG4dW9K6SVuvkOAkQS4WLD+ZXS7RN8
	yCWdPWltFwRHu9+fnvCskhGzyeVUXNiF+UvR1tGefTFUV71V5IztAk5CuqQZbu2xVb7TEU7YSFf
	rpWqFZ8xl0Vmhui7L3qTDRIsnKXGcq6DYPoYEnRuIiifXKGg2JoRxr6YtUQ+T3j1m0luh2BW/GX
	X8ZAcnmdY7HGXy7lqia+shL7+9oTUovCOzvJB13kYbYHUF/jYNoDPOHQ/bOLzpuiZJZLHbxOu0I
	g1bJPI=
X-Received: by 2002:a05:600c:4fc6:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-485566cfccfmr207577235e9.10.1773665353824;
        Mon, 16 Mar 2026 05:49:13 -0700 (PDT)
Received: from [192.168.0.154] (slou-04-b2-v4wan-170873-cust220.vm28.cable.virginm.net. [86.15.56.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48558fd09d8sm263111995e9.7.2026.03.16.05.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:49:13 -0700 (PDT)
Message-ID: <94dbe1e1-d706-47aa-abf5-f5d76aacf017@jguk.org>
Date: Mon, 16 Mar 2026 12:49:12 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jonathan Grant <jg@jguk.org>
Subject: [PATCH v2] platform/x86: asus-wmi: log thermal notification event
To: Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org, luke@ljones.dev
Cc: linux-kernel@vger.kernel.org
References: <56532bb3-c604-484e-9716-edda3758f627@jguk.org>
 <50cc3d4b-5e5a-422c-9abd-556488710988@amd.com>
Content-Language: en-GB
In-Reply-To: <50cc3d4b-5e5a-422c-9abd-556488710988@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From e110b7489b320588a7d334bf0a4e20e3e25784e7 Mon Sep 17 00:00:00 2001
From: Jonathan Grant <jg@jguk.org>
Date: Sat, 14 Mar 2026 02:11:09 +0000
Subject: [PATCH] platform/x86: asus-wmi: log thermal notification event

Print a diagnostic message when the ASUS WMI interface receives
event 0x6d. This event was observed shortly before thermal
shutdown on an ASUS N56VB under heavy system load. The message
helps diagnose unexpected thermal power-offs.

Signed-off-by: Jonathan Grant <jg@jguk.org>
---
v2:
 - follow kernel patch guidelines
 - rename event to NOTIFY_THERMAL
 - document that event 0x6d was observed before thermal shutdown
   on ASUS N56VB (BIOS WMI version 7.9, SFUN value 0x6a0877)
 - improve commit message description
 - remove stray blank line

 drivers/platform/x86/asus-wmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 7c0915e097ba..6ab3886ad28f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
 #define NOTIFY_KBD_TTP			0xae
 #define NOTIFY_LID_FLIP			0xfa
 #define NOTIFY_LID_FLIP_ROG		0xbd
+#define NOTIFY_THERMAL			0x6d
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
 
@@ -4590,7 +4591,6 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		if (asus->throttle_thermal_policy_dev)
 			platform_profile_cycle();
 		return;
-
 	}
 
 	if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
@@ -4598,7 +4598,10 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 
 	if (!sparse_keymap_report_event(asus->inputdev, code,
 					key_value, autorelease))
-		pr_info("Unknown key code 0x%x\n", code);
+		if (code == NOTIFY_THERMAL)
+			pr_info("Thermal state change\n");
+		else
+			pr_info("Unknown key code 0x%x\n", code);
 }
 
 static void asus_wmi_notify(union acpi_object *obj, void *context)
-- 
2.43.0
