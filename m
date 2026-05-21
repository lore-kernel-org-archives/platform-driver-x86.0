Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C443D0908
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370456; cv=none; b=kMyrilCzLMEZSX3R4sd9Y6jk4M4fDeBRkdOYXKGxeMfrEm7DvJRSHSq8WVcJxjbf7MDcIYdMPcPV157z4gyUGoD4yDKqV+ZxxO+6yW5L+WJSiTbHJ86pSjBC9igCTmUVwkpL4NdfAbuL4zE6HtABDqTrulZJSFb31vEz7+9fYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370456; c=relaxed/simple;
	bh=zkotOTyMCtI02PrFrLWk/ZFf78zZdvVleM726E3el+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOCKX5V7un5AqzXWxZK7VjOkKw5agnsxzVHVB2Lw8Nd685gmwF3tOlXHdeCEMAM++eP9H4OKqRX5bv8Eh2+MO0Bk5io+dEcEgEDq1euavFvtfZXWB2pXlLJD8Goe64SwPhvZyct9x9R9An3hNDbWGybZYDoIlfpunby9NAB3/zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFS7WFdA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFS7WFdA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bd266f6fc0so30371925ad.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779370454; x=1779975254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDnPWf5eerkDARg0gfgA6Meve7NKlg4wnJYGkpBxkII=;
        b=AFS7WFdA7oAo58kVrASV3LK+/6HhwpULFGukcGIkITGvH2dvaZjzYFcUbqgj968tS6
         yHd+A1uJMb1akURXaHRhQf0wQTLXTHYH9wwnFXxjoVLWUgOzx73YWqe2c4COrgc2Rctr
         zZoU5Hsozi2b+SRPDPU1PJbmUdskBGY8pvLPd5azXt76rUqxhtHTknH+klJSL38bVbbq
         XOHaoXAsteskn3LaXrlCcEOid9HcLQ3Y8jpDzxZwVmIEYWuRAbTkMe9r+1KQAX5wFn5y
         Tx/Cc7xfYyd7GELHimiBMkgpjKvsY6ySURuv8DE8606u5HbgfMASYK1mnZnf2CSEY2rM
         7t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370454; x=1779975254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDnPWf5eerkDARg0gfgA6Meve7NKlg4wnJYGkpBxkII=;
        b=H7g5eSNtEwesMJ/28taahy11kewuIIBb7kexQyvDpnlV6GT4f34US/+DxC/Zk+7Lnj
         Py+HQvEBEnjI730lJ0bBDWF7PeR0Y36ork3jjIldrqASoZcGbOG254Pc9djCVQMhJu2h
         Pks/wX5ytMXvEtMAzALFWgbHrtzc5zCRD0vDMJQOZmRy+hff0Eo92WOMIHKJOlPbn2+V
         l9SA7wp3r/q4/ZuG9/f9SOz/tHPW/V8ufBuDF50NMypKQ2YwiCGWcgG/ItEF3XErf0jR
         bPCM016YMjO7zVpURkQ3yK+S44SJD9EZvD58j3lM1scNCrBhh5buynW+gxER2KDW8WBH
         mi+g==
X-Gm-Message-State: AOJu0YzwUZY+WlbDeUZlrZKukVjyiujWPD1t6X/ibUYrRaX8cfImsScU
	ao7PLugKiy6pKKfKpI2EdbDQmrFuKDACZm7PxOwOhxdrd+rvW7nxJWEgE4Z2PnYNAic=
X-Gm-Gg: Acq92OE6kQ5sBVmCTvQJ7Eo7u9tuASs/0Ww3ejl6WsUsIjvNiXB/TydDfCkmF0U3YKu
	yqq4uS4JjnXGbuNUT0hM9RRwKaIjk5/0EFLIZCQ4Jcx9H8GzUPu1f3sUGcU9Xu2ttYvvMSq4ZWV
	qej9SCVFhxZaKE36w8hxi+h81quMg1OCK44on0+IcRCda0/JbOt5c9V8WpJv4P7opkq2lPMcAOY
	l4J3DyF5Da4rbTbW5/vfpfiUjpsARyTySCrDfgXFfSSd3oHBPArg2Cx08lEos2ihQc5gdwRcLnp
	FJAePzTEMBRoI3nvJ31zYEbjPSpCFWnvqSejs9NpjZrSYQoeoyzpOprn4oVpSS0/UncoqualztE
	jFyYa3WID/5AugmurQYIweOlKuCDmbJG5SgIlBDL4j5B8GkZWMEH+6SBajoV1KrdtFAlZcikHl/
	pKotBhdPfDdZ3QBOc0bjkFiVdZrJcZEUnHtQ==
X-Received: by 2002:a17:903:3c4f:b0:2b4:696b:7bb7 with SMTP id d9443c01a7336-2bea2ff1c38mr32407655ad.15.1779370454208;
        Thu, 21 May 2026 06:34:14 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:4610:9413:be16:7d6:5a67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea929d774sm12284785ad.32.2026.05.21.06.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:34:13 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v6 3/4] platform/x86: hp-wmi: Skip zero GPU RPM rows for fan speed delta
Date: Thu, 21 May 2026 19:03:50 +0530
Message-ID: <20260521133351.1512718-4-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521133351.1512718-1-radheykalra901@gmail.com>
References: <20260521133351.1512718-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Victus fan tables start with a CPU RPM value while the GPU RPM
field is zero. On board 8A3D the first row is cpu=23, gpu=0, noise=25,
followed by cpu=24, gpu=22, noise=26.

Derive gpu_delta from the first row that contains a non-zero GPU RPM
instead of unconditionally using row 0.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index ae2abb9..dcfffe6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2666,6 +2666,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	u8 min_rpm, max_rpm;
 	u8 cpu_rpm, gpu_rpm, noise_db;
 	int gpu_delta, i, num_entries, ret;
+	bool gpu_delta_found = false;
 	size_t header_size, entry_size;
 
 	/* Default behaviour on hwmon init is automatic mode */
@@ -2706,12 +2707,15 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

