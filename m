Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215C736CDF3
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 20:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902965; cv=pass; b=duuix0uzxPpTC+co6TFzwupx6JDnK84TT5OStmJTmv0BMhr6+j9+VDdLkP5jJVdILCosd/YQ8Ig6QOsloTyqfrN4ntDzj0BwO8FdCOzsm4OPH7I1SXnPWAV6YBL8gzdzK5wDmQXdJG5/bpw/eZdGH616UmGJ28pABATsXNKHH4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902965; c=relaxed/simple;
	bh=i1ISeGcYSeJGsQxlq3CPLfSm6r/A8sqaabjLuKhnPIU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=l8GNdOIy1exM2zWKvG/+o8P3mK9Uh7q2IqfdXJDquq7VWhzkjvVMC7lBDk3j9FcDnrsLys2eQx4hgA/cAqgUztnQzPR2iP2QVENd0N7hIgcwNJM6mSusV0F0bnUXVHkZz5ivMSTFNIULdj2P9Ckw1j+3/cbsCyxdIkBxHKnFg+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgF4XH31; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgF4XH31"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5673804da95so1748177e0c.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 13:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774902962; cv=none;
        d=google.com; s=arc-20240605;
        b=FIUEsPH8AuKoNU4bSJ+klHK4WyjU7/qTDrNcYoRWzt5nU98N4UJwO22o27aaKqccQ3
         0tnuM6nWLMFz6xJpQhfv0ldG6RVeebvKLeHe+a7//IPR9ywIPvdCnT93aVgmGYKlugoG
         /rNweSdCXqmaooBbfGO3GOCWLGEpaHzk0KUL/BHB4f2kyUz5XWsoefYszO0szwEMs/ZQ
         SK5Eqk5p6yJeJ8AAVy6gSdxAdkizzBxbe5Fzd8Z5toATI02ZzPU21oIbCwZykO8qViFN
         ziDIuYkM6a2Od9Twvd07VCvawT4IB8ZPW9DYnV3949Rv0tafQTIBpiOmsrPUGAGy9B9W
         5c8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rDToa3OIBIO8goM+2fWqgtZfJ2cOD2nziJXxCF3UAbY=;
        fh=Ixa8zUO5SsJTTy1hViQ7uN+pTBKVVompkznp6ugtfp4=;
        b=HO3o8TU/WFI6R0mBXjAKxd31Mk5PCaRD1AOzWi0oButBwohqdK+Lb7Glm3IfjMDFGm
         vC7qXXr2myfjtxkd7RysPQ9uzezI+FPpB7KT88qJKDInZypIfKb3MZf2xJZxIyZPYHm1
         jiKoHGN7sB+oqNH6kLjHfWGJpgIAsAobj2awar434LzDsYhpGgWT64QTa84fhtajeres
         q/a63ZZv515b1VrC0SOJp2XvLh6SIMwcpe+fK+SxycutkqAX2cZ/6TrjUQdMthA/B4+G
         iCmIm/HCCPwknXVAooks/Q5GCBsJXS1oxiyhL5hqVuC9V6CNASBN6yIcltEAaNPTcvs2
         FOzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774902962; x=1775507762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rDToa3OIBIO8goM+2fWqgtZfJ2cOD2nziJXxCF3UAbY=;
        b=sgF4XH315wS2eYyZo53HxMM3b99BxRKolYcdgi/Bb1/R6yn63DRZ6mRUcsegMXQUrB
         TRs+k2C/MmB/PrMe2Kxo1uBCfXTduyL/YKyj3rm2j//OpizsmIZRmQvH2EUP6T4pjsbN
         BXYuQWu+H/MvTmblozzJXnFGBwZIzYdhaFyfMfOOYyHDAceX3T+QPXDO7Wio3DKVEXbS
         U/lwtZ1oawH6m4tEoNswm4KxcQ248NVTj92GW+f7DihVmYAtQnjsl3hTS9AE1tffUf/v
         5SiIWPbOBhUN9q/QPSYSFgIeSXL9xFFAXidV8XHawp5w5W8f1hZWfhrY4AL7hUAEcvaM
         ZBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774902962; x=1775507762;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDToa3OIBIO8goM+2fWqgtZfJ2cOD2nziJXxCF3UAbY=;
        b=MdKrsuNYZ8/XoXBv72MbX/pqq/mLakPSzToiYbsmen3ZBbh4Gd7P/7BE2VUUrgzXu8
         VoJ1bI4kKCOwSNtGEJATTtqC7lH3aDYcbBOV+QQM6BPdmMebEv/zxp37i5fJXiGJJaUO
         kOYJsLvscTEZOBueC6yNbf0JmAGynmcm4KI9lb2ii4WsgvYMS02Glkx8kdoOkztT6O4W
         ooCPlR5wMfMDerUjNA/Dx8hMoyJPRQyegiWHDhwPXw9XssCri9GPBurVZN64Vvgk8Z53
         t4YTWIpIk334l7LZjmlIfufb9mYrjQX8r1I9zZ+MI4ETaMtT4jmt4vIpb2QbhbMwSSOC
         ii5w==
X-Forwarded-Encrypted: i=1; AJvYcCVfT+etvInrbM0+Bbwp7vMTrlRuSmqqDPuaHijQipdo9r3zLdOTikaybqRB068gwIInHgQvp76Dbke7xVU8ERnBhZ90@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+i/d0Trp8PRnleIwbi3fL7jTw6AR4ostDMJ15I2ixgeov9kZ
	ipAC06O9HkqaBUAmIeiJBEhqGQgen1a3JjloKkWPFfksfN6HKaY68yNBlgtELf+9hPsHp8K3kxM
	1ZtEVWOQTpDTR/xOi6Vf8U1Dq2X9aIbM=
X-Gm-Gg: ATEYQzyY3WbWQMI+AkxsU+oLzTvmNuSkpS/HMvDanEk8iZXWDdwUALNdcSnB4STgQtq
	UTT+5ntnYLhLfFzkRCGpafvnpj5zB0DbMWiB2F42MAgm6mlt1txqVAXdbMjt2XLUMlL7wHd44K4
	YJCbb9UbYqvt5BV++bE2GQepwmi2F8+iE0lweTZK0cxFCn1DPgv8YrirkaAlwX+Iq9Xp0SnDwic
	ZcoEjTHIHAXRmoWBk6RcK6nw8UZAFDfuSOjL0mQ995PTo96yPCo8syzZcCWcI/f8lN1tGJD0Gmr
	OL5ppsE=
X-Received: by 2002:a05:6102:4b89:b0:602:8ad9:1f6f with SMTP id
 ada2fe7eead31-604f904cc47mr4758708137.5.1774902961997; Mon, 30 Mar 2026
 13:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0JTQsNC90LjQuNC7INCR0YPQu9Cz0LDRgNGM?= <bulgardaniil18@gmail.com>
Date: Mon, 30 Mar 2026 22:35:50 +0200
X-Gm-Features: AQROBzCzDvSQp2IiGmthrT5mtRJoU9aa_9VX8kQN4bDyCzLZ2kyC_pMmdLR9Ab8
Message-ID: <CAMPU55i_MPW_MHBsBfbnrO7T5Q68q1QmNgLVBPiqoh30kGw4Pw@mail.gmail.com>
Subject: [PATCH] platform/x86/lenovo: thinkpad_acpi: add named speed presets
 to fan_write_cmd_speed
To: hmh@hmh.eng.br, mpearson-lenovo@squebb.ca, 
	Derek John Clark <derekjohn.clark@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

platform/x86/lenovo: thinkpad_acpi: add named speed presets to
fan_write_cmd_speed

The fan_write_cmd_speed() function had a TODO comment suggesting
support for named speed presets (low, medium, high). Implement
this by mapping the preset names to the existing fan_speed_presets
enum values, following the same strstarts() pattern used in
fan_write_cmd_level().
Signed-off-by: Daniil Bulgar <bulgardaniil18@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c
b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 8982d92df..f10cebe11 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -7957,6 +7957,12 @@ enum fan_control_commands {
                         * and also watchdog cmd */
 };

+enum fan_speed_preset {
+    TPACPI_FAN_SPEED_LOW    = 65535 / 4,    /* 25% speed */
+    TPACPI_FAN_SPEED_MEDIUM    = 65535 / 2,    /* 50% speed */
+    TPACPI_FAN_SPEED_HIGH    = 65535,    /* 100% speed */
+};
+
 static bool fan_control_allowed;

 static enum fan_status_access_mode fan_status_access_mode;
@@ -9249,10 +9255,13 @@ static int fan_write_cmd_speed(const char *cmd, int *rc)
 {
     int speed;

-    /* TODO:
-    * Support speed <low> <medium> <high> ? */
-
-    if (sscanf(cmd, "speed %d", &speed) != 1)
+    if (strstarts(cmd, "speed low"))
+        speed = TPACPI_FAN_SPEED_LOW;
+    else if (strstarts(cmd, "speed medium"))
+        speed = TPACPI_FAN_SPEED_MEDIUM;
+    else if (strstarts(cmd, "speed high"))
+        speed = TPACPI_FAN_SPEED_HIGH;
+    else if (sscanf(cmd, "speed %d", &speed) != 1)
         return 0;

     *rc = fan_set_speed(speed);
-- 
2.53.0
