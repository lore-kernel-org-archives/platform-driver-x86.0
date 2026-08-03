Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C0E314A8E
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767467; cv=none; b=mZkESjakcslX4WduRvDjg0/sppPFFGgz+C4sd+nL7i49r5WdLLCXR1JpLRUVa2YNDQITHg4qM5iVIdnVnu9/q3x98cpCPWo4zJyGY0RkeLcJD4R0i9QfHNKq1s10zVMWsXJNOhDvgfBB5XxlY584e//RouAF5rh7tS72jJBW0TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767467; c=relaxed/simple;
	bh=ATKvWl1DnIWOGmblRvXvDZPEp2qoEl7qqfbdLw7wl3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNOxl0T+OSnvEl5sD1BYGyyruZbSYd4xMJX6Y5ey7TyK4HsIj9LrwxsoxcxrowRJl/n7esUP43ZmKN4Q+VDjMr7qrro9EQhFqajHXwJ5O1fGsNokcfq5RqX5sjwM3aKuWQYEu/FaN64fmv4IZQKsZOV4HemCZFcZ/Lwd1RepApo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/kKcjoQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/kKcjoQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso14536325e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767460; x=1786372260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsPuPtlEtpcGKckM/9mBE7kyPjRyXeXRo57w8zpUvug=;
        b=q/kKcjoQurIZJba6iduZ88NlhqYGrmWV436lC2J0r0OgfmhlU7HLHy/ChZnQzH0E+0
         qbxbaWsVedKx0nfbGxpenB1MLHF2P07CU1sowJP/YxrDtrZ71bDRX+naeA7h7EFExxkL
         x3955u55v7nCzXii+GD4Q+ItEoYZnUxeO0lDGv7uPxWhIP6SZN8aRMu1dTN59dd1BN8N
         5pQuOvoyH7wNcCitaOdcwejW+KZcWUFlxUKqHh2DCMwVTcU363/RytNbOgPHRyS+QO1i
         buofXTMeGWKRokWQgOv2mMgp6Kt69XtiwdOch7CwZM284irOTQBB7wq7sRaYLj0AlnyI
         tdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767460; x=1786372260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GsPuPtlEtpcGKckM/9mBE7kyPjRyXeXRo57w8zpUvug=;
        b=o78JuZjsm2+PosMUMozldd3q/mh3LlojvQS7ofCl3efwjVHlPtfmO7HHs6nvMzqUKT
         jwrEy3AiRLntmmb5R79NJC/drJ02jRxFXidZmns4psRLwALY+rjE63s75ZuMpSFK6+Tj
         PL4iflQwrtNvQKrMxVM86ugNUY1GglcrSZa3HWC3S6NRdLisXNucgnbCcoYRWxEZw/1n
         my1guz+ElXupll6oVn2dqiZYOAlv0jhYRidOrAH2Segc1KUQ2t/911y8uBFu6Ocz1keH
         IVp50TSknHmIsKbR8W3/RdarYvAQ+UGu8/tcGMFNGGN5jcEi9OWG0S/G90f9iDxt2ZJk
         zNVg==
X-Gm-Message-State: AOJu0YwvlEJ8IQWk2YTemPkxY4zPovUDDkO9UAK4YUCONH2uM3DQPwn8
	8qjUbWpVBlTVpDP633Vdd/LVHfnBJ0trnGnwbo+BCaaI89bwQYpgal4hCcLhM96QHM8=
X-Gm-Gg: AR+sD13JuY6SFJA/L8NvQdspQBEx4jNQYlev4N/DloS5nFP8DPuy95Mxkxa72OjYixz
	BNUrRvW57aqzDIShSbu42OuZL5aZL9tRljNFcUGzCnoLTXExKqdIroiiijvOjhuW7tSZnrG581o
	4DXAyw3wo0j+0ykSifciHC9xjoHVM8Dp409KeQiqrIeNzdsTAxXfzMbBHzBeDEm5Vwg3ITPPywl
	cVKXaNupDeTrr+obfg/TVx06YvoS/jUHUueXnqqEC8Zsinsgjpq2Nhp0ejupQbdh+IAEdBgrQr/
	TGFsf4Mjgiv4GLS48sgNvUiYM3kBk6ECUsNIRN8tZ1FklAD09nHQkF99MTFH6fnVtV62ef5CNWt
	4wFlk/gJaIt5uh/25VV/lyIOvHOjdsVRaqzuTz1SRIShMk+IJNji5WxFZ+6oG2ae8Onn7UrkJOR
	uCCzKbPrmhRrdh/GaHPw4RQvBikYfb4RcGbKjdf8YXNf/7Oym3149TQeSfMDRgeGST5EU7mfB3b
	MMd2KODwEafM6wcJ9qlWMyimZEE5QoGEFdVuDMvpw==
X-Received: by 2002:a05:600c:840f:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-4980c5fa29amr206226845e9.0.1785767460389;
        Mon, 03 Aug 2026 07:31:00 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:31:00 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 04/13] platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth token
Date: Mon,  3 Aug 2026 19:30:27 +0500
Message-ID: <20260803143037.93105-5-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803143037.93105-1-meatuni001@gmail.com>
References: <20260803143037.93105-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_calculate_security_buffer() special-cases an empty authentication
string and returns a fixed 4 bytes (sizeof(u16) * 2). But
hp_populate_security_buffer() does not special-case that same input:
for any authentication string that does not start with BEAM_PREFIX,
including the empty string, it always builds "UTF_PREFIX +
authentication" and converts the result to UTF-16, writing a 2-byte
length header plus 2 bytes per character of "<utf-16/>" (9 characters),
20 bytes total, regardless of how long "authentication" itself is.

The caller, hp_set_attribute(), sizes its kmalloc() buffer using
hp_calculate_security_buffer()'s return value, so for an empty
authentication token it allocates 4 bytes for the security area but
hp_populate_security_buffer() then writes 20 bytes into it, a 16-byte
heap buffer overflow.

The authentication token used here is the current admin/setup
password, which is an empty string by default until one is
configured. Any write to a writable BIOS attribute while no admin
password has been set reaches this path.

Fix by removing the special-case short return for an empty string in
hp_calculate_security_buffer() and letting the normal formula run,
which already accounts for the UTF_PREFIX correctly for the non-empty
case; for an empty string this naturally yields the same 20 bytes
that hp_populate_security_buffer() writes.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 4d94e48c1a4c..2d4a3720f80c 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -48,7 +48,7 @@ size_t hp_calculate_security_buffer(const char *authentication)
 
 	authlen = strlen(authentication);
 	if (!authlen)
-		return sizeof(u16) * 2;
+		return sizeof(u16) + strlen(UTF_PREFIX) * sizeof(u16);
 
 	size = sizeof(u16) + authlen * sizeof(u16);
 	if (!strstarts(authentication, BEAM_PREFIX))
-- 
2.55.0

