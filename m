Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28414346E72
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704554; cv=none; b=IfkKKABHWK88TsfpfmbyJD+YxqbwoI4ekWTR2kFVPhFxXK9AotR3hHOqfWrTb6vLr4xcFzQMqlKONhBf7afZ4/+txAQZ2PROlvglFhpLa4CnAeSMckKkSRNKTdz28IKyYdLJKTXDilyQALKIBYGnjQCQ8SE1Wp1KPPlLuRGE/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704554; c=relaxed/simple;
	bh=CgvjRepLEJgFdo3A5HB6K2CcEmpnfY/BjLP7aUl1kfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZpELKF2cLTF8KFjxv/grb+NoVdaX0+QzlZqnaqjSrA3PWOHw5pv5sjDYUvyH4i03m5EBJVsmOsoteSStsnk2UwLUP49DPyUKH85CklgOYy9sjqDYbOiLi1eIN/f0RkHCXFmdEex57QTLDIZ3Tbx/U40iCo32B63W+bY0o61Lv2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bF1MSqVq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bF1MSqVq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-841513664bbso2088875b3a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779704552; x=1780309352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WOdAlwMgVRhURs3aQ/KpZ+S0DgSBMZniTufqWqYUDhM=;
        b=bF1MSqVq/wvrrvFbt84PfPaofzlLkdi9lS4FjuO5MVSOzrSeT65i0+2YNUHD4ZcFOT
         bvFuxQ2RMo7ax6wyEsmquToSJfkr6gJjVBFmeEIHn5UAGndAheiqxxtwHsu6jYP8RkX2
         jZsksVtq7kxvSHwe6zqvNztUxWhtkSYKUN5FZabavUEOXxZ0Tn1TCemFRgnlvc35W4KK
         JDxXt6YCUyq7oBKuuf962LSv9b9VWdQ83ohovrGDKtn2NwHnUnvHEpvmmr5WhkzFSpjx
         ahpcIbNZLLXitqGDe2eK9EY7Bak2suS1BY5iztr0Krx2ZEzIMeqTIlLmCKJA10KovHbq
         B/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779704552; x=1780309352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOdAlwMgVRhURs3aQ/KpZ+S0DgSBMZniTufqWqYUDhM=;
        b=rpr9iwAKjavRxy8uIka706gmiXRqLkx/mwk105e3pxCafw8AU/snLhoiixTv7ttSuX
         74Xt85Vdc4FwriyJWgbPylPclRZKGzLJiBu+6DNroaxaDfO8BWv+4g1nkQU7SIwURSj0
         Wp1ChkES4pDfC+vgQUb/WnhVrkbDLZC1CEQlqLqJO1N9FQusY8J+Ci+6SgkyxLbrOjh7
         DiW5CExuaItCcdcZCCp6FAQFSjd7i7WHaYGSMIFTorLm6F9yv75F0GVNYq027ItQNpxo
         IgL9rr4KzPdbF0WhuWLOayuDTvQJjjKdKJWTA0viI/2aJgb9IKUNA0WRXiwrTN1h31M6
         BKiw==
X-Gm-Message-State: AOJu0YzrqYWhk3sI6PdJP2Jj1jxVcnIFHkh/IiSi2v4/moF3rn317wxJ
	LKGRhwj9/VrZN1JwFi7E7JbRS+JNQSR53cPoPDf3XLXGRQJUa8rZiG1z
X-Gm-Gg: Acq92OG8QdCSV15NdgPl6N4QMjGQznujJ2YDC5fSlBg3+N9HaQFj1mpd/DrPxdaNeWM
	OAazGyejzDx8IsnI2yZDYdW5PpR3Z0XCcnCrwGcYpfcTVFaISjrA4peb94OPj0GUVCo+1/BDNps
	/6vKG1v3Xq1UBs5RktcgdMPdQNS2vN6MY6RzW+P9X6H+xvpXd1xhukHI0faR2kyY7WYNttLAawN
	JZLnpfabCweh0OtUsxlenf2+vBw5tnlrdLMZvuSGnduZw1tT9rE3nEOQVDKWkzLKXW1GmyjRocx
	kcpKyQH6Vj0ZUsMu36HxyLjnfIPzLvnSD5ejqJ4iYUDf9p05KaRoO2pcBaHI+zsss1AFiDqrmb8
	jQaeCl1KxP1mKjki7Ex51eazSh569RNTfD+SWQSYDBwQcjSAwPipSZWH+WSRTroz5iHukOndpER
	sw4+C+5LQaaQEVPPce5qY56dkF2PJPtYWR5/dcdsL0phzTd33LeNmymOedBOTJuNDY+BBB1ZVTL
	LgwF0dl4Ob8RNSGjSql
X-Received: by 2002:a05:6a00:2d9c:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-84161197e43mr10255565b3a.21.1779704552426;
        Mon, 25 May 2026 03:22:32 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:36f2:f474:be1d:cad7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fbb66bsm8970812b3a.45.2026.05.25.03.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:22:32 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	=?UTF-8?q?Alberto=20Esca=C3=B1o?= <alberto_e_88@yahoo.es>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: Add support for Omen 16-ap0xxx (8D26)
Date: Mon, 25 May 2026 15:52:26 +0530
Message-ID: <20260525102226.56300-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The HP Omen 16-ap0xxx (board ID: 8D26) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_legacy_thermal_params.

Testing on board 8D26 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Alberto Escaño <alberto_e_88@yahoo.es>
Reported-by: Alberto Escaño <alberto_e_88@yahoo.es>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221514
Cc: <stable@vger.kernel.org> # v6.18+
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d176c..a2ec303f60b0 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -241,6 +241,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D26") },
+		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&victus_s_thermal_params,
-- 
2.54.0

