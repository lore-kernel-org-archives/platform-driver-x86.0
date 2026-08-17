Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAC40EBA6
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968816; cv=none; b=fwsfF5WMtmH+zM80EstEWKXvVnfISyZsGsEAmkBj1LIq96qAgoxbTrpNHaTL0jP5+suUjcz2Vw9x4nep7pOehJuYXev9my//vC3godPdYG69dyBwFXELNW2lE3AnpyfmZnqmQAXljPUXlAL/8aY4RZrW+sxf3xElTuQ/5Qjh2/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968816; c=relaxed/simple;
	bh=I3p7Ixbr3gMslM7s6tlFYx3Hm6njMqcDjl7yySj7DaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxwuHM4C+6Mn9pAV9Yj3fZzBffIUFDrrroIqVC3MfzGVwOpv7OZdEwa5q5JN8uApZsDahdjaayvrqLc3kolCrpVUXtVPTdH16mDx/gDG/bunOw511UZ7vIxqENlDrH+iVIneFEGIKQhuctBWLfGemQrCKYJsbQZ7PrwELM25aII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cr/Dqo24; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cr/Dqo24"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ee4399c3abso2178378a34.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 05:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786968813; x=1787573613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vSMRF6/GypLU9/RRslG/etgDsRm6mo7Tc/SOfBco6T8=;
        b=Cr/Dqo24cxzNRY9Jjd/0ydnHMb+2g9/W2zyCHobTqoqwGrohxn7WOnMjn+dQJAg//r
         1ipn2vQkJcv3IawR0iUMuituc+ZWd4z3ml5VIgfhsZ8B+HjrDdPKfqJeiUZPTwKZoFbd
         aXbW2oiDpValwqvqvC1GVktGu/GuWfZ71hlwiSD+ZjqT801mYAimvSzBaTWCdZ5qwDom
         IT4WbJ+PaBHV4db2BpHTJy5KoIFlDqH+7CkUYaOID/yWgH2qzwrxFXOJix02j127uem6
         Wk+pmE1Q/dzBKP/90L9MEQ/2cHmdxji3fmFAjXPBYR2nyqQw/ZxxlkB320dvN8pqW6gB
         gzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786968813; x=1787573613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSMRF6/GypLU9/RRslG/etgDsRm6mo7Tc/SOfBco6T8=;
        b=eugu4xhepY3EIgxZWBEeNjcqRnt3DWVCohjt54A8lgejn9wLyYRloAZnqPZGfhJQkZ
         MGvVOgUzMHYbAJXnO7/1ktsKrQ40dtz4O1U6pG6+JSd0fBnlz7Id7wE/wQVw4mPHxx7t
         +nR4Qe64DGd3OM50sYjv9HMef7dUeCf1ISzTwSlcEZ2QThTMklQ5CTu5dnx8fpxvy/Wr
         NGx3Vt4RERjVfJnVk8Y+X5uz2imMoubuxWL0Bs2XbsmyGhmruDvK+liqrnWVI8Fa7EHZ
         sUrD4Rrs0kgNw80ZcsibK47l5s0wxS7U9Nu9xuAOHW/Vd60AH9x8nV+IbwdSikdoD5Kx
         KWWw==
X-Gm-Message-State: AOJu0Ywk70Ezy9VvztyoHfsfaZ6uIP2IVnWaJ6NfQTi12Dm0Q9wk/FbB
	tB0qG015yvEqTpohxWR6eDPOMY5CVQ/Bj+8NKoQHdTh63XsxjLQRDGIJ
X-Gm-Gg: AR+sD10HIfe+GMJznpRMQKRlpdkARLXc4N28tDyXFv7GxtEkqd1aHB+OJzDViC3xFCd
	7rcuI0Z8pG0KdsbvManPHb+zUP/Y7H+xI2772/N5jShyGsZW+zSS3pQaY/I5gqiCThE1sdYmBjM
	CFQHpvhNh0amGbWCAEAFqz9Pi2rsZZTDo76r46IIt4gHbHkYyXjyMjUZxe8q7nd7qfbjj/oZJAT
	quxj+a87w+xGteFXCp9AWKYaSxYviliVl5SdoDABqF4YQIUiSnPlREwCYa91ZT79Ur+TfYid09O
	1bNIeI/O9f7kjoCbhlxWeBjQNOh0yzqZhJIzSmOs6DBC2JD+NbuXKXYMuxk20rUUuaMrkx//p2f
	OO/CZIyXrUbegB5uPTOoTOwwgBueQijGuSseghS1YEHdRKx9a+9K21rzDYl1VfsYzT7JUf/fo1I
	bTjkrL/55/PSihpYeQMwhWGpLKNx4qppdf3ngblcSCpu7vtiYYvWAISQQ0M02me2izjavidCHAR
	iONYJ47XmrjH32wVhayVds=
X-Received: by 2002:a05:6809:195:10b0:4b2:5529:ed46 with SMTP id 5614622812f47-4b25529f97emr12291871b6e.8.1786968813455;
        Mon, 17 Aug 2026 05:13:33 -0700 (PDT)
Received: from archlinux ([2409:40d5:5e:a2f1:79a4:a963:a64a:5d0e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2906a3edesm739007b6e.0.2026.08.17.05.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 05:13:32 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8BAA thermal profile support
Date: Mon, 17 Aug 2026 17:42:33 +0530
Message-ID: <20260817121233.44636-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN 16-wf0xxx (board ID: 8BAA) has the same WMI interface
as other OMEN boards and is compatible with the existing
omen_v1_board_params.

Add the DMI board name to hp_wmi_feature_boards[] table
and map it to omen_v1_board_params.

Without this entry, platform profile switching is unavailable,
preventing fan RPM reporting and controlling.

Tested on:

HP OMEN 16-wf0xxx

DMI Board Name: 8BAA

It has been confirmed that the platform profile is registered
successfully, and the fan RPMs are readable and controllable.

Link: https://www.reddit.com/r/HPOmen/comments/1siukdu/guide_native_fan_control_on_hp_omen_16wfx0xxx/

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 3c737ef3809c..5f4853d82de6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -255,6 +255,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BAA") },
+		.driver_data = (void *)&omen_v1_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BA9") },
 		.driver_data = (void *)&omen_v1_board_params,
-- 
2.55.0

